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
    'unzip'
    'mitmproxy'
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
check_status

# setting up zsh
sudo echo -e "\n${BOLD}${YELLOW}Setting up zsh terminal${RESET}\n"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
check_status
