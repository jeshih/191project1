#!/bin/bash
#This script is for adding students to the csv file

assigns=$(grep -c $1 grader.csv)

if [ $assigns -ne 0 ]
then
    echo "STUDENT ALREADY IN SYSTEM"
elif [ $# == 3 ]
then 
    echo $1, $2, $3 >> grader.csv
    x=$(head -1 grader.csv | grep -o "," | wc -w)
    let x=x-2

    while [ $x -ne 0 ]; do
	sed -i '$s/$/&, 0/' grader.csv
	let x=x-1
    done
else
    echo "Not enough inputs!"
fi


