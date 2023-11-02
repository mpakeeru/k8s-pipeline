FROM docker.io/tomcat:latest
LABEL maintainer="mamathasama@hotmail.com"
ADD target/SimpleTomcatWebApp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]


