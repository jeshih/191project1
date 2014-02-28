#!/bin/bash

ass=$(grep -c $1 grader.csv)

if [ $ass -ne 0 ]
then
    echo "ASSIGNMENT ALREADY IN SYSTEM"
elif [ $# -eq 1 ]
then
    sed -i '1 s/$/, '$1'/'  grader.csv

    echo "Enter Max score for assignment: "
    read input_variable
    sed -i '2 s/$/, '$input_variable'/'  grader.csv

    lines=$(wc -l < grader.csv)
    let lines=lines+1
    x=3 #start at line 3
    
    while [ $x -ne $lines ]; do
	sed -i ''$x' s/$/, 0/' grader.csv
	let x=x+1
    done
else
    echo "Invalid Input!!"
fi

