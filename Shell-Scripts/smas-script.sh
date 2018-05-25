#!/bin/bash
#Skript:  Arbeit-System-einrichten.sh
#Berechtigung:  Skript mit erhöten Rechten ausführen
#Beschreibung:  Filestruktur vorbereiten
#               Apache, MariaDB, PHP und Tomcat installieren
#               Tomcat einrichten
#Autor:   Joel Siewerdt
#Version: 0.5
#Datum:   23.05.2018

##Step1 - Filestruktur vorbereiten
#Link /home/prod erstellen, welcher auf /opt/ verweist. Wenn vorhanden, ersetzen
ln -sfn /opt /home/prod
#Ordner erstellen, wenn nicht vorhanden
mkdir -p /opt/tomcat8
#Log Datei
 /home/sij/Documents/log.txt
log="/home/sij/Documents/log.txt"
echo "$(date +%Y-%m-%d):" > $log

##Step2 - Software installieren, wenn nicht vorhanden
#Array mit Software, welche installiert werden soll
softwareToInstall=("apache2" "mariadb-server" "php7.2" "php7.2-mysql" "libapache2-mod-php" "openjdk-8-jdk")
#aktuell installierte Software in Var speichern
getInstalledSoftware=$(apt --installed list | cut -f1 -d'/')
#Für jede zu installierende Software folgenden Code durchgehen
for i in "${softwareToInstall[@]}"
do
  #Wenn die zu installierende Software nicht vorhanden ist
  if [[ $getInstalledSoftware != *$i* ]]
  then
    #Installieren
    aptitude --assume-yes install $i
    #abbrechen, wenn Installation fehlschlägt
    if [ $? -ne 0 ]
    then
      echo "$i konnte nicht installiert werden" >> $log
      exit 5 #Installationsproblem
    fi
    echo "$i wurde installiert" >> $log
  else
    #Falls bereits vorhanden, informieren
    echo "$i ist bereits installiert" >> $log
  fi
done

##Step3 - Tomcat herunterladen
tomcatVersion="apache-tomcat-8.5.31"
#Tomcat ins /tmp Verzeichnis herunterladen
wget -P /tmp/ http://mirror.switch.ch/mirror/apache/dist/tomcat/tomcat-8/v8.5.31/bin/$tomcatVersion.tar.gz
if [ $? -ne 0 ]
then
  echo "Die Tomcat Version $tomcatVersion konnte nicht heruntergeladen werden" >> $log
  exit 6 #Downloadproblem
fi
echo "$tomcatVersion wurde heruntergeladen" >> $log
#Tomcat ins Verzeichnis /opt/tomcat8 entpacken. Wenn vorhanden überschreiben
tar -xf /tmp/$tomcatVersion.tar.gz -C /opt/tomcat8/
if [ $? -ne 0 ]
then
  echo "Entpacken von $tomcatVersion ist fehlgeschlagen" >> $log
  exit 7 #Problem beim entpacken
fi
echo "$tomcatVersion wurde entpackt" >> $log
#Link erstellen
ln -sfn /opt/tomcat8/$tomcatVersion/ /opt/tomcat
#Download löschen, wenn vorhanden
rm -f /tmp/$tomcatVersion.tar.gz

##Step4 - Tomcat einrichten
#Umgebungsvariabeln einrichten
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /home/sij/.bashrc
echo "export CATALINA_HOME=/opt/tomcat" >> /home/sij/.bashrc
#Tomcat Benutzer einrichten
groupadd tomcat
useradd -s /sbin/nologin -g tomcat -d /opt/tomcat/$tomcatVersion tomcat
#Es muss noch das Benutzer password gesetzt werden
passwd tomcat
#Owner Benutzer und Gruppe anpassen, sowie die Benutzerrechte
chown -R tomcat:tomcat /opt/tomcat/
chmod 775 /opt/tomcat/ -R
#Service Datei erstellen und mit dem korrekten Inhalt füllen
echo "[Unit]" > /etc/systemd/system/tomcat.service
echo "Description=Apache Tomcat Web Application Container" >> /etc/systemd/system/tomcat.service
echo "After=network.target" >> /etc/systemd/system/tomcat.service
echo "[Service]" >> /etc/systemd/system/tomcat.service
echo "Type=forking" >> /etc/systemd/system/tomcat.service
echo "Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_HOME=/opt/tomcat" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_BASE=/opt/tomcat" >> /etc/systemd/system/tomcat.service
echo "Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'" >> /etc/systemd/system/tomcat.service
echo "Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'" >> /etc/systemd/system/tomcat.service
echo "ExecStart=/opt/tomcat/bin/startup.sh" >> /etc/systemd/system/tomcat.service
echo "ExecStop=/opt/tomcat/bin/shutdown.sh" >> /etc/systemd/system/tomcat.service
echo "User=tomcat" >> /etc/systemd/system/tomcat.service
echo "Group=tomcat" >> /etc/systemd/system/tomcat.service
echo "UMask=0007" >> /etc/systemd/system/tomcat.service
echo "RestartSec=10" >> /etc/systemd/system/tomcat.service
echo "Restart=always" >> /etc/systemd/system/tomcat.service
echo "[Install]" >> /etc/systemd/system/tomcat.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/tomcat.service
#Dienst einrichten
systemctl daemon-reload
systemctl enable tomcat
systemctl start tomcat
