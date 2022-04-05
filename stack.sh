#!/bin/bash 

### Check whether the user running this script is root user or not 
ID=$(id -u)
if [ "$ID" -ne 0 ]; then 
   echo -e "\e[31m You should be running this script as a root user or with sudo command \e[0m"
   exit 1
fi 

LOG=/tmp/stack.log
FUSER=student 
INDEX_URL="https://devops-cloudcareers.s3.ap-south-1.amazonaws.com/index.html"
APACHE_VERSION="8.5.78"
TOMCAT_URL="https://dlcdn.apache.org/tomcat/tomcat-8/v$APACHE_VERSION/bin/apache-tomcat-$APACHE_VERSION.tar.gz"
WAR_URL="https://devops-cloudcareers.s3.ap-south-1.amazonaws.com/student.war"
JAR_URL="https://devops-cloudcareers.s3.ap-south-1.amazonaws.com/mysql-connector.jar"
SCHEMA_URL="https://devops-cloudcareers.s3.ap-south-1.amazonaws.com/studentapp-ui-proj.sql"


stat() {
   if [ $1 -eq 0 ]; then 
       echo -e "\e[32m Success \e[0m"
   else
       echo -e "\e[31m Failure \e[0m"
   fi 
}

# Frontend Configuration
echo -n "Installing WebServer: "
yum install httpd -y &> $LOG 
stat $?

echo -n "Creating Proxy Config: "
echo 'ProxyPass "/student" "http://localhost:8080/student"
ProxyPassReverse "/student"  "http://localhost:8080/student" ' > /etc/httpd/conf.d/proxy.conf  
stat $?

echo -n "Setup Default Index File: "
curl -s $INDEX_URL -o /var/www/html/index.html  &>> $LOG 
stat $? 

echo -n "Starting the webservice: "
systemctl enable httpd  &>> $LOG 
systemctl start httpd  &>> $LOG 
stat $?

# Backend Configuration 

echo -n "Installing Java: "
yum install java -y &>> $LOG 
stat $? 

echo -n "Creating the $FUSER Functional User: "
id $FUSER &>> $LOG 
if [ $? -eq 0 ]; then 
   echo -e "\e[33m Skipping \e[0m" 
else 
   useradd $FUSER &>> $LOG
   stat $?
fi 

echo -n "Downloading the Tomcat: "
cd /home/$FUSER
wget $TOMCAT_URL &>> $LOG
tar -xf /home/student/apache-tomcat-$APACHE_VERSION.tar.gz &>> $LOG
chown -R $FUSER:$FUSER apache-tomcat-$APACHE_VERSION &>> $LOG
stat $? 

echo -n "Downloading the $FUSER War file: "
cd apache-tomcat-$APACHE_VERSION
wget $WAR_URL -O webapps/student.war &>> $LOG
chown $FUSER:$FUSER webapps/student.war &>> $LOG
stat $?

echo -n "Downloading the JDBC Jar file: "
wget $JAR_URL -O lib/mysql-connector.jar &>> $LOG 
chown $FUSER:$FUSER lib/mysql-connector.jar &>> $LOG
stat $?

echo -n "Downloading the DB Schema : "
wget $SCHEMA_URL -O /tmp/studentapp.sql &>> $LOG
stat $

# Setting up MariaDB 
echo -n "Installing & Starting Mariadb: "
yum install mariadb-server -y &>> $LOG
systemctl enable mariadb  &>> $LOG
systemctl start  mariadb  &>> $LOG
stat $?

echo -n "Injecting he schema : "
mysql <  /tmp/studentapp.sql

echo -n "Starting Tomcat: "
sh bin/startup.sh  &>> $LOG
stat $?

echo -n "Checking Application Availability : "
sleep 10
curl localhost:8080/$FUSER 
if [ $? -eq 0 ]; then 
   echo -e "\e[32m AVailable \e[0m" 
else 
   echo -e "\e[31m Not yet available. Please check the catalina logs \e[0m" 
   stat $?
fi 

echo -e "********************************* \e[   ******************************************************************************""