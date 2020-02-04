curl -OL https://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config*
sudo apt-get update
apt-get install -y mysql-server mysql-client libmysqlclient-dev
wait
mysql_upgrade -u root -p