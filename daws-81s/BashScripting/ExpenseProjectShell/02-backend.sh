#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
LOG_FOLDER="/var/log/expense"
SCRIPT_NM=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NM-$TIMESTAMP.log"
mkdir -p /var/log/expense


if [ $? -ne 0 ]
then
    echo -e "$R User should have root privillages $N" | tee -a $LOG_FILE
    exit 1
fi 

echo -e "$Y Script started executing at: $(date)$N" | tee -a $LOG_FILE

VALIDATE() {
if [ $1 -ne 0 ]
then
     echo -e "$2..$R failed $N" | tee -a $LOG_FILE
     exit 1
else
     echo -e "$2..$G  success $N" | tee -a $LOG_FILE
fi
}

dnf module disable nodejs -y &>>$LOG_FILE
VALIDATE $? "disable Nodejs" 

dnf module enable nodejs:20 -y &>>$LOG_FILE
VALIDATE $? "enable Nodejs"


dnf module install nodejs -y &>>$LOG_FILE
VALIDATE $? "Installing Nodejs"

id expense
if [ $? -ne 0 ]
then 
    echo -e "Expense user not exit, $Y creating $N" | tee -a $LOG_FILE
    useradd expense
    VALIDATE $? "creating expense user"
else
    echo -e "Expense User already exist, $Y Nothing do to $N" | tee -a $LOG_FILE
fi

mkdir -p /app &>>$LOG_FILE
VALIDATE $? "Creating /app directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip

cd /app 

rm -rf /app/*
unzip /tmp/backend.zip 
VALIDATE $? "Unzipping code" 


npm install &>>$LOG_FILE
VALIDATE $? "installing npm" 

cp /home/ec2-user/DevOps-daws-81s/daws-81s/BashScripting/ExpenseProjectShell/expense.conf /etc/systemd/system/expense.conf &>>$LOG_FILE
VALIDATE $? "Coping Backend Service to Systemd" 


dnf install mysql -y &>>$LOG_FILE
VALIDATE $? "Insatlling Mysql cilent to login to Database"
 
mysql -h mysql.dev.divyavutakanti.com -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$LOG_FILE
VALIDATE $? "Schema loading"

systemctl daemon-reload &>>$LOG_FILE
VALIDATE $? "Daemon reload"

systemctl enable backend &>>$LOG_FILE
VALIDATE $? "enabling backend"

systemctl restart backend &>>$LOG_FILE
VALIDATE $? "restarting backend"

