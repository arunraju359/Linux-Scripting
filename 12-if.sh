#!/bin/bash 

ACTION=$1 

if [ -z $ACTION ]; then 
    echo "Argument is needed, either Start or Stop"
    exit 1
fi 


START() {
    echo "Start XYZ"
}

STOP() {
    echo "Stopping XYZ"
}