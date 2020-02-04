#!/bin/bash
#overide system cd to allow *
cd(){ builtin cd "${@:1:1}"; }

# Setting up swap partition
echo '----------------------------------------'
echo -e 'SETTING UP SWAP PARTITION:'
echo '----------------------------------------'
sudo dd if=/dev/zero of=/swapfile bs=4M count=500
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon -s
echo '/swapfile swap swap defaults 10 10' >> /etc/fstab
sudo echo 20 >> /proc/sys/vm/swappiness
sudo echo vm.swappiness = 20 >> /etc/sysctl.conf
sleep 3

echo '----------------------------------------'
echo -e 'SETTING UP BLOCKCHAIN EXPLORER REQUIREMENTS:'
echo '----------------------------------------'
export LC_ALL=C
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install jq vsftpd aptitude apache2-utils sqlite3 libsqlite3-dev python-dev gcc python-pip
sudo pip install --upgrade pip
wget https://pypi.python.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz
tar -xvzf pycrypto-2.6.1.tar.gz
cd pycrypto*
sudo python setup.py install
sleep 2
sudo service apache2 restart