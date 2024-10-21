#!/bin/bash

# shell script automitically enables these special variables
echo "All variables passed to the script: $@"
echo "Number of varaibles passed: $#"
echo "Current working directory: $PWD"
echo "Home Directory of current: $HOME"
echo "PID of current executing script: $$"
echo "Previous command execution status: $?"
sleep 100 &
echo "PID of last Background running command: $!"