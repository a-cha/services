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

WORKDIR		/project

RUN			apk update && apk upgrade && apk add php7 php7-fpm php7-opcache \
			php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN			wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
			tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz &&				\
			rm phpMyAdmin-5.0.2-all-languages.tar.gz &&						\
			mv phpMyAdmin-5.0.2-all-languages /www

COPY		config.inc.php /www/

EXPOSE		5000

ENTRYPOINT	["php", "-S", "0.0.0.0:5000", "-t", "/www/"]
