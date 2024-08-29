#!/bin/bash
# step1: Check user has super user privillage to run the script
# USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# if [ $USERID -ne 0 ]
# then 
#     echo -e "$R User should have root privelliages $N"
#     exit 1
# fi 

SOURCE_DIR="/home/ec2-user/logs"
if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR $R directory doesn't exist $N"
    exit 1
else
    echo -e "$SOURCE_DIR $G directory exist $N"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

# Check if any files are found
if [ -z "$FILES" ];
then
    echo -e  "$FILES $R doesn't exist $N"
    exit 1   
else
    echo -e "$G Files are: $N $FILES"    
fi

echo "$FILES" | while IFS= read -r file
do
    echo -e "$Y Deleting the file: $N $file"
    rm -f $file
    echo -e "$Y $file deleted $N"
done 