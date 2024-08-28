#!/bin/bash

# VARIABLES
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/expense/"
SCRIPT_NM=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NM-$TIMESTAMP.log"
USERID=$(id -u)
mkdir -p /var/log/expense

# Step1: check user has root previlleges"
if [ $USERID -ne 0 ]
then 
    echo -e "$R User should have super user privilleages $N" | tee -a $LOG_FILE
    exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "$2.. $R is failed $N" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$2.. $G is sucessfull $N" | tee -a $LOG_FILE
fi
}
echo "Script started executing at : $(date)" | tee -a $LOG_FILE

# Step2: check mysql-server installed"
dnf install mysql-server -y &>>$LOG_FILE
VALIDATE $? "Mysql-server installation" 

# Step3: check mysql-server enabled"
systemctl enable mysqld &>>$LOG_FILE 
VALIDATE $? "Mysql-server is enabled"

# Step4: check mysql-server disabled"
systemctl start mysqld &>>$LOG_FILE
VALIDATE $? "mysql-server is started"

# Step5: check password is set for mysql-server"
mysql -h mysql.dev.divyavutakanti.com -u root -pExpenseApp@1 -e 'show databases;' &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "Mysql-server password is not set yet, $Y Setting the password now $N" | tee -a $LOG_FILE
    mysql_secure_installation --set-root-pass ExpenseApp@1
    echo -e "Mysql-server password is $G succesfully set $N"
else
    echo -e "$Y Mysql-server password ia already set, Skipping it $N" | tee -a $LOG_FILE
fi


