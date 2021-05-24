#!/bin/bash

cd ~
sudo apt update
sudo apt upgrade -y

# Google Chrome Web Browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm -r ./google-chrome-stable_current_amd64.deb

# VScode
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# Sublime Text 3
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install sublime-text

# Git
sudo apt-get -y install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev
sudo apt-get -y install asciidoc xmlto docbook2x
sudo apt-get -y install install-info
cd /tmp
curl -o git.tar.gz https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.31.1.tar.gz
tar -zxf git.tar.gz
cd git-2.31.1
make configure
./configure --prefix=/usr
make all doc info
sudo make install install-doc install-html install-info
cd /home/$USER
git config --global user.name "giacomoquinalia"
git config --global user.email "giacomo.quinaliaq@gmail.com"


# Postgres
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql postgresql-contrib

# pgAdmin
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install -y pgadmin4


# Node js (14.x)
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt -y install nodejs
sudo apt -y install build-essential

# Yarn
sudo npm install -g yarn

# C lang
sudo apt -y install gcc

# Python
sudo apt-get -y install python3-venv

# Insomnia
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
sudo apt-get update
sudo apt-get install insomnia

# Postman
sudo snap install postman

# Virtual box
sudo apt install virtualbox

# Filezilla
sudo apt-get -y install filezilla

# Telegram
sudo snap install telegram-desktop

# Aliases
cat << EOF > /home/$USER/.bash_aliases
# Python/Django
alias pmrun="python manage.py runserver"
alias seba="source env/bin/activate"
alias sebarun="source env/bin/activate && python manage.py runserver"
alias pmmake="python manage.py makemigrations"
alias pmmig="python manage.py migrate"
alias fpre='find . -iname "__pycache__" -type d -exec rm -r {} 2>/dev/null \;'

# Docs
alias docs='cd /home/$USER/Documents'

# GCC compiler
alias comp='f(){ gcc "$1".c -o "$1"; unset -f f; }; f' 
alias compr='f(){ gcc "$1".c -o "$1"; ./"$1"; unset -f f; }; f'
EOF


