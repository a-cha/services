#!/bin/bash

openrc default
mysql_install_db
rc-service mariadb start

echo CREATE DATABASE wordpress_db\; | mysql
echo CREATE USER 'admin'@'%' IDENTIFIED BY 'admin'\; | mysql
echo GRANT ALL PRIVILEGES ON wordpress_db.* TO 'admin'@'%'\; | mysql
echo FLUSH PRIVILEGES\; | mysql

mysql wordpress_db < wordpress_db.sql
rc-service mariadb stop
exec /usr/bin/mysqld_safe
