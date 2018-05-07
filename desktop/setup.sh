#!/bin/bash

# DEFINING COLORS
tput clear
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
RESET=`tput sgr0`
BOLD=`tput bold`

# CHECK IF ERROR.
check_status()
{
    if [ $? -eq 0 ]; then
        echo " ->${GREEN} SUCCESSFUL${RESET}"
    else
        echo " ->${RED} FAILED${RESET}"
    fi
}

essential_packages=(
    'build-essential'
    'g++'
    'git'
    'zip'
    'htop'
    'cmake'
    'gdebi'
    'alien'
    'unzip'
    'synaptic'
    'libpq-dev'
    'checkinstall'
    'libxml2-dev'
    'libxslt1-dev'
    'zlib1g-dev'
    'libffi-dev'
    'libssl-dev'
    'openssh-server'
)

utility_packages=(
    'sshfs'
    'putty'
    'gparted'
    'redshift'
    'filezilla'
    'mitmproxy'
    'redshift-gtk'
    'unity-tweak-tool'
)

web_db_server=(
    'nginx'
    'sqlite3'
    'pgadmin3'
    'docker.io'
    'gunicorn3'
    'postgresql'
    'postgresql-contrib'
)

python_packages=(
    'virtualenv'
    'python-tk'
    'python-dev'
    'python-numpy'
    'python3-dev'
    'python3-tk'
    'python3-numpy'
    'python3-selenium'
    'python3-flask'
    'python3-pip'
    'python3-scipy'
    'python3-nltk'
    'python3-lxml'
    'python3-psutil'
    'python3-urllib3'
    'python3-twisted'
    'python3-openpyxl'
    'python3-matplotlib'

)

python_pip_packages=(
    'tqdm'
    'scrapy'
    'django'
    'pillow'
    'blessed'
    'requests'
    'fake-useragent'
)

# UPDATING AND UPGRADING SYSTEM
sudo echo -e "\n${BOLD}${YELLOW}STARTING SYSTEM UPDATE${RESET}"
sudo xterm -e 'apt update -y && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y'
check_status

sudo echo -e "\n${BOLD}${YELLOW}INSTALLING ESSENTIAL PACKAGES${RESET}\n"
for pkg in "${essential_packages[@]}"; do
    echo "${YELLOW}Installing :${RESET} ${BOLD}$pkg${RESET}"
    sudo apt install "$pkg" -y &> /dev/null
    check_status
done

sudo echo -e "\n${BOLD}${YELLOW}INSTALLING UTILITY PACKAGES${RESET}\n"
for pkg in "${utility_packages[@]}"; do
    echo "${YELLOW}Installing :${RESET} ${BOLD}$pkg${RESET}"
    sudo apt install "$pkg" -y &> /dev/null
    check_status
done

sudo echo -e "\n${BOLD}${YELLOW}INSTALLING WEB & DATABASE SERVER PACKAGES${RESET}\n"
for pkg in "${web_db_server[@]}"; do
    echo "${YELLOW}Installing :${RESET} ${BOLD}$pkg${RESET}"
    sudo apt install "$pkg" -y &> /dev/null
    check_status
done

sudo echo -e "\n${BOLD}${YELLOW}INSTALLING PYTHON PACKAGES${RESET}\n"
for pkg in "${python_packages[@]}"; do
    echo "${YELLOW}Installing :${RESET} ${BOLD}$pkg${RESET}"
    sudo apt install "$pkg" -y &> /dev/null
    check_status
done

sudo echo -e "\n${BOLD}${YELLOW}INSTALLING PYTHON PACKAGES (Via. PIP)${RESET}\n"
sudo echo -e "\tUpdating pip3..."
pip3 install --upgrade pip --user
for pkg in "${python_pip_packages[@]}"; do
    echo "${YELLOW}Installing :${RESET} ${BOLD}$pkg${RESET}"
    pip3 install --upgrade "$pkg" --user &> /dev/null
    check_status
done
