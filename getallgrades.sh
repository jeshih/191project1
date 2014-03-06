#! /bin/bash
# get all student grades in the form
# pennkey: total received / total possible


if [ $# -eq 1 ]
then
    input_file=$1 #path to file
    total=0
    sline=$(sed -n '2p' $input_file) #second line

    IFS=', ' read -a line2<<<"$sline"


    size=$(echo ${#line2[@]})
    count=3 #start at 3rd element

    


else
    echo "Invalid inputs!"
fi