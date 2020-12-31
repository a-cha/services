FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add mysql mysql-client openrc

COPY my.cnf /etc/mysql/
COPY s.sh /
COPY db.sql /

RUN chmod -R 755 /s.sh

VOLUME ["/var/lib"]
VOLUME ["/sys/fs/cgroup"]

EXPOSE 3306

ENTRYPOINT ["sh", "/s.sh"]
