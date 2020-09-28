## System Management Scripts (Ubuntu)
![DEPLOY (dl.mrinal.xyz)](https://github.com/TheMrinalSinha/ubuntu/workflows/DEPLOY%20(dl.mrinal.xyz)/badge.svg)

| Tested on |
|- |
| Ubuntu 18.xx (Bionic Beaver) |
| Ubuntu 20.xx (Focal Fossa) |
--------------------------------
### Scripts
- **desktop/setup.sh**
  - To run: `$ wget -O - https://dl.mrinal.xyz/ubuntu/desktop/setup.sh | bash`
  - It will install all the necessary **packages** required post OS installation and otherwise.
  - `'git'
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
    'openssl-dev'
    'python3-pip'
    'python3-dev'
    'dconf-editor'
    'gnome-tweaks'
    'libxml2-utils'
    'build-essential'
    'materia-gtk-theme'
    'apt-transport-https'
    'indicator-multiload'
    'gnome-shell-extensions'`
  - enables `minimize` and `maximize` by editing dconf setting
  - installs flat icons theme from [snwh](https://launchpad.net/~snwh/+archive/ubuntu/ppa?field.series_filter=bionic)
  - Installs `docker` and `docker-compose` (and enable access for non-root user)
  - NOTE: **POST INSTALLATION**
    - if you want to change the default terminal use command `$ sudo update-alternatives --config x-terminal-emulator`
    - if you want to setup default `shell` as `zsh` use command `$ chsh` in prompt enter `/bin/zsh` and reboot. (it will set default shell as zsh)
    - run docker without sudo
      ```shell
      $ sudo usermod -aG docker ${USER}
      $ su - ${USER}
      $ id -nG
      $ sudo usermod -aG docker ${USER}
      ```

- **server/setup.sh**
    - To run: `$ wget -O - https://dl.mrinal.xyz/ubuntu/server/setup.sh | bash`
    - It will install base packages for new instances
    - `'apt-transport-https'
    'build-essential'
    'mitmproxy'
    'htop'
    'git'
    'zip'
    'make'
    'unzip'
    'libc-dev'
    'libffi-dev'
    'python3-pip'
    'python3-dev'
    'libxml2-utils'`

- **server/docker.sh**
    - To run: `$ wget -O - https://dl.mrinal.xyz/ubuntu/server/docker.sh | bash`
    - installs and setup `docker` and `docker-compose` on server

- **server/disk_check.sh**
    - To run: `$ wget -O - https://dl.mrinal.xyz/ubuntu/server/disk_check.sh | bash`
    - it will just help in checking the disk speed (mostly used to find if the server is having an HDD or SSD)
- **system benchmarking**
    - To run: `$ wget -O - bench.sh | bash`
    - it will help you in finding out the system details like
      - `CPU model and cores`, `Disk`, `Memory`, `Swap`, `OS`, `Architecture`, `Kernel`, `Location & Region etc...`
    - Along with that `I/O` and `Network Speed`
