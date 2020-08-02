#!/bin/bash

# Update CentOS with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop


rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP

yum install -y php php-cli php-common php-devel php-mysql

# MySQL

yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/MoldavianRO/vagrant/master/files/index.html?token=AN3R47BVAYKPRT576TANDWK7E4JBO

sudo -u vagrant wget -q https://raw.githubusercontent.com/MoldavianRO/vagrant/master/files/info.php?token=AN3R47DM4HPEHWFQSKQY2ZS7E4JF2

service httpd restart
