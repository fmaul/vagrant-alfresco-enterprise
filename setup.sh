#!/bin/sh

apt-get update
apt-get -y upgrade
apt-get -y install fontconfig
apt-get -y install curl
apt-get -y install libXinerama1
apt-get -y install libcups*
apt-get -y install libglu1-mesa
 
releasename=alfresco-enterprise-5.0.1-installer-linux-x64.bin

# Change working dir to vagrant directory
cd /vagrant

# Install Alfresco using the key file
./$releasename < /vagrant/install-keys

# Copy extensions and amp modules
cd /opt/alfresco
cp -Rv /vagrant/shared-classes/* tomcat/shared/classes/
cp -Rv /vagrant/shared-lib/* tomcat/shared/lib/
cp -Rv /vagrant/amps-repo/* amps/
cp -Rv /vagrant/amps-share/* amps_share/
cp -v /vagrant/license/* tomcat/shared/classes/alfresco/extension/license/

# Install amp modules into alfresco.war and share.war
mmt="/opt/alfresco/java/bin/java -jar /opt/alfresco/bin/alfresco-mmt.jar"
$mmt install amps tomcat/webapps/alfresco.war -directory $*
$mmt list tomcat/webapps/alfresco.war
$mmt install amps_share tomcat/webapps/share.war -directory $*
$mmt list tomcat/webapps/share.war

# Start Alfresco after installation
service alfresco start 
