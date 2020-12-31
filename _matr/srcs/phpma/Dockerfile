FROM alpine:latest

LABEL maintainer=matrus

RUN apk add --update nginx php7 php7-fpm php7-mysqli php7-json php7-iconv php7-mbstring php7-session supervisor && \
	rm -rf /etc/supervisord.conf && \
	rm -rf /etc/nginx/conf.d/default.conf && \
	mkdir /run/nginx && \
	touch /run/nginx/nginx.pid

ADD ./phpMyAdmin-4.9.5-all-languages.tar.gz /var/www/

COPY config.inc.php /var/www/phpMyAdmin-4.9.5-all-languages

#RUN mkdir /var/www/phpMyAdmin-4.9.5-all-languages/tmp

COPY supervisord.conf /etc/
COPY nginx.conf /etc/nginx/

EXPOSE 5000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

