#!/bin/sh

echo ### Setting random passwords for root, vagrant and ubuntu user ###
#PASS=`tr -dc A-Za-z0-9_ < /dev/urandom | head -c12`
PASS=vmware
echo "ubuntu:$PASS" | chpasswd
echo "root:$PASS" | chpasswd
echo "vagrant:$PASS" | chpasswd

echo ### Updating  ###
apt-get update
apt-get -y upgrade
apt-get -y install fontconfig
apt-get -y install curl
apt-get -y install libXinerama1
apt-get -y install libcups*
apt-get -y install libreoffice-base libreoffice-base-core libreoffice-base-drivers

releasename=alfresco-content-services-installer-5.2.0-linux-x64.bin

# Change working dir to vagrant directory
cd /vagrant

# Install Alfresco using the key file
./$releasename --mode unattended --prefix /opt/alfresco --alfresco_admin_password admin --unattendedmodeui minimal

# Copy extensions and amp modules
cd /opt/alfresco
cp -Rv /vagrant/shared-classes/* tomcat/shared/classes/
cp -Rv /vagrant/shared-lib/* tomcat/shared/lib/
cp -Rv /vagrant/amps-repo/* amps/
cp -Rv /vagrant/amps-share/* amps_share/
mkdir -p tomcat/shared/classes/alfresco/extension/license/
cp -v /vagrant/license/* tomcat/shared/classes/alfresco/extension/license/

# Install amp modules into alfresco.war and share.war
mmt="/opt/alfresco/java/bin/java -jar /opt/alfresco/bin/alfresco-mmt.jar"
$mmt install -force amps tomcat/webapps/alfresco.war -directory $*
$mmt list tomcat/webapps/alfresco.war
$mmt install -force amps_share tomcat/webapps/share.war -directory $*
$mmt list tomcat/webapps/share.war

# Start Alfresco after installation
service alfresco start 

