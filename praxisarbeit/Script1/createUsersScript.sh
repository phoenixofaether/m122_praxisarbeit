#!/bin/bash
# A Bash script, that creates users and groups based on a config file and a file that contains a list of users
# $config_path - type string - path to your configuration file
#	- 
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

log()
{
  echo "$1"
  cat $1 >> $log_path
}

cat $users_list_path | while read username groupname fullname; do
	sekeltonDir = "/etc/skel"
	# check if group exists
	if ! grep -q $groupname /etc/group; then
		if [ "$create_group" -eq "0" ]; then
			log 'Warning: group "$groupname" doesnt exist.'
			continue
		fi
		groupadd -f $groupname
	else
		if [ ! grep -w $backup_file $groupname ]; then
			log 'Warning: Home directory of $groupname isnt beeing updated'
		fi
	fi

	if [ -f $skeleton_dir$groupname ]; then 
		sekeltonDir = $skeleton_dir$groupname
	fi
	
	# check if user exists
	if id "$username" &>/dev/null; then
		log 'Warning: User "$username" already exists.'
		homedir="$(getent passwd user | cut -d: -f6)";
		if [ ! -d "$homedir" ]; then
			mkdir /users/$username
			cp $sekeltonDir /users/$username
		fi
	else
		useradd -g $groupname -c $fullname -k $sekeltonDir -m -p $password $username
		passwd --expire $username
	fi
		

done
# +set xv