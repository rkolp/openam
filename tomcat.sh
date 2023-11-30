#!/bin/bash

export CATALINA_PID=/usr/local/tomcat/tomcat.pid

/usr/local/tomcat/bin/catalina.sh "$@"
