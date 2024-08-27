#!/bin/bash
#Step1 : Check User have Super User previllages to run the script
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "User should have super user Previllages to run the script"
    exit 1
fi

#Step2: Write a function to check the previous command execution status (exit status)
VALIDATE(){
    if [ $1 -ne 0]
    then
        echo "$2 not installed yet"
        dnf install git -y
        CHECK_INSTALL $? "Package"
    else
        echo "$2 already installed, nothing to do"
    fi
}
CHECK_INSTALL(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is not installed successfully, please check it"
    else
        echo "$2 is successfully installed"
    fi
}
#Step3: Check the package is already installed 
dnf list installed git
VALIDATE $? "Package"
