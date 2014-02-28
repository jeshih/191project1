#!/bin/bash

validass=$(grep -c $2 grader.csv)
validstu=$(grep -c $1 grader.csv)

if [ $validstu -ne 1 ]
then
    echo "STUDENT NOT IN SYSTEM"
elif [ $validass -ne 1 ]
then
    echo "ASSIGNMENT NOT IN SYSTEM"
elif [ $# == 2 ]
then
    echo "Enter student score for assignment: "
    read input_variable
    student=$(grep -n $1 grader.csv | cut -f1 -d:)
#    sed -i ''$student' s/0/'$input_variable'/'  grader.csv

    IFS=", " 
    count=0
    firstline=$(head -1 grader.csv)
    for i in $firstline; do
	let count=count+1
	if [[ $i = $2 ]]
	then
	    break
	fi
    done
    unset IFS
    sed -i ''$student's/[^ ]*/'$input_variable'/'$count'' grader.csv
 else
    echo "Invalid Input!!"
fi



