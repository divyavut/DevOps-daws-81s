#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
{
    echo "User must have super user previlligaes"
    exit 1 
}

dnf install mysql-server -y
if[ $]
