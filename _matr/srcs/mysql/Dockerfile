FROM alpine:latest

LABEL maintainer=matrus

RUN apk add mariadb mariadb-client\
	openrc

VOLUME ["/sys/fs/cgroup"]
VOLUME ["/var/lib/mysql"]

COPY my.cnf /etc/mysql/
COPY wpdb_create.sql /etc/
COPY wordpress.sql /etc/
COPY configure.sh /etc/


EXPOSE 3306

CMD ./etc/configure.sh
