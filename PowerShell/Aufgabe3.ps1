#Aufgabe3
#a
Get-Date -UFormat %V
Get-Date -Year 1992 -Month 08 -Day 15 -UFormat %V
#b
(Get-Date).AddHours(-24)
#c
Get-EventLog -LogName System -After (Get-Date).AddHours(-24) -EntryType Error, Warning | Out-GridView
#d
Get-Service -name S* | Where-Object {$_.status -eq "running"}
Get-Service S* | Where status -eq "running"