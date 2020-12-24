#!/bin/sh

openrc default
php-fpm7 -R
nginx -g 'daemon off;'
