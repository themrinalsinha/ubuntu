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
    'git'
    'zip'
    'zsh'
    'gcc'
    'htop'
    'make'
    'unzip'
    'libc-dev'
    'mitmproxy'
    'libffi-dev'
    'terminator'
    'python3-pip'
    'python3-dev'
    'dconf-editor'
    'gnome-tweaks'
    'libxml2-utils'
    'build-essential'
    'materia-gtk-theme'
    'apt-transport-https'
    'indicator-multiload'
    'gnome-shell-extensions'
)

# updating and upgrading before installation
sudo apt-get update && sudo apt-get upgrade -y

# Installing essential packages
sudo echo -e "\n${BOLD}${YELLOW}Installing Essestial Packages${RESET}\n"
for pkg in "${ESSENTIAL_PACKAGES[@]}"; do
    echo "${YELLO}Installing - ${RESET} ${BOLD}$pkg${RESET}"
    sudo apt install "$pkg" -y &> /dev/null
    check_status
done

# enabling minimize and maximize
sudo echo -e "\n${BOLD}${YELLOW}Enabling Minimize & Maximize${RESET}\n"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'toggle-maximize'
check_status

# setting up zsh
sudo echo -e "\n${BOLD}${YELLOW}Setting up zsh terminal${RESET}\n"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
check_status

# setting up flat icon
sudo echo -e "\n${BOLD}${YELLOW}Setting up flat icons${RESET}\n"
sudo add-apt-repository -u ppa:snwh/ppa -y
sudo apt install paper-icon-theme
check_status

# installing and setting up docker and docker-compose
sudo echo -e "\n${BOLD}${YELLOW}Starting docker installation${RESET}\n"
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# setting up docker compose
sudo echo -e "\n${BOLD}${YELLOW}Downloading and setting docker-compose${RESET}\n"
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
check_status

# installing lazy-git
sudo echo -e "\n${BOLD}${YELLOW}Setting up lazygit${RESET}\n"
sudo add-apt-repository ppa:lazygit-team/release -y
sudo apt-get update
sudo apt-get install lazygit -y
check_status

# cleaning junks
sudo echo -e "\n${BOLD}${YELLOW}Cleaning junks...${RESET}\n"
sudo apt autoclean && sudo apt autoremove
check_status
