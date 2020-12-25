#!/bin/bash

openrc default
#mysql_install_db
#mysql install
/etc/init.d/mariadb setup
rc-service mariadb start

echo CREATE DATABASE wordpress_db\; | mysql
echo GRANT ALL PRIVILEGES ON wordpress_db.* TO \'admin\'@\'%\'\ IDENTIFIED BY \'admin\' WITH GRANT OPTION\; | mysql
echo FLUSH PRIVILEGES\; | mysql

mysql wordpress_db < wordpress_db.sql
rc-service mariadb stop

#mv /var/lib/mysql/aria_log.00000001 /var/lib/mysql/aria_log.000000011
#mv /var/lib/mysql/aria_log_control /var/lib/mysql/aria_log_control1

/usr/bin/mysqld_safe
#exec /usr/bin/mysqld_safe
