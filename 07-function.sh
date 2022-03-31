#!/bin/bash 

# Declaring a sample function
sample() {
    echo "This is a sample function"
} 

# Calling the sample function
#sample

stat () {
    echo "LoadAverage on the system from last 1 minute is : $(uptime |  awk -F : '{print $NF}' | awk -F , '{print $1}')"
    
}



