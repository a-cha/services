FROM alpine:latest

#base install

RUN apk update && apk upgrade
RUN apk add mysql mysql-client openrc

#copy conf
COPY ./my.cnf /etc/mysql/
COPY ./mysql-svc.sql .
COPY ./new_db.sql .

#init
COPY ./start.sh .
RUN chmod +x /start.sh
EXPOSE 3306
CMD ./start.sh
