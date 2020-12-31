FROM alpine:latest
USER root
RUN adduser -D -g 'www' www
RUN apk update && apk upgrade
RUN apk add nginx openssl openrc supervisor php7 php7-fpm php7-opcache \
                                                           php7-gd php7-mysqli php7-zlib php7-curl \
                                                           php7-mbstring php7-json php7-session
RUN rc-update add php-fpm7 default

RUN mkdir -p /var/www/phpmyadmin

RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		mkdir -p /var/run/nginx && \
        mkdir -p var/run/php/ && \
		touch /var/run/nginx/nginx.pid && \
		rm -rf /etc/nginx/conf.d/default.conf

COPY localhost.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/
COPY config.inc.php /var/www/phpmyadmin

ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz /
RUN tar -xzvf phpMyAdmin-4.9.7-all-languages.tar.gz --strip-components 1 -C /var/www/phpmyadmin
RUN rm -f phpMyAdmin-4.9.7-all-languages.tar.gz

RUN openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 90 \
            -nodes \
            -out localhost.crt \
            -keyout localhost.key \
            -subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/OU=welease/CN=www.localhost.com"

EXPOSE 5000
CMD ["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]