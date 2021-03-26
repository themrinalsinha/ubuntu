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
        sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
        check_status

        echo -e "\n---- Adding Docker's official GPG key ----\n"
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        check_status

        echo -e "\n---- Updating source list ----\n"
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        check_status

        echo -e "\n---- Install Docker Engine ----\n"
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io -y
        check_status
    fi

    if [ -f /etc/redhat-release ]; then
        echo -e "\n${BOLD}${YELLOW}---- REDHAT BASED MACHINE ----${RESET}\n"

        echo -e "\n---- Installing Prerequisite ----\n"
        sudo yum install -y yum-utils
        check_status

        echo -e "\n---- Updating source list ----\n"
        sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        check_status

        echo -e "\n---- Install Docker Engine ----\n"
        sudo yum install docker-ce docker-ce-cli containerd.io -y
        check_status
    fi

    echo -e "\n${BOLD}${YELLOW}---- Installing Docker Compose ----${RESET}\n"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
    check_status

    echo -e "\n---- Making docker-compose executable ----\n"
    sudo chmod +x /usr/bin/docker-compose
    check_status

    echo -e "\n---- Starting docker (fail safe) ----\n"
    sudo systemctl start docker.service
    check_status

    echo -e "\n${BOLD}${YELLOW}---- ( DONE ) ----${RESET}\n"
fi
