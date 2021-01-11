#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start

mysql < /etc/init_db.sql
mysql wordpress < /etc/wordpress_db.sql

rc-service mariadb stop

/usr/bin/mysqld_safe
