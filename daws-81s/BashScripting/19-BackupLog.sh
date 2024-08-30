#!/bin/bash

# USERID=$(id -u)
# if [ $USERID -ne 0 ]
# then
#     echo "User should have super user previlages"
#     exit 1
# fi
R="\e[31m"
G="\e[32m"
Y="\e[33m"
Y="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
TIMESTAMP=$(date +%Y-m%-%d-%H-%M-%S)
DAYS=${3:-14} # IF $3 is empty,default is 14 days

USAGE(){
    echo -e "$R USAGE:: $N sh backuoLog.sh <source> <destination> <day(optional)>"
}

if [ $# -lt 2 ]
then
    USAGE 
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "source directory does't exist: $R $SOURCE_DIR $N"
    exit 1
else
    echo -e "Directory exist: $SOURCE_DIR"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

if [ ! -z "$FILES" ]
then 
    echo -e "$G Files are found $N"
    echo "sudo dnf install zip -y"
    echo -e "Sucessfully installed the  $G zip  $N package"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@
    if [ -f $ZIP_FILE ]
    then
        echo -e "Successfully zipped files older than $G $DAYS $N"
        #Removing files after zipping
        echo "$FILES" | while IFS= read -r file
        do
            echo -e "deleting file :$Y $file $N"
            rm -f $file
            echo "file deleted: $file"
        done 
    else
        echo -e "Zipping files is $R failed $N"
        exit 1
    fi
    
else
    echo -e " $R Files doesn't exit $N"
    exit 1
   
fi


 
