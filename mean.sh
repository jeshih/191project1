#!/bin/bash
#Mean extra credit
#calculates mean for an assignment
#input is assignment name


if [ $# -ne 1 ]
then
    echo "IMPROPER NUMBER OF ARGUMENTS!"
else

    scores=0
    numberstud=0

    fline=$(sed -n '1p' grader.csv) #first line

    IFS=', '
    read -a line1 <<< "$fline" 
    size=$(echo ${#line1[@]})
    linesize=$(sed -n '$=' grader.csv)

    count=0
    linecount=2
    let lpos=linecount+1
    
    for e in ${line1[@]}; do
	
	count=$(($count + 1))
	if [[ $e = $1 ]]
	then
	    break
	fi
    done
    
    let count=count-1

    while [ $linecount -lt $linesize ]; do
	stuline=$(sed -n ''$lpos'p' grader.csv) #student line
    	read -a linestu <<< "$stuline"
	score=$(($score + ${linestu[$count]}))
	let linecount=linecount+1
	let lpos=linecount+1
    done
    let numberstud=linecount-2
    let average=score/numberstud
    echo $1 mean is $average
fi

