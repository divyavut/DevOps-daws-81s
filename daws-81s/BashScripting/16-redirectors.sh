#!bin/bash

#create a log folder in /var/log
LOG_FOLDER=/var/log/shell-script/
SCRIPT_NM=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
mkdir -p $LOG_FOLDER
LOG_FILE="${LOG_FOLDER}/${SCRIPT_NM}-${TIMESTAMP}.log"

#Color Codes
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Step1 : Check User have Super User previllages to run the script
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    # echo -e "$R User should have super user Previllages to run the script $N" &>>$LOG_FILE
    echo -e "$R User should have super user Previllages to run the script $N" | tee -a $LOG_FILE
    exit 1
fi

VERIFY_INSTALLATION() {
 if [ $1 -ne 0 ]
 then 
    # echo -e "$2 is...$R FAILED $N" &>>$LOG_FILE
    echo -e "$2 is...$R FAILED $N" | tee -a $LOG_FILE 
    exit 1
 else
    # echo -e "$2 is...$G SUCCESS $N" &>>$LOG_FILE
    echo -e "$2 is...$G SUCCESS $N" | tee -a $LOG_FILE 
 fi
} 
USAGE(){
    echo -e "$R USAGE:: $N sudo 16-redirectors.sh package1 package2 ..."
    exit 1
}
# echo "Script Started execting at: $(date)" &>>$LOG_FILE
 echo "Script Started execting at: $(date)" | tee -a $LOG_FILE
if [ $# -eq 0 ]
then 
    USAGE 
fi
#Step2: Check the Package is Already installed
for package in $@ #($@ holds the argumnets like git, mysql-server, nginx)
do 
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then
    # echo "$package has to be installed, please install it" &>>$LOG_FILE
    echo "$package has to be installed, please install it" | tee -a $LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    #Step3: Verify the Package is sucessfully installed or not
    VERIFY_INSTALLATION $? "Installing $package" 
  else
    # echo -e "$package is already $Y installed, nothing to do. $N" &>>$LOG_FILE
    echo -e "$package is already $Y installed, nothing to do. $N" | tee -a $LOG_FILE
  fi
done