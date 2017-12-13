#! /bin/bash

#---------------------------------------
# $Author: ee364a05 $
# $Date: 2017-08-27 15:27:47 -0400 (Sun, 27 Aug 2017) $
#---------------------------------------

# Do not modify above this line.

if [[ $# != 2 ]] # Needs 2 additional command line args
then
    echo "Usage: ./game_stats.bash <file> <game>"
    echo ""
    exit 1
elif [[ ! -e $1 ]] # File specified doesn't exist
then
    echo "Error: $1 does not exist"
    echo ""
    exit 2
else
    students=0
    hours=0
    maxTime=0
    firstLoop=1
    while read -d "," name
    do
        read -d "," game
        read time
        # if students are playing the specified game...
        if [[ $game = $2 ]]
        then
            let students=$students+1 # count students playing game
            let hours=$hours+$time # count total hours played
            if (( $time >= $maxTime ))
            then
                maxStudent=$name # student that played the most
                let maxTime=$time # how long that student played
            elif (( $firstLoop == 1 ))
            then
                minStudent=$name
                let minTime=$maxTime
                let firstLoop=0
            elif (( $time <= $minTime ))
            then
                minStudent=$name # student that played the least
                let minTime=$time # how long that student played
            fi
        fi
    done < $1
    # Output results
    echo "Total students: $students"
    echo "Total hours spent in a day: $hours"
    echo "$maxStudent spent the highest amount of time in a day: $maxTime"
    echo "$minStudent spent the least amount of time in a day: $minTime"
    echo ""
fi
exit 0
