#! /bin/bash

rc default
/etc/init.d/mariadb setup
rc-service mariadb start

echo "CREATE DATABASE wordpress_db;" | mysql
echo "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'root'@'192.168.99.101';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

rc-service mariadb stop
mysql wordpress -u root --skip-password < wordpress_db.sql
/usr/bin/mysqld_safe
