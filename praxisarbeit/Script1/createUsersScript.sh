#!/bin/bash
# A Bash script, that creates users and groups based on a config file and a file that contains a list of users
# $config_path - type string - path to your configuration file
#	- password - type string - encrypted default password
#	- log_path - type string - path to log file
#	- create_group - type string - 1 if non existing groups should be created or 0 if 
#	- backup_file - type string - path to where it is defined which groups are backuped
#	- skeleton_dir - type string - path to where groupspecific skeletonfolders are safed
# $users_list_path - type string - path to a file that contains the users that should be created

set -xv

config_path="$1"
users_list_path="$2"

if [ -z "$config_path" ]; then 
	echo "Error: Missing parameter config_path."
	exit
fi

if [ -z "$users_list_path" ]; then 
	echo "Error: Missing parameter users_list_path."
	exit
fi

if [ ! -f $config_path ]; then
	echo 'Error: "$config_path" doesnt exist.'	
	exit
fi

if [ ! -f $users_list_path ]; then
	echo 'Error: "$users_list_path" doesnt exist.'	
	exit
fi
	
. "$config_path"

if [ ! -z "$log_path" ]; then
	cat > $log_path
fi

log()
{
  echo "$1"
  cat $1 >> $log_path
}

cat $users_list_path | while read username groupname fullname; do
	skeletonDir="/etc/skel"
	# check if group exists
	if ! grep -q $groupname /etc/group; then
		if [ "$create_group" -eq "0" ]; then
			log 'Warning: group "$groupname" doesnt exist.'
			continue
		fi
		groupadd -f $groupname
	#check if groupname is beeing backuped
	#else
		
		#if [ ! grep -Fxq $backup_file $groupname ]; then
		#	log 'Warning: Home directory of $groupname isnt beeing updated'
		#fi
	fi

	if [ -f $skeleton_dir$groupname ]; then 
		skeletonDir=$skeleton_dir$groupname
	fi
	
	# check if user exists
	if id "$username" &>/dev/null; then
		log 'Warning: User "$username" already exists.'
		homedir="$(getent passwd user | cut -d: -f6)";
		if [ ! -d "$homedir" ]; then
			mkdir -p /users/$username
			cp $skeletonDir /users/$username
		fi
	else
		useradd -m -g $groupname -c $fullname -k $skeletonDir -p $password $username
		passwd --expire $username
	fi
		

done
# +set xv