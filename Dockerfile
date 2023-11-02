FROM tomcat:latest
LABEL maintainer="mamathasama@hotmail.com"
ADD /taget/SimpleTomcatWebApp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]


