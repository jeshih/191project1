#!/bin/bash
#emailallstudents
#takes input assignment label

if [ $# -ne 1 ]
then 
    echo "IMPROPER NUMBER OF ARGUMENTS"
else

    fline=$(sed -n '1p' grader.csv) #first line
    sline=$(sed -n '2p' grader.csv) #second line
  
    stud=$(cut -d ',' -f 1 grader.csv)
    read -a students <<< $stud

    IFS = ', '
    read -a line1 <<< "$fline" 
    size=$(sed -n '$=' grader.csv)
    let linecount=2
    
    count=3
    while [ $1 != ${line1[$count]} ]; do
	let count=count+1
    done

    echo "Size: $size"

    while [ $linecount -lt $size ]; do
	bash emailstudent.sh ${students[$linecount]} $1
	let linecount=linecount+1
	echo "Line Count: $linecount"
    done
fi 