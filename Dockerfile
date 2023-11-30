FROM --platform=linux/amd64 openidentityplatform/openam:14.8.1

COPY config.cfg /config/config.cfg

COPY /tomcat.sh /tomcat.sh

COPY configure.sh /configure.sh
RUN /configure.sh

# remove PID of tomcat
RUN rm -f /usr/local/tomcat/tomcat.pid
