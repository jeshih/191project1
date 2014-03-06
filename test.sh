#!/bin/bash
 
students=$(cut -d ',' -f 1 grader.csv)

read -a stu <<< $students

echo  ${stu[3]}
