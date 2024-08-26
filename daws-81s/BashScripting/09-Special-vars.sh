#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of varaibles passed: $#"
echo "Current working directory: $PWD"
echo "Home Directory of current: $HOME"
echo "PID of current executing script: $$"
sleep 100 &
echo "PID of last Background running command: $!"