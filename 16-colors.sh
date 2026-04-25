#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

LOG_FOLDER=/var/log/shellscript
LOG_FILE=/var/log/shellscript/$(basename $0).log

USER=$(id -u)

if [ "$USER" -ne 0 ];then
    echo -e "${R}Please log in with root user${N}"
    exit 1
fi

mkdir -p "$LOG_FOLDER"
validate(){
    if [ $1 -ne 0 ];then
        echo -e "${R}$2 installation.....FAILURE${N}"
        exit 1
    else 
        echo -e "${G}$2 installation.....SUCCESS${N}"
    fi
}

#$@ is a special variable in shell scripting that means:
# “all the arguments passed to the script”
for package in "$@"
do 
    dnf list installed "$package" &>> "$LOG_FILE"
    if [ $? -ne 0 ]; then
        echo -e "${Y}$package not installed, installing now${N}"
        dnf install "$package" -y &>> "$LOG_FILE"
        validate $? "$package installation"
    else
        echo -e "${G}$package already installed, skipping${N}"
    fi
done    