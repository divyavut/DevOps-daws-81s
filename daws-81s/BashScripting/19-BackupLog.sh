#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "User should have super user previlages"
    exit 1
fi

SOURCE_DIR=$1
DEST_DIR=$2
TIMESTAMP=$(date +%Y-m%-%d-%H-%M-%S)
DAYS=${3:-14} # IF $3 is empty,default is 14 days

USAGE(){
    echo "USAGE:: sh backuoLog.sh <source> <destination> <day(optional)>"
}

if [ $# -lt 2 ]
then
    USAGE 
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "source directory does't exit: $SOURCE_DIR"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

if [ -z "$FILES" ]
then 
    echo "Files doesn't exit"
    exit 1
else
    echo "Files are found"
    dnf install zip -y
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zipped files older than $DAYS"
        #Removing files after zipping
        echo "$FILES" | while IFS= read -r file
        do
            echo "deleting file : $file"
            rm -f $file
            echo "file deleted: $file"
        done 
    else
        echo "Zipping files is failed"
        exit 1
    fi
fi


 
