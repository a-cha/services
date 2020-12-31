FROM alpine:latest

USER root

#base install

RUN apk update && apk upgrade
RUN apk add --no-cache php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-fpm nginx openrc


RUN wget https://wordpress.org/wordpress-5.5.3.tar.gz
RUN tar -xzvf wordpress-5.5.3.tar.gz
RUN rm wordpress-5.5.3.tar.gz
RUN mv wordpress /

#copy conf
COPY ./wp-config.php /wordpress
COPY ./nginx-conf /etc/nginx/conf.d/default.conf

RUN chgrp -R www-data /wordpress && \
chmod -R 775 /wordpress && \
mkdir -p /run/nginx

EXPOSE 80
COPY ./start.sh /
RUN chmod +x /start.sh
CMD ./start.sh
