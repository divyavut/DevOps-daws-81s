#!/bin/bash

#Variables
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/expense/"
SCRIPT_NM=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="/$LOG_FOLDER/$SCRIPT_NM-TIMESTAMP.log"

#Create Directory if not exit
mkdir -p /var/log/expense

# validate function
VALIDATE(){
  if [ $1 -ne 0 ]
  then
    echo -e "$2 is...$R failed $N" | tee -a $LOG_FILE
    exit 1
  else
    echo -e "$2 is...$G success $N" | tee -a $LOG_FILE
  fi
}
#Usage function
USAGE(){
    echo -e "$R USAGE:: $N sudo 18.ExpenseProj.sh package1, package2"
}

#step 1: Check User has super user previllages to run the script"
CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
    echo "User should have $R super user(root) $N privillages to run the script"
    exit 1
fi
}
#Step 2: check user passed the arguments to the script at runtime
if [ $# -ne 0 ] # $# refers number to the number of argument passed to the script
then 
    USAGE
fi

CHECK_ROOT
 
#Step 3: Install mySql-server
dnf install mysql-server -y
VALIDATE $? "Installing MYSQL Server"

systemctl enable mysqld
VALIDATE $? "enable MYSQL Server"

systemctl start mysqld
VALIDATE $? "starting MYSQL Server"

mysql_secure_installation --set-root-pass ExpenseApp@1

VALIDATE $? "settingup the rrot password"