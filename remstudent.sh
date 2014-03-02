#! /bin/bash
# This script is for removing students from the csv file
# inputs: pennkey

if [ $# -eq 1 ]
then
    pennkey=$1
    
    num=$(grep -c $pennkey grader_test.csv)
    if [ $num -eq 0 ]
    then 
	echo "STUDENT NOT IN SYSTEM"
    else
	echo "Are you sure you want to remove $pennkey from the system? (y/n)"
	read input_variable
	if [ $input_variable = y ]
	then
	    line_num=$(grep -n $pennkey grader_test.csv | cut -d':' -f1)
	    sed -i "$line_num"d grader_test.csv
	fi

    fi

else
    echo "Invalid inputs!"
fi