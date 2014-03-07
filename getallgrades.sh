#! /bin/bash
# get all student grades in the form
# pennkey: total received / total possible


if [ $# -ne 1 ]
then
    echo "IMPROPER NUMBER OF ARGUMENTS!"
else
    input_file=$1 #path to file
    
    totgrade=0
    stugrade=0

    sline=$(sed -n '2p' $input_file) #second line
    IFS=', ' 
    read -a line2<<<"$sline"


    size=$(echo ${#line2[@]})
    linesize=$(sed -n '$=' $input_file)
    count=3 #start at 3rd element

    while [ $count -lt $size ]; do
	totgrade=$(($totgrade + ${line2[$count]}))
	let count=count+1
    done


    let linecount=2
    let lpos=linecount+1
    while [ $linecount -lt $linesize ]; do
	#count each student
	let stugrade=0
	let count=3
	
	stuline=$(sed -n ''$lpos'p' $input_file) #student line
    	read -a linestu <<< "$stuline"
	
	while [ $count -lt $size ]; do

	    stugrade=$(($stugrade + ${linestu[$count]}))
	    let count=count+1
	done

	echo "${linestu[0]}: $stugrade/$totgrade"
	let linecount=linecount+1
	let lpos=linecount+1
    done

   

fi