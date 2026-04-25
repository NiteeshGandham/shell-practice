#!/bin/bash

#creating log folder for the script
LOG_FOLDER=VAR/LOG/SHELL-SCRIPT

#creating log file for the script
LOG_FILE=VAR/LOG/SHELLSCRIPT/$0.log

#user with root privileges can run the script
USER=$(id -u)


#checking user with root privileges is running the script

if [ $USER -ne 0 ]; then
	echo "Please login with root user"
	exit 1
fi

mkdir -p $LOG_FOLDER

#validating the installation of nginx
validate(){
	if [ $1 -ne 0 ];then
		echo " $2 installation --------FALURE" | tee -a $LOG_FILE
		exit1
	else
		echo "$2 installation ---------SUCCESS"
	fi
}

#installing nginx
dnf install nginx -y
validate $? nginx | tee -a $LOG_FILE