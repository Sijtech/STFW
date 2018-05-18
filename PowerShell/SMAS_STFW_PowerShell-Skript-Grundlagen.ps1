#SMAS_STFW_PowerShell-Skript-Grundlagen.pdf

#Aufgabe 1, Seite 57
Get-EventLog -LogName System -EntryTyp Error,Warning -Newest 15 -Message *Dienst*
Get-EventLog -LogName System -EntryTyp Error,Warning -Message *Dienst* -Index 7429 | Format-Table -Wrap

#Aufgabe 2, Seite 67
Get-Date -UFormat %d.%m.%Y #Datum anzeigen udn formatieren
Get-Date -DisplayHint Date #Datum anzeigen
Get-Date -UFormat %R #Zeit anzeigen
Get-Date -DisplayHint Time #Zeit anzeigen
Get-Date -UFormat %Y%m%d #Datum anzeigen udn formatieren
Get-Date -UFormat %b #gekürzten Monat anzeigen (z.B: Apr)
Get-Date -Year 1992 -Month 08 -Day 15 -UFormat %A #Tag eines bestimmten Datums anzeigen

