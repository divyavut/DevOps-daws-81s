#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
Y=
if [ -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR Exit"
else
    echo "$SOURCE_DIR doesn't Exits"
    exit 1
FILES=$(find $SOURCE_DIR -name "*.log"  -mtime +14) 
echo "Files:$FILES"
while IFS read -r line
do

echo "Deleting $line"
rm -rf $line

done <<< $FILES