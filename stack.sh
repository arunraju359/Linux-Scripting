#!/bin/bash 

ID=$(id -u)
LOG="/tmp/stack.log"

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

echo -n "Installing Web Server: "
yum install httpd -y &>> $LOG
stat $?

echo -n "Create Proxy Config"
echo 'ProxyPass "/student" "http://localhost:8080/student" 
ProxyPassReverse "/student"  "http://localhost:8080/student"' > /etc/httpd/conf.d/proxy.conf 
stat $?

echo -n "Setup student index file"
curl -s  https://devops-cloudcareers.s3.ap-south-1.amazonaws.com/index.html -o /var/www/html/index.html
stat $?