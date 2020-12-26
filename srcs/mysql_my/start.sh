#!/bin/sh

openrc default
mysql_install_db
#mysql install
#/etc/init.d/mariadb setup
rc-service mariadb start

#echo CREATE DATABASE IF NOT EXISTS wordpress\; | mysql
#echo CREATE USER \'admin\'@\'%\' IDENTIFIED BY \'admin\'\; | mysql
#echo GRANT ALL PRIVILEGES ON wordpress.* TO \'admin\'@\'%\'\; | mysql
#echo FLUSH PRIVILEGES\; | mysql
mysql < /etc/init_db.sql

mysql wordpress < /etc/wordpress_db.sql
rc-service mariadb stop

#rm -f /var/lib/mysql/aria_log.00000001
#rm -f /var/lib/mysql/aria_log_control

/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
#/usr/bin/mysqld_safe
#exec /usr/bin/mysqld_safe
