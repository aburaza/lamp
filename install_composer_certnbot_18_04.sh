 #!/bin/bash
set -euo pipefail
IFS=$'\n\t'
export LC_ALL=C
# Ubuntu 16.04 Dev Server
# Run like - bash install_lamp.sh
# Script should auto terminate on errors

echo -e "\e[96m Adding PPA  \e[39m"

sudo add-apt-repository -y ppa:certbot/certbot
sudo curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
sudo sh -c "echo deb https://deb.nodesource.com/node_8.x zesty main \
> /etc/apt/sources.list.d/nodesource.list"

sudo apt-get update

#install nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs


echo -e "\e[96m Restart apache server to reflect changes  \e[39m"
sudo service apache2 restart

echo -e "\e[96m Installing mysql server \e[39m"
echo -e "\e[93m User: root, Password: root \e[39m"


## certbot
echo -e "\e[96m Installing Certbot \e[39m"
sudo apt-get -y install python-certbot-apache


# Download and install composer 
echo -e "\e[96m Installing composer \e[39m"
# Notice: Still using the good old way
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Check composer version
composer --version


sudo apt-get clean

