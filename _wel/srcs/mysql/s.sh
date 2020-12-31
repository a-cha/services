#!/bin/bash

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "create database db;" | mysql
echo "grant all on *.* to admin@'%' identified by 'admin' with grant option; flush privileges;" | mysql
mysql db < db.sql
rc-service mariadb stop

/usr/bin/mysqld_safe
sh
