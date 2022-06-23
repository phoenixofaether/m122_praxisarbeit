# Projekt Dokumentation

## Lösungsdesign

Anhand der Analyse wurde folgendes Lösungsdesign entworfen.

### Parameter

| Parametername   | Erklärung                         | Typ    | Standart |
| --------------- | --------------------------------- | ------ | -------- |
| config_path     | Pfad zu deinem Konfigurationsfile | string |          |
| users_list_path | Pfad zu File mit Liste von Usern  | string | root     |

### Ablauf der Automation

Siehe Activity Diagramm.

### Format von Konfigurationsdatei

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
| skeleton_dir       | Pfad zu wo Gruppenspezifische Skeleton-Verzeichnisse sind                | string |

## Abgrenzungen zum Lösungsdesign

Das Programm entspricht grösstenteils dem Lösungsdesign. Die einzigen Unterschiede liegen darin, dass anstatt Parameter eine Konfigurationsdatei verwendet wird.
