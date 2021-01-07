# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sadolph <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/01 22:22:38 by sadolph           #+#    #+#              #
#    Updated: 2020/11/04 23:05:24 by sadolph          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="sadolph"

RUN			adduser -D -g 'www' www

RUN			apk update && apk upgrade && apk add					\
 			php7													\
 			php7-fpm												\
 			php7-opcache											\
			php7-gd													\
			php7-mysqli												\
			php7-zlib												\
			php7-curl												\
			php7-mbstring											\
			php7-json												\
			php7-session											\
 			--no-cache nginx 										\
 			supervisor												\
 			openrc

RUN			wget https://wordpress.org/latest.tar.gz
RUN			tar -xzvf latest.tar.gz
RUN			rm -rf latest.tar.gz
RUN			mv wordpress /var/www

RUN			mkdir /www
RUN			chown -R www:www /www
RUN			chown -R www:www /var/lib/nginx
RUN			mkdir -p /var/run/php
RUN			mkdir -p /var/run/nginx
RUN			touch /var/run/nginx/nginx.pid

#COPY		localhost.conf /etc/nginx/nginx.conf
RUN			rm -rf /etc/nginx/conf.d/default.conf
COPY		nginx_default /etc/nginx/conf.d/default.conf
COPY		supervisor.conf /etc/supervisord.conf
COPY		wp-config.php /var/www/wordpress/wp-config.php

EXPOSE		5050

ENTRYPOINT	["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
