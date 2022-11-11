#!/bin/bash

yum update -y && yum install wget -y

declare -a arr=("rpm -q aide" "subscription-manager identity")

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