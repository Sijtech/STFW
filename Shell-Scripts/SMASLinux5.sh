#2 Erstelle mithilfe von sed eine Liste aller Einträge mit den Berechtigungen im Homeverzeichnis. Es sollen nur die Rechte und der Dateiname angezeigt werden
ls -l $HOME | sed 's/ .* / /'
