# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "santosh_sankannavar@yahoo.in"
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps 