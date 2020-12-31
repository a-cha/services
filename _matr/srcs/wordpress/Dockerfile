FROM alpine:latest

LABEL maintainer=matrus

RUN apk add --update nginx php7 php7-fpm php7-mysqli php7-json supervisor && \
	rm -rf /etc/supervisord.conf && \
	rm -rf /etc/nginx/conf.d/default.conf && \
	mkdir /run/nginx && \
	touch /run/nginx/nginx.pid && \
	rm -rf /var/www/wordpress/wp-config-sample.php

ADD wordpress-5.5.1-ru_RU.tar.gz /var/www/

COPY wp-config.php /var/www/wordpress/
COPY supervisord.conf /etc/
COPY nginx.conf /etc/nginx/

EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
