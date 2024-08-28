#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
Y=
if [ -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR Exits"
else
    echo "$SOURCE_DIR doesn't Exits"
    exit 1
