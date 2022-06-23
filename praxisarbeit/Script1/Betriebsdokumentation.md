# Betriebsdokumentation

## Einführungstext

Das Skript kann User, die in einem Konfigurationsfile definiert sind, erstellen. Zusätzlich ist es möglich ein Default Password zu definieren. Dazu wird das Home-Verzeichniss automatisch erstellt. Es ist auch möglich nicht existente Gruppen automatisch erstellen zu lassen.

## Installationsanleitung für Administratoren

### Installation

TODO: Wie ist das Skript zu installieren. (z.B. apt-get install ... oder tar xvf .... oder ...)

### Konfiguration

### Format von Konfigurationsdatei

Die erste Konfigurationsdatei, hier mit dem Namen "config.\*", ist dafür da dem Programm mitzuteilen welche User erstellt werden sollen. Diese Datei darf von einem beliebigen Typ sein.
Die zweite Konfigurationsdatei, hier mit dem Namen "createUsersScript.conf", ist dafür da verschiedene gleichbleibende Einstellungen zu setzten. Diese Datei muss eine .conf Datei sein.
Beispiele dafür sind im Repo zu finden.

Dateiname: config.\*

```
<username> <groupname> <vorname nachname>
```

Dateiname: createUsersScript.conf

```
password=
log_path=
create_group=
backup_file=
skeleton_dir=
```

#### Konfigurationsmöglichkeiten

| Konfigurationsname | Erklärung                                                                | Typ    |
| ------------------ | ------------------------------------------------------------------------ | ------ |
| password           | Standartpasswort für User                                                | string |
| log_path           | Pfad wo Log-File abgespeichert werden soll                               | string |
| create_group       | 1 falls nicht-existierende Gruppen erstellt werden sollen, 0 falls nicht | string |
| backup_file        | Pfad zu File wo Backupgruppen definiert werden                           | string |
| skeleton_dir       | Pfad zu wo Gruppenspezifische Skeleton-Verzeichnisse zu finden sind      | string |

....

## Bediensanleitung Benutzer

Wichtig, das Gerät muss Ubuntu installiert haben! (getestet mit Version 20.04.4)
Bevor man das Skript aufruft, muss man zuerst überprüfen, dass beide Konfigurationsdateien vorhanden und ausgefüllt sind.
Danach kann man das Skript wie folgt mit in einer Kommandozeile aufrufen.
Wichtig, das Skript braucht sudo Berechtigungen!

```
createUsersScript.sh config.* createUsersScript.conf
```

Das Log-File wird dann am definierten Ort abgespeichert
