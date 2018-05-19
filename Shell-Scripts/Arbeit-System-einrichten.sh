#!/bin/bash
##Step1 - Filestruktur vorbereiten
#Link /home/prod erstellen, welcher auf /opt/ verweist. Wenn vorhanden, ersetzen
ln -sfn /opt /home/prod
#Ordner erstellen, wenn nicht vorhanden
mkdir -p /opt/tomcat8

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
    echo "aptitude --assume-yes install $i"
    aptitude --assume-yes install $i
  else
    #Falls bereits vorhanden, informieren
    echo "Already installed: $i"
  fi
done

##Step3 - Tomcat herunterladen
#Tomcat ins /tmp Verzeichnis herunterladen
wget -P /tmp/ http://mirror.switch.ch/mirror/apache/dist/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz
#Tomcat ins Verzeichnis /opt/tomcat8 entpacken. Wenn vorhanden überschreiben
tar -xf /tmp/apache-tomcat-8.5.31.tar.gz -C /opt/tomcat8/
#Link erstellen
ln -sfn /opt/tomcat8/apache-tomcat-8.5.31/ /opt/tomcat
#Download löschen
rm /tmp/apache-tomcat-8.5.31.tar.gz

##Step4 - Tomcat einrichten
#Umgebungsvariabeln einrichten
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /home/sij/.bashrc
echo "export CATALINA_HOME=/opt/tomcat" >> /home/sij/.bashrc
#Tomcat Benutzer einrichten
groupadd tomcat
useradd -s /sbin/nologin -g tomcat -d /usr/local/apache-tomcat-8.5.29 tomcat
#Es muss noch das Benutzer password gesetzt werden
passwd tomcat
#Owner Benutzer und Gruppe anpassen, sowie die Benutzerrechte
chown -R tomcat:tomcat /usr/local/apache-tomcat-8.5.29
chmod 775 /usr/local/apache-tomcat-8.5.29 -R
#Service Datei erstellen
touch /etc/systemd/system/tomcat.service
#Und mit dem korrekten Inhalt füllen
echo "[Unit]" > /etc/systemd/system/tomcat.service
echo "Description=Apache Tomcat Web Application Container" >> /etc/systemd/system/tomcat.service
echo "After=network.target" >> /etc/systemd/system/tomcat.service
echo "[Service]" >> /etc/systemd/system/tomcat.service
echo "Type=forking" >> /etc/systemd/system/tomcat.service
echo "Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/jre" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_PID=/usr/local/apache-tomcat-8.5.29" >> /etc/systemd/system/tomcat.service
echo "/temp/tomcat.pid" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_HOME=/usr/local/apache-tomcat-8.5.29" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_BASE=/usr/local/apache-tomcat-8.5.29" >> /etc/systemd/system/tomcat.service
echo "Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'" >> /etc/systemd/system/tomcat.service
echo "Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'" >> /etc/systemd/system/tomcat.service
echo "ExecStart=/usr/local/apache-tomcat-8.5.29" >> /etc/systemd/system/tomcat.service
echo "/bin/startup.sh" >> /etc/systemd/system/tomcat.service
echo "ExecStop=/usr/local/apache-tomcat-8.5.29" >> /etc/systemd/system/tomcat.service
echo "/bin/shutdown.sh" >> /etc/systemd/system/tomcat.service
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
