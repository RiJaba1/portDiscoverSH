#!/bin/bash

# Tool made by RiJaba1 https://github.com/rijaba1 | https://rijaba1.github.io

declare -r green="\e[0;32m\033[1m"
declare -r normal="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
    tput cnorm
    echo -e "\n\n${normal}Saliendo..."
    sleep 0.2
    exit 1
}

echo -e "\n${normal}PORT DISCOVER BY RiJaba1\n"

ip_requisito='[0-9,]+[^.]'
while :
do
	read -rep $' - Inserte la IP: ' ip
	if [[ $ip =~ $ip_requisito ]];then
		break
	else
		clear
		echo -e " - $ip no es una IP.\n"
	fi
done

for port in $(seq 1 65535); do
	timeout 0.2 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo -e "\n${normal}Port $port - ${green}OPEN" &
done
