#!/bin/bash
LOGFILE=/opt/tomcat/logs/catalina.out
#erste Zeile aus dem Logfile | erste Spalte
LOGDATE=`head -1 ${LOGFILE} | awk '{print $1;}'`
echo "-------------------------------------------------------------"
echo "client browser's since ${LOGDATE} - overview"
echo "-------------------------------------------------------------"

#sij - nur Browsernamen ohne Version
grep "BrowserName:" $LOGFILE | cut -d':' -f2 | sort | cut -d'-' -f1 | uniq -c | sort -rn

echo "   ----------------------------------------------------------"
echo "   client browser's since ${LOGDATE} - detailed"
echo "   ----------------------------------------------------------"
#phb
grep "BrowserName:" $LOGFILE | cut -d':' -f2 | sort | uniq -c | sort -rn
#sij - alle Firefox Nummern anzeigen
#grep "BrowserName:" $LOGFILE | cut -d':' -f2 | sort | uniq -c | sort -rn | grep Firefox | awk '{print $1}'
echo "-------------------------------------------------------------"
echo "client OS since ${LOGDATE}"
echo "-------------------------------------------------------------"

grep "OperatingSystem:" ${LOGFILE} | cut -d':' -f2 | sort | uniq -c | sort -rn

echo "-------------------------------------------------------------"
echo "-------------------------------------------------------------"
echo "IP address since ${LOGDATE}"
echo "-------------------------------------------------------------"
#not bad - grep "cust/user" ${LOGFILE} | tr -d ',' | grep "ip:" | cut -d' ' -f5-7 | sort | sed 's/>.*//' |
grep "cust/user" ${LOGFILE} | tr -d ',' | grep "ip:" | cut -d' ' -f5-7 | grep "ip:" |  cut -d',' -f1 | cut -d'>' -f1 | cut -d'j' -f1 |  sort | uniq
