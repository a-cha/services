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

#
USER		root
#WORKDIR		project

RUN			apk update && apk upgrade &&									\
			apk add --no-cache nginx										\
			php7-common php7-iconv php7-json php7-gd php7-curl php7-xml 	\
			php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql 	\
			php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext 		\
			php7-ldap php7-ctype php7-dom php7-fpm							\
			openrc

RUN			mkdir www
RUN			wget http://wordpress.org/latest.tar.gz
RUN			tar -xzvf latest.tar.gz
RUN			rm latest.tar.gz
RUN			mv wordpress /www

RUN			chgrp -R root /www
RUN			chmod -R 775 /www
RUN			mkdir -p /run/nginx
RUN			chmod -R 775 /run/nginx

COPY		nginx_default /etc/nginx/conf.d/default.conf
COPY		wp-config.php /var/www/html/wp-config.php

EXPOSE		5050

COPY		start.sh /
RUN			chmod +x /start.sh
CMD			/start.sh
