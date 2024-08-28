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

dnf install nginx -y &>>$LOG_FILE
VALIDATE $? "Installing Nginx"

systemctl enable nginx &>>$LOG_FILE
VALIDATE $? "Enabling Nginx"
 
systemctl start nginx &>>$LOG_FILE
VALIDATE $? "Starting Nginx"

rm -rf /usr/share/nginx/html/* &>>$LOG_FILE
VALIDATE $? "Removed Existing Content in html folder"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
VALIDATE $? "Downloding frontend code"

cd /usr/share/nginx/html 
unzip /tmp/frontend.zip &>>$LOG_FILE
VALIDATE $? "Unzipping the code" 

cp /home/ec2-user/DevOps-daws-81s/daws-81s/BashScripting/ExpenseProjectShell/expense.conf /etc/nginx/default.d/expense.conf &>>$LOG_FILE
VALIDATE $? "Copied the content to Nginx configuration file"

systemctl restart nginx &>>$LOG_FILE
VALIDATE $? "Restarting Nginx"



