#!bin/sh

openrc default
/etc/init.d/mariadb setup

rc-service mariadb start
mysql < etc/wpdb_create.sql
mysql wordpress < etc/wordpress.sql
rc-service mariadb stop

/usr/bin/mysqld_safe
