#!bin/bash
#archiver
#inputs are semester, year

if [ $# != 2 ]
then
    echo "Incorrect number of inputs!"
else
    #semester=$1
    #year=$2

    #name the tarball YYYY_semester_backup.tar.gz  
    tar -czf $2_$1_backup.tar.gz */*_grade
fi