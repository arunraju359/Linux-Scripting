#!/bin/bash 
set -e

ID=$(id -u)
LOG="/tmp/stack.log"
FUSER="student"
TOMCAT_VERSION="8.5.78"
TOMCAT_URL="https://dlcdn.apache.org/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz"
WAR_URL="https://devops-cloudcareers.s3.ap-south-1.amazonaws.com/student.war"
JAR_URL="https://devops-cloudcareers.s3.ap-south-1.amazonaws.com/mysql-connector.jar"

if [ $ID -ne 0 ] ; then
    echo -e "\e[31m You need to execure this script as a root user or with a sudo command \e[0m"
    exit 2
fi 

stat() {
    if [ $1 -eq 0 ]; then
        echo -e "\e[32m Success \e[0m "
    else 
        echo -e "\e[31m Failure \e[0m "
    fi 
}

# Frontend Configuration 
echo -n "Installing Web Server : "
yum install httpd -y &>> $LOG
stat $?

echo -n "Create Proxy Config :"
echo 'ProxyPass "/student" "http://localhost:8080/student" 
ProxyPassReverse "/student"  "http://localhost:8080/student"' > /etc/httpd/conf.d/proxy.conf 
stat $?

echo -n "Setup student index file : "
curl -s  https://devops-cloudcareers.s3.ap-south-1.amazonaws.com/index.html -o /var/www/html/index.html   &>> $LOG
stat $?

echo -n "Starting WebService : "
systemctl enable httpd  &>> $LOG
systemctl start httpd  &>> $LOG
stat $? 

# Backend Configuration
echo -n "Installing Java : "
yum install java -y  &>> $LOG
stat $?


echo -n "Creating the $FUSER Functional User: "
id $FUSER &>> $LOG 
if [ $? -eq 0 ]; then 
   echo -e "\e[33m Skipping \e[0m" 
else 
   useradd $FUSER &>> $LOG
   stat $?
fi 


echo -n "Downloading the tomcat :"
cd /home/$FUSER
wget $TOMCAT_URL &>> $LOG && tar -xf apache-tomcat-${TOMCAT_VERSION}.tar.gz  &>> $LOG
chown -R $FUSER:$FUSER apache-tomcat-$TOMCAT_VERSION &>> $LOG
stat $? 

echo -n "Downloading the WAR File : "
cd apache-tomcat-${TOMCAT_VERSION}
wget $WAR_URL -o webapps/student.war &>> $LOG
chown $FUSER:$FUSER webapps/student.war &>> $LOG
stat $?

echo -n "Downloading the JAR File : "
wget $JAR_URL -o lib/mysql-connector.jar &>> $LOG
stat $?

echo -n "Starting Apache Tomcat : "
chown $FUSER:$FUSER logs/catalina.out &>> $LOG
sh bin/startup.sh  &>> $LOG
stat $? 

