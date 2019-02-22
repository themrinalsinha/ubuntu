#!/bin/bash

# DEFINING COLORS
tput clear
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
RESET=`tput sgr0`
BOLD=`tput bold`

# CHECK IF ERROR
check_status()
{
    if [ $? -eq 0 ]; then
        echo "  ->${GREEN} SUCCESSFUL${RESET}"
    else
        echo "  ->${RED} FAILED${RESET}"
    fi

}

THEMES=(
    'vivacious-colors-gtk-dark'
    'vivacious-colors-gtk-light'
    'vivacious-unity-gtk-dark'
    'vivacious-unity-gtk-light'
)

# UPDATING AND UPGRADING SYSTEM
sudo echo -e "\n${BOLD}${YELLOW}STARTING SYSTEM UPDATE${RESET}"
sudo xterm -e 'apt update -y && apt upgrade -y && apt autoremove -y'
check_status

# INSTALLING THEME
sudo echo -e "\n${BOLD}${YELLOW}INSTALLING THEME (vivacious dark/light)${RESET}"
sudo add-apt-repository ppa:ravefinity-project/ppa -y &> /dev/null
sudo apt -y update &> /dev/null
for theme in "${THEMES[@]}"; do
    echo "${YELLOW}Installing :${RESET} ${BOLD}$theme${RESET}"
    sudo apt install "$theme" -y &> /dev/null
    done
check_status

# INSTALLING ICON
sudo echo -e "\n${BOLD}${YELLOW}INSTALLING ICON (flatbalous-blue)${RESET}"
sudo add-apt-repository ppa:noobslab/icons -y &> /dev/null
sudo apt -y update &> /dev/null
sudo apt install -y ultra-flat-icons &> /dev/null
check_status

# INSTALLING UBUNTU TWEAK TOOL
sudo echo -e "\n${BOLD}${YELLOW}INSTALLING (unity-tweak-tool)${RESET}"
sudo apt install -y unity-tweak-tool &> /dev/null
check_status

# REMOVING ALL THE GARBAGES.
sudo echo -e "\n${BOLD}${YELLOW}REMOVING TEMPERORY PPA${RESET}"
sudo add-apt-repository --remove ppa:ravefinity-project/ppa -y
sudo add-apt-repository --remove ppa:noobslab/icons -y
sudo apt -y autoremove && sudo apt -y autoclean
check_status

sudo echo -e "\n${BOLD}${YELLOW}<-- COMPLETED -->${RESET}"
