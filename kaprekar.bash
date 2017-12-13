#! /bin/bash

#---------------------------------------
# $Author: ee364a05 $
# $Date: 2017-08-29 10:41:38 -0400 (Tue, 29 Aug 2017) $
#---------------------------------------

# Do not modify above this line.

if [[ $# != 1 ]]
then
    echo "Usage: kaprekar.bash <non-negative integer>"
else
    for (( i=1; i <= $1; i++ ))
    do
        let num=$i
        digits=0
        while (( $num != 0 ))
        do
            (( num=$num/10 ))
            (( digits=$digits+1 ))
        done
        (( squared=$i*$i ))
        pow10=1
        for (( j=0; j < $digits; j++ ))
        do
            (( pow10=$pow10*10 ))
        done
        (( second=$squared%$pow10 ))
        (( first=$squared/$pow10 ))
        if (( $first+$second == $i ))
        then
            echo "$i, square=$squared, $second+$first=$i"
        fi
    done
fi
exit 0
