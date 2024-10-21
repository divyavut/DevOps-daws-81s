#!/bin/bash

echo "Please enter your username::"

read -s USERNAME #take the input from the user for a variable at runtime.
# -s securing input value without displaying on the the terminal

echo "Username entered is: $USERNAME"

echo "Please enter your Password::"

read -s PASSWORD

echo "Password entered is: $PASSWORD"