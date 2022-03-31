#!/bin/bash 

ACTION=$1 

if [ -z $ACTION ]; then 
    echo "Argument is needed, either Start or Stop"
    exit 1
fi 


