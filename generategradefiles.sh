#!/bin/bash

if [ $# -ne 1 ]
then
    echo "IMPROPER NUMBER OF ARGUMENTS"
else
    #get the line number student is on

    mkdir $1/

    fline=$(sed -n '1p' grader.csv) #first line
    sline=$(sed -n '2p' grader.csv) #second line
    stuline=$(sed -n ''$student'p' grader.csv) #student line
    
    stud=$(cut -d ',' -f 1 grader.csv)
    read -a students <<< $stud

    IFS=', '
    read -a line1 <<< "$fline" 
    size=$(sed -n '$=' grader.csv)
    let linecount=2
    
    count=3
    while [ $1 != ${line1[$count]} ]; do
	let count=count+1
    done

    echo "Size: $size"

    while [ $linecount -lt $size ]; do
	bash getstudentfile.sh ${students[$linecount]} $1
	mv "${students[$linecount]}_$1_assignment" $1/
	let linecount=linecount+1
	echo "Line Count: $linecount"
    done
fi 
