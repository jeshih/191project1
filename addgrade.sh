#!/bin/bash

if [ $# == 2 ]
    then
    echo "Enter student score for assignment: "
    read input_variable
    student=$(grep -n $1 grader.csv | cut -f1 -d:)
#    sed -i ''$student' s/0/'$input_variable'/'  grader.csv

    IFS="," 
    count=0
    firstline=$(head -1 grader.csv)
    for i in $firstline; do
	let count=count+1
	if [ $i = $2 ]
	then
	    echo $count #get word location
	    break
	fi
    done
    sed -i ''$student's/[^ ]*/'$input_variable'/'$count'' grader.csv

    unset IFS
 else
    echo "Invalid Input!!"
fi



