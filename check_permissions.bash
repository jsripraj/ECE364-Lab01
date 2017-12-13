#! /bin/bash

#---------------------------------------
# $Author: ee364a05 $
# $Date: 2017-08-29 11:21:49 -0400 (Tue, 29 Aug 2017) $
#---------------------------------------

# Do not modify above this line.

if (( $# != 1 ))
then
    echo "Usage: check_permissions.bash <input file/directory>"
elif [[ ! -e $1 ]]
then
    echo "Error: $1 does not exist"
    echo ""
    exit 1
else
    input=$(ls -ld $1)
    input=($input)
    perms=${input[0]}
    if [[ $perms = "-"* ]]
    then
        echo "$1 is an ordinary file"
        if [[ $perms = "
    else
        echo "$1 is a directory"
    fi
fi
exit 0

