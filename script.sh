#!/bin/bash

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo... ${endColour}"
	exit 1
}

echo "\n ${purpleColour}[+]${endColour} ${grayColour}Checando actualizaciones... ${endColour}"
sudo apt update -y
sudo apt upgrade -y

echo -e "\n ${greenColour}[+]${endColour}${grayColour}Installing Pip... ${endColour}"
sudo apt install python3-pip pipx -y

echo -e "\n ${greenColour}[+]${endColour}${grayColour}Installing NeoVim... ${endColour}"
sudo apt install neovim -y

echo "\n ${greenColour}[+]${endColour}${grayColour}Installing Nmap... ${endColour}"
sudo apt install nmap -y

echo "\n ${greenColour}[+]${endColour}${grayColour}Installing Apache server... ${endColour}"
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

echo "\n ${greenColour}[+]${endColour}${grayColour}Installing Impacket via pip... ${endColour}"
sudo apt install python3-impacket -y

echo "\n ${greenColour}[+]${endColour}${grayColour}Installing Build-Essential...${endColour}"
sudo apt install build-essential -y

echo "\n ${greenColour}[+]${endColour}${grayColour}Installing Sliver C2... ${endColour}"
sudo -u amnesia torify wget https://github.com/BishopFox/sliver/releases/latest/download/sliver-server_linux -O sliver-server
chmod +x sliver-server
sudo mv sliver-server /usr/local/bin/sliver-server

echo "\n ${greenColour}[+]${endColour}${grayColour}Installing Netexec... ${endColour}"
pipx ensurepath
sudo -u amnesia torify wget https://github.com/Pennyw0rth/NetExec -O netexec
chmod +x netexec

echo "\n ${greenColour}[+]${endColour}${grayColour}Installing Proxychains... ${endColour}"
sudo apt install proxychains -y

echo -e "\n ${greenColour}[!]Tails esta listo para ser usado.. {$endColour}"
