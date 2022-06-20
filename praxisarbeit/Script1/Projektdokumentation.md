# Projekt Dokumentation

## Lösungsdesign
Anhand der Analyse wurde folgendes Lösungsdesign entworfen.

### Parameter

| Parametername | Description                                                                                            | Typ     | Default |
| ------------- | ------------------------------------------------------------------------------------------------------ | ------- | ------- |
| config_path   | Pfad zu deinem Konfigurationsfile                                                                      | string  |         |
| password      | Default Passwort für Erstellte User                                                                    | string  | root    |
| log_path      | Pfad wo die Logdatei abgespeichert werden soll                                                         | string  | default |
| create_group  | 1 falls nicht Existierende Gruppen erstellt werden sollen, 0 falls eine Warnung ausgegeben werden soll | boolean | 0       |

### Ablauf der Automation

TODO: Hier kommt ihr UML-Activity Diagramm

### Format von Konfigurationsdatei
Dateiname: Name.conf

```
<username> <groupname> <vorname nachname>
```

## Abgrenzungen zum Lösungsdesign

TODO: Nachdem das Programm verwirklicht wurde, hier die Unterschiede von der Implementation zum Lösungsdesign beschreiben (was wurde anders gemacht, was wurde nicht gemacht, was wurde zusaetzlich gemacht)