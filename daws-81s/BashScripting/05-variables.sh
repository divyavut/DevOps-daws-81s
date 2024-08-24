#!/bin/bash

echo "Please enter your username::"

read -s USERNAME #takes input from the user at runtime.
# -s withput displaying the input on the terminal

echo "Username entered is: $USERNAME"

echo "Please enter your Password::"

read -s PASSWORD

echo "Password entered is: $PASSWORD"