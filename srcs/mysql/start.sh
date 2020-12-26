#!/bin/sh

openrc default
#mysql install
#/etc/init.d/mariadb setup
mysql_install_db
rc-service mariadb start

#echo CREATE DATABASE IF NOT EXISTS wordpress\; | mysql
#echo CREATE USER \'admin\'@\'%\' IDENTIFIED BY \'admin\'\; | mysql
#echo GRANT ALL PRIVILEGES ON wordpress.* TO \'admin\'@\'%\'\; | mysql
#echo FLUSH PRIVILEGES\; | mysql
mysql < /etc/init_db.sql
mysql wordpress < /etc/wordpress_db.sql

rc-service mariadb stop

exec /usr/bin/mysqld_safe
#/usr/bin/mysqld_safe
#exec /usr/bin/mysqld_safe
