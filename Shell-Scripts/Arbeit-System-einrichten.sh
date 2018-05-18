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
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /home/sij/.bashrc
echo "export CATALINA_HOME=/opt/tomcat" >> /home/sij/.bashrc
