#!/bin/bash
#set -e

export JAVA_HOME=/opt/java/openjdk

# install openam on initial tomcat startup
if ! $(pgrep -f org.apache.catalina.startup.Bootstrap &> /dev/null); then
  rm -f /usr/local/tomcat/logs/catalina.out 
  
  /tomcat.sh start
  sleep 5
  tail -f /usr/local/tomcat/logs/catalina.out | sed -n '/Server startup in/q;p'
fi

echo "creating openam configuration"
java -jar /usr/openam/ssoconfiguratortools/openam-configurator-tool-14.8.1.jar -f /config/config.cfg --acceptLicense

cat /usr/openam/config/install.log

/tomcat.sh stop

