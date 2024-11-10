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

           $@ ---> refers to All arguments passed to it
           $# ---> Number of variables passed
           $HOME ---> HOME Directory of the Current User
           $PWD ---> Current working directory
           $$ ---> Hold the PID of the Current executing script
           $! ---> Hold the PID of the last background command
           $? ---> Previous command state(exit status) (Hold the previous command execution state)
                   success - 0
                   Failure - 1 to 127
           $0 ---> Script name

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

#### Loops

       for i in {1..10}
       do
       echo "print $i"
       done

#### Redirectors

- 1>, > ---> redirects the standard output of a command to a file.
- 2> ---> for redirecting the standard error of a command to a file.
- &> ---> for redirecting Both standard error and standard output to a file
- > > --> appending output of a command to a file.
- < ---> redirect input
- > ---> redirect output
- <<< --> redirect single input string

#### tee

tee -a --> display the standard output to the terminal and append standard output to the file.

#### Idempotentcy

if you run the script infinite times, it would give same results.

#### HTTP methods and HHTPS methods

CRUD

- POST method ---> Create data, you should send data. Usually it goes as json.
- GET method ---> Read the data from database(api read the data from database)
- DELETE Method ---> delete data
- PUT method ---> update data

#### HTTP status response codes

- 2 --->
- 4 \*\* ---> client side errors
- 5 \*\* ---> Server side errors

#### Client Side Error (4\*\*)

- 401 ---> BAD Request 
- 402 ---> unauthorised (user require authentication(permission))
- 403 ---> Forbidden (user has autentication but dont have resource authorisation)
- 404 ---> Not found(server says unable to understand the request url send by client)
- 405 ---> Method not found

#### who is client for backend --> Frontend

If you get 404 error --> its means cilent is unable to connect to backend.

#### Server side Error (5\*\*)

500- internal server error (server where the application is running has some configuration issues, means service/application is not running beacuse of configuration/code issues)
502- Bad Gateway (The server which acts as reverse proxy/gateway(loadbalancer) recevie invalid error from the upstream server(service in kubernetes))
503- 503 Service Temporarily Unavailable

#### set -e

setting the Automatic exit, if we get the error.

#### set -ex

set in debug mode

#### trap ' ' ERR

ERR ---> is the Error signal.
trap command catch the error through ERR and send to the specified Signal

##### Example:

         failure(){
                echo "failed at: $1, $2"
         }

        trap 'failure "$LINENO" "$BASH_COMMAND"' ERR

#### while loop

reading the output, reading the files
FILES= /var/log/nginx/access.log

        while(condition)
        do


        done <<< FILES


        while IFS read -r file
        do
        echo "$file"

        done <<< FILES

#### Crontab -e

To schedule the script periodically

#### Nginx error logs and acess logs

/var/log/accesslogs
/var/log/errorlogs

#### Make script as Native Command

##### make 19-backup.sh script executable

         chmod +x 19-backup.sh

##### Move script to /bin directory where all commands are there( cp, mv ....)

       sudo cp 19-backup.sh /bin/backup

##### now we can use backup as command

            backup
