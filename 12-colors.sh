#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m" #Red
G="\e[32"  #Green
N="\e[0m"  #Normal color

echo "Script started executing at: $TIMESTAMP"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2....$R...FAILURE $N"
        exit 1
    else
        echo -e "$2 $R SUCCESS"
    fi  
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MySQL"

dnf install git -y &>>LOGFILE
VALIDATE $? "Installing Git"

dnf install dockerr -y  &>>LOGFILE
VALIDATE $? "Installing Docker"