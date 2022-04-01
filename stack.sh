#!/bin/bash 

ID=$(id -u)

if [ $ID -ne 0 ] ; then
    echo -e "\e[31m You need to execure this script as a root user or with a sudo command \e[0m"
    exit 2
fi 

echo -n "Installing Web Server: "
yum install hasdfasdttpd -y &> /tmp/stack.log
if [ $? -eq 0 ]; then
    echo -e "\e[32m Success \e[0m "
else 
    echo "\e[31m Failure \e[0m "
fi 
