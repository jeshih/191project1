#!/bin/bash
# emails 1 student grade files
# inputs are pennkey and assignment title

if [ $# -ne 2 ]
then
    echo "IMPROPER NUMBER OF ARGUMENTS"
else
#    pennkey=$1
#   assignment=$2

    #generate grade files
    bash generategradefiles.sh $2
    echo "email student $1 for $2 assignment"
    #mail -a $2/$1_$2_grade $1@seas.upenn.edu

fi