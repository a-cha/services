#! /bin/sh

# WP-SQL-PHP

if [[ $1 == 're' ]]
then
	kubectl delete deploy wp-mysql-deployment
	kubectl delete svc wp-mysql-service
	kubectl delete deploy wordpress-deployment
	kubectl delete svc wordpress-service
	kubectl delete deploy php-deployment
	kubectl delete svc php-service
fi

if [[ $(kubectl get pods | grep "wordpress-deployment" | awk '{ print $2 }') != "1/1" ]] || \
	[[ $(kubectl get pods | grep "wordpress-deployment" | awk '{ print $2 }') != "1/1" ]] || \
	[[ $1 == 'force' ]]
then
	docker build -t mysql_image srcs/mysql 
	docker build -t wordpress_image srcs/wordpress
	docker build -t php_image srcs/phpmyadmin
	kubectl apply -k ./
fi

if [[ $1 != 'd' ]] && [[ $2 != 'd' ]]
then
	minikube dashboard
fi
