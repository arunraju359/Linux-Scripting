#!/bin/bash 

ID=$(id -u)

if [ $ID -ne 0 ] ; then

fi 

yum install httpd -y 