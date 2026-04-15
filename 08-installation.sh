#!/bin/bash

#defining the user id variable
userid=(id -u)

#if condition to check if the user is root or not
if [ $userid -nq 0 ]; then
	echo "Please login with Root user"
	exit 1
fi

#installing nginx, mysql and nodejs using yum and dnf package manager
echo "Installing Ngnix"
yum install ngnix -y
#checking the exit status of the previous command and printing the appropriate message
if [ $? -ne 0 ]
	 echo "Installing Nginx ... FAILURE"
    exit 1
else
    echo "Installing Nginx ... SUCCESS"
fi


echo "Installing mysql"
yum install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing MySQL ... FAILURE"
    exit 1
else
    echo "Installing MySQL ... SUCCESS"
fi

dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "Installing nodejs ... FAILURE"
    exit 1
else
    echo "Installing nodejs ... SUCCESS"
fi
