#!/bin/bash 

DATECMD="$(date +%F)"
# Very bad way . Always dynamic values should not be hardcoded. They should be able to fetch dynamically.

echo "Today's date is : $DATECMD"

echo "Number of usres connected to the system : $(who | wc -l) "

