#!/bin/bash 

ID=$(id -u)

if [ $ID -ne 0 ] ; then
    echo -e "\e[31m You need to execure this script as a root user or with a sudo command \e[0m"
    exit 1
fi 

yum install httpd -y 