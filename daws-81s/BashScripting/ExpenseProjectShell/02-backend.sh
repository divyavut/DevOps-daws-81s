#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)

if [ $? -ne 0 ]
then
    echo "User should have root privillages"
    exit 1
fi 

echo "Script started executing at: $(date)"

VALIDATE() {
if [ $1 -ne 0 ]
then
     echo "$2.. is failed"
     exit 1
else
     echo "$2.. is success"
fi
}

dnf module disable nodejs -y
VALIDATE $? "disable Nodejs"

dnf module enable nodejs:20 -y
VALIDATE $? "enable Nodejs"


dnf module install nodejs -y
VALIDATE $? "Installing Nodejs"

id expense
if [ $? -ne 0 ]
then 
    echo "Expense user not exit, creating"
    useradd expense
    VALIDATE $? "creating expense user"
else
    echo " Expense User already exist, Nothing do to"
fi

mkdir -p /app
VALIDATE $? "Creating /app directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip

cd /app

rm -rf /app/*
unzip /tmp/backend.zip 


npm install
VALIDATE $? "installing npm"

cp ./

