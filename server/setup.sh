#!/bin/bash

# defining colors
tput clear
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
RESET=`tput sgr0`
BOLD=`tput bold`

# setting up flag to check task execution
check_status()
{
    if [ $? -eq 0 ]; then
        echo " ->${GREEN} SUCCESSFUL${RESET}"
    else
        echo " ->${RED} FAILED${RESET}"
    fi
}

ESSENTIAL_PACKAGES=(
    'build-essential'
    'mitmproxy'
    'htop'
    'git'
    'zip'
    'python3-pip'
    'python3-dev'
)

# Updating and upgrading system
sudo echo -e "\n${BOLD}${YELLOW}Starting system update${RESET}"
sudo apt update -y && sudo apt upgrade -y
sudo apt autoclean && sudo apt autoremove

# Installing essential packages
sudo echo -e "\n${BOLD}${YELLOW}Installing Essestial Packages${RESET}\n"
for pkg in "${ESSENTIAL_PACKAGES[@]}"; do
    echo "${YELLO}Installing - ${RESET} ${BOLD}$pkg${RESET}"
    sudo apt install "$pkg" -y &> /dev/null
    check_status
done
