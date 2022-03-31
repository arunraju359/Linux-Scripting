#!/bin/bash 

ACTION=$1

# case $var in 
#   opt1)
#     echo selected first option
#     ;;

#   opt2)
#     echo selected second option
#     ;;
# esac


case $ACTION in 
    start)
        echo "Starting ABC Service"
        ;; 
    stop)
        echo "Stopping ABC Service"
        ;; 
    *)
        echo -e "\e[31m Provided input is invalid : Enter either start OR stop options only"
esac 

