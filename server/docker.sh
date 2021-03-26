#!/bin/bash

SYSTEM=$(uname -s)

# helper function to check command execution status
# defining color encoding
tput clear
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
RESET=`tput sgr0`
BOLD=`tput bold`

# function to check status
check_status()
{
    if [ $? -eq 0 ]; then
        echo " ->${GREEN} SUCCESSFUL${RESET}"
    else
        echo " ->${RED} FAILED${RESET}"
    fi
}

if [[ "$SYSTEM" == "Linux" ]]; then

    if [ -f /etc/lsb-release ]; then
        echo -e "\n${BOLD}${YELLOW}---- DEBIAN BASED MACHINE ----${RESET}\n"
        sudo apt-get update && sudo apt-get upgrade -y
        check_status

        echo -e "\n---- Installing Prerequisite ----\n"
        sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
        check_status

        echo -e "\n---- Adding Docker's official GPG key ----\n"
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        check_status

        echo -e "\n---- Updating source list ----\n"
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        check_status

        echo -e "\n---- Install Docker Engine ----\n"
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io
        check_status
    fi

    if [ -f /etc/redhat-release ]; then
        echo -e "\n${BOLD}${YELLOW}---- REDHAT BASED MACHINE ----${RESET}\n"

    fi

fi
