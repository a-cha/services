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

#WORKDIR		/project
RUN			adduser -D -g 'www' www

RUN			apk update && apk upgrade && apk add							\
			php7-common php7-iconv php7-json php7-gd php7-curl php7-xml 	\
			php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql 	\
			php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext 		\
			php7-ldap php7-ctype php7-dom php7-fpm							\
 			--no-cache nginx												\
			supervisor

#RUN			wget https://wordpress.org/wordpress-5.5.3.tar.gz
#RUN			tar -xzvf wordpress-5.5.3.tar.gz
#RUN			rm wordpress-5.5.3.tar.gz
RUN			wget http://wordpress.org/latest.tar.gz
RUN			tar -xzvf latest.tar.gz
RUN			rm latest.tar.gz
RUN			mkdir -p /www
RUN			mv wordpress /www

#RUN	sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf
#RUN	sed -it 's/;   extension=mysql.so/extension=mysql.so/g' /etc/php7/php.ini

RUN		chown -R www:www /www
RUN			mkdir -p /run/nginx
RUN		chown -R www:www /var/lib/nginx

RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/run/php
RUN			touch /run/nginx/nginx.pid

#RUN			chmod -R 775 /run/nginx
#RUN			touch /project/project.log
#RUN			chgrp -R root /
#RUN			chmod -R 775 /run/nginx

#RUN			chown -R www:www /var/lib/nginx
#RUN			chown -R www:www /

#RUN			rm -f /etc/nginx/nginx.conf
RUN			rm -f /etc/nginx/conf.d/default.conf
COPY		nginx_conf /etc/nginx/nginx.conf
#COPY		nginx_conf /etc/nginx/conf.d/default.conf
COPY		supervisor.conf /etc/supervisord.conf
#RUN			rm -rf /wordpress/wp-config-sample.php
COPY		wp-config.php /www/wordpress/

#RUN			chmod -R 755 /

EXPOSE		5050

ENTRYPOINT	["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

#COPY		start.sh /
#RUN			chmod +x /start.sh
#CMD			/start.sh
