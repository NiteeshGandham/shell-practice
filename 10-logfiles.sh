#!/bin/bash

#defining user id variable
userid=$(id -u)

#defining log folder and log file variable
LOG_FOLDER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"

if [ $userid -ne 0 ];then
	echo "Please login with root user.."
	exit 1
fi

validate(){
	if [ $1 -ne 0 ];then
		echo "$2 installation is Failure"
	else
		echo "$2 installations is Successful"
	fi
}

#creating log folder if not exist
mkdir -p $LOG_FOLDER


#dnf install nginx and mysql and redirecting the output to log file
dnf install nginx -y &>> $LOG_FILE
validate $? nginx

dnf install mysql -y &>> $LOG_FILE
validate $? mysql