#!/bin/bash

if [ $# -ne 2 ]
then
    echo "IMPROPER NUMBER OF ARGUMENTS"
else
    #get the line number student is on
    student=$(grep -n $1 grader.csv | cut -f1 -d:)

    totgrade=0
    stugrade=0

    fline=$(sed -n '1p' grader.csv) #first line
    sline=$(sed -n '2p' grader.csv) #second line
    stuline=$(sed -n ''$student'p' grader.csv) #student line

    IFS=', '
    read -a line1 <<< "$fline" 
    read -a line2 <<< "$sline"
    read -a linestu <<< "$stuline"
    # size=$(echo ${#line1[@]})
    echo "${linestu[2]} ${linestu[1]} (${linestu[0]})" > "${linestu[0]}_$2_grade"
    count=3
    while [ $2 != ${line1[$count]} ]; do
	let count=count+1
    done
    echo "${line1[$count]}" >> "${linestu[0]}_$2_grade"
    echo "Grade: ${linestu[$count]}/${line2[$count]}" >> "${linestu[0]}_$2_grade"

fi
