#! /bin/bash

#---------------------------------------
# $Author: ee364a05 $
# $Date: 2017-08-27 13:13:32 -0400 (Sun, 27 Aug 2017) $
#---------------------------------------

# Do not modify above this line.

while (( 1 ))
do
    echo -n "Enter a command: "
    read input
    if [[ $input == "hello" ]]
    then
        echo "Hello $USER"
        echo ""
    elif [[ $input == "quit" ]]
    then
        echo "Goodbye"
        echo ""
        exit 0
    elif [[ $input == "compile" ]]
    then
        for File in *.c
        do
            gcc -Wall -Werror ${File} -o ${File//.c/.o} # replace .c with .o
            if (( $? )) # $? gets return value of prev command (failure = nonzero)
            then
                echo "Compilation failed for: ${File}"
            else
                echo "Compilation succeeded for: ${File}"
            fi
        done
        echo ""
    elif [[ $input == "whereami" ]]
    then
        echo "$PWD" # path to current directory
        echo ""
    else
        echo "Error: unrecognized input"
        echo ""
    fi
done
