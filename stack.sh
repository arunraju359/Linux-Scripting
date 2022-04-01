#!/bin/bash 

ID=$(id -u)
LOG="/tmp/stack.log"
FUSER="student"
TOMCAT_VERSION="8.5.77"
TOMCAT_URL="https://dlcdn.apache.org/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-8.5.77.tar.gz"

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
ProxyPassReverse "/student"  "http://localhost:8080/student"' > /etc/httpd/conf.d/proxy.conf  &>> $LOG
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

echo -n "Creating $FUSER Functional User : "
id $FUSER  &>> $LOG 
if [ $? -eq 0 ]; then
    echo -e "\e[33m Skipping \e[0m "
else 
    useradd $FUSER &>> $LOG
    stat $?
fi 


echo -n "Downloading the tomcat :"
wget $TOMCAT_URL -O /home/student/