#!/bin/bash 

# Special variables are $0 to $n , $* , $@ , $$ 

echo $0  # Prints the script name.
echo $1  # First Argument passed to the script 
echo $2  # Second argument passed to the script 


# Example Usage :  sh test.sh  firstArgument  second Argument 3rd Argument . . . .. . 9thArgument
# sh test.sh 10 20 30 
#            $1 $2 $3