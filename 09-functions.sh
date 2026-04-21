#!/bin/bash

#defining the user id variable
userid=(id -u)

#if condition to check if the user is root or not
if [ $userid -nq 0 ]; then
	echo "Please login with Root user"
	exit 1
fi

#validate functiion will not excute
validate()
{
    if [ $1 -ne 0 ]; then
	echo "$2 installation -------FAILURE"
	exit 1
   else 
	echo "$2 installation -----SUCCESS" 
    fi 
}

#installing nginx, mysql and nodejs using yum and dnf package manager
yum install nginx -y
#checking the exit status of the previous command and printing the appropriate message
validate $? "NGINX"


yum install mysql -y
validate $? "MySQL"

dnf install nodejs -y
validate $? "nodejs"