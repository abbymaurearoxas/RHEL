#!/bin/bash

declare -a arr=("rpm -q aide")

for (( i = 0; i < ${#arr[@]} ; i++ )); do
    printf "\n**** Running: ${arr[$i]} *****\n\n"

    # Run each command in array 
    eval "${arr[$i]}"

    ### using back-ticks works also
    #RESULT=`${arr[$i]}`
    ### Check if the command gave any output
    #if [ -n "$RESULT" ]; then
    #    echo "$RESULT"
    #fi
done