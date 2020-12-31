FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx wget supervisor mysql mysql-client openrc php7 php7-fpm php7-opcache \
                                            php7-gd php7-mysqli php7-zlib php7-curl \
                                            php7-mbstring php7-json php7-session
RUN adduser -D -g 'www' www
RUN rc-update add php-fpm7 default
RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN     rm -rf /etc/nginx/conf.d/default.conf
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/run/php
RUN touch /var/run/nginx/nginx.pid

COPY localhost.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY wp-config.php /var/www/wordpress/wp-config.php

RUN	sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf
RUN	sed -it 's/;   extension=mysql.so/extension=mysql.so/g' /etc/php7/php.ini


RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz -C /var/www/
RUN rm -rf latest.tar.gz

EXPOSE 5050

CMD ["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]