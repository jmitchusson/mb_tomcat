#!/bin/bash
sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.zip;
sudo unzip apache-tomcat-9.0.30.zip -d /opt/tomcat/;
sudo chown -R tomcat: /opt/tomcat;
sudo chmod +x /opt/tomcat/apache-tomcat-9.0.30/bin/*.sh;
sudo rm -rf /tmp/apache-tomcat-9.0.30.tar.gz;
sudo cat /tmp/tomcat_systemd/tomcat.service > /etc/systemd/system/tomcat.service;
sudo systemctl daemon-reload;
sudo sytemctl enable firewalld;
sudo systemctl start firewalld;
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp;
sudo firewall-cmd --reload;
