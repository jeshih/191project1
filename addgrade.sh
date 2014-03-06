#!/bin/bash

validass=$(grep -c -w $2 grader.csv)
validstu=$(grep -c -w $1 grader.csv)

if [ $validstu -ne 1 ]
then
    echo "STUDENT NOT IN SYSTEM"
elif [ $validass -ne 1 ]
then
    echo "ASSIGNMENT NOT IN SYSTEM"
elif [ $# -eq 2 ]
then
    echo "Enter student score for assignment: "
    read input_variable
    student=$(grep -n $1 grader.csv | cut -f1 -d:)
    stuline=$(sed -n ''$student'p' grader.csv)

    fline=$(sed -n '1p' grader.csv) #firstline

    IFS=", "
    read -a line1 <<< "$fline"
    read -a linestu <<< "$stuline"
    count=0
    for e in ${line1[@]}; do
	count=$(($count + 1))
	if [[ $e = $2 ]]
	then
	    break
	fi
    done
    sed -i ''$student's/[^,]*/ '$input_variable'/'$count'' grader.csv
 else
    echo "Invalid Input!!"
fi



