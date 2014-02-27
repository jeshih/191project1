#!/bin/bash
#This script is for adding students to the csv file

if [ $# == 3 ]
then 
    echo $1, $2, $3 >> grader.csv
else
    echo "Not enough inputs!"
fi

x=$(head -1 grader.csv | grep -o "," | wc -w)
let x=x-2

while [ $x -ne 0 ]; do
    sed -i '$s/$/&, 0/' grader.csv
    let x=x-1
done
