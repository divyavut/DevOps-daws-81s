#!/bin/bash

# Color Codes
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#Step1 : Check User have Super User previllages to run the script
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "User should have super user Previllages to run the script"
    exit 1
fi

VERIFY_INSTALLATION() {
 if [ $1 -ne 0 ]
 then 
    echo -e "$2 is...$R FAILED $N"
    exit 1
 else
    echo -e "$2 is...$G SUCCESS $N"
 fi
} 
#Step2: Check the Package is Already installed
for package in $@ #($@ holds the argumnets like git, mysql-server, nginx)
do 
  dnf list installed $package
  if [ $? -ne 0 ]
  then
    echo "$package has to be installed, please install it"
    dnf install $package -y
    #Step3: Verify the Package is sucessfully installed or not
    VERIFY_INSTALLATION $? "Installing $package"
  else
    echo "$package is already installed , nothing to do."
  fi
done



