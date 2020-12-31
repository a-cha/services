FROM alpine:latest

USER root

#base install

RUN apk update && apk upgrade
RUN apk add --no-cache php7 php7-mbstring php7-cgi php7-openssl php7-session php7-zlib php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add --no-cache php7-fpm nginx openrc

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages /phpmyadmin

#copy conf
COPY ./config.inc.php /phpmyadmin/config.inc.php
COPY ./nginx-conf /etc/nginx/conf.d/default.conf

RUN chgrp -R www-data /phpmyadmin && \
chmod -R 775 /phpmyadmin && \
mkdir -p /run/nginx

EXPOSE 80
COPY ./start.sh /
RUN chmod +x /start.sh
CMD /start.sh