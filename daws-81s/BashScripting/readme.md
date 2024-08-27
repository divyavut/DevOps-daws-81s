#### Variables

1. pass input to the varaibles inside the script --> variable=divya
2. pass input to the varaibles from outside through arguments ----> divya , $1
3. enter input to the varaibles at runtime --> Give divya as input while runtime to the read command.

#### Array

       FRUITS=("APPLE" "BANANA" "GRAPE")
       echo "${FRUITS[0]}"
       echo "${FRUITS[@]}"

#### Conditions

     if [ expression ]
     then
        echo ""
     else
        echo ""
     fi

#### Command output stores in variable

      DATE=$(date) --->Variable=$(command)

#### Special Variables

           $@ ---> Pass all the variables to the script
           $# ---> Number of variables passed
           $HOME ---> HOME Directory of the Current User
           $PWD ---> Current working directory
           $$ ---> Hold the PID of the Current executing script
           $! ---> Hold the PID of the last background command
           $? ---> Previous command state(exit status) (Hold the previous command execution state)
                   success - 0
                   Failure - 1 to 127

#### Functions

Repeated task can be placed in the function. We have calling function, called function.

     Syntax:
      FunctionName() {
        echo "$1 is the first argument"
      }

      functionName inputs

#### Colors

1.  Red - "\e[31m"
2.  Green - "\e[32m"
3.  Yellow - "\e[33m"
4.  To reset the text formating to the the terminal default settings- "\e[0m"

        Example: echo -e "\e[31m hello world"

- -e for enabling the colors
