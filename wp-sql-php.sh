#! /bin/sh

# WP-SQL-PHP

eval $(minikube docker-env)

if [[ $1 == 're' ]]
then
	kubectl delete deploy wordpress-deployment
	kubectl delete svc wordpress-service
#	kubectl delete deploy mysql-deployment
#	kubectl delete svc mysql-service
#	kubectl delete deploy php-deployment
#  kubectl delete svc php-service
fi

if [[ $2 == 'all' ]]
then
  kubectl delete pvc --all
  kubectl delete pv --all
  docker rmi -f mysql_image
  docker rmi -f php_image
  docker rmi -f wordpress_image
fi

#docker build -t php_image srcs/phpmyadmin
#docker build -t php_image ./_wel/srcs/php

#docker build -t mysql_image ./_rus/srcs/mysql
#docker build -t mysql_image _wel/srcs/mysql
#docker build -t mysql_image srcs/mysql

#docker build -t wordpress_image _matr/srcs/wordpress
#docker build -t wordpress_image _rus/srcs/wordpress
#docker build -t wordpress_image _wel/srcs/wordpress
docker build -t wordpress_image srcs/wordpress

kubectl apply -k ./

if [[ $1 != 'd' ]] && [[ $2 != 'd' ]] && [[ $3 != 'd' ]]
then
	minikube dashboard
fi
