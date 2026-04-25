#!/bin/bash

LOG_FOLDER=/var/log/shellscript
LOG_FILE=/var/log/shellscript/$(basename $0).log

USER=$(id -u)

if [ "$USER" -ne 0 ];then
	echo "Please log in with root user"
	exit 1
fi

mkdir -p "$LOG_FOLDER"

validate(){
	if [ $1 -ne 0 ];then
		echo "$2 installation.....FAILURE"
		exit 1
	else 
		echo "$2 installation.....SUCCESS"
	fi
}

#$@ is a special variable in shell scripting that means:
# “all the arguments passed to the script”

for package in "$@"
do 
	dnf install "$package" -y &>> "$LOG_FILE"
	validate $? "$package"
done