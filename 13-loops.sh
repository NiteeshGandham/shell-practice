#!/bin/bash

LOG_FOLDER=/var/log/shellscript
LOG_FILE=/var/log/shellscript/$0.log

USER=$(id -u)

if [ $USER -ne 0 ];then
	echo "Please log in with root user"
	exit 1
fi

mkdir -p $LOG_FILE

validate(){
	if [ $1 -ne 0 ];then
		echo "$2 installation.....FAILURE"
		exit 1
	else 
		echo "$2 installation.....SUCCESS"
	fi
}


for package in $@
do 
	dnf install $package -y | tee -a $LOG_FILE
	validate $? "$package"
done