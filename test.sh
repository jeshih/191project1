#!/bin/bash

IFS=', '
sed -e '3s/[^ ]*/TEST/4' grader.csv
unset IFS
