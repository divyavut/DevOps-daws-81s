#!/bin/bash

# Step1: Check the User have super user(rrot Previllages)
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "user should have super user(root) previlleges to run the script"
    exit 1
fi 

# step2: Check the Git package is already installed
dnf list installed git 
if [ $? -ne 0]
then 
    echo "Git has to be installed, please install Git"
   # step3: Check the Git package is sucessfully installed or not
    dnf install git -y 
    if [ $? -ne 0 ]
    then 
        echo "Git is not installed successfully, please check it"
        exit 1
    else
        echo "Git is installed Sucessfully"
    fi
else
    echo "Git is already installed, nothing to do"
fi


# step1: Check the Mysql-Server package is already installed
dnf list installed mysql-server 
if [ $? -ne 0 ]
then
    echo "Mysql-Server has to be installed, please install Mysql-server"
    dnf install mysql-server -y
    #step2: check the Mysql-server package is succesfully installed or not
    if [ $? -ne 0 ]
    then
        echo "Mysql-server package is not installed successfully, please check it"
        exit 1
    else
        echo "Mysql-server is sucessfully installed"
    fi
else
    echo "Mysql-server is already Installed, nothing to do"
fi