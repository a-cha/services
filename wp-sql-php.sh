#! /bin/sh

# WP-SQL-PHP

eval $(minikube docker-env)

if [[ $1 == 're' ]]
then
	kubectl delete deploy mysql-deployment
	kubectl delete svc mysql-service
	kubectl delete svc mysql-svc
	kubectl delete deploy wordpress-deployment
	kubectl delete svc wordpress-service
	kubectl delete deploy php-deployment
	kubectl delete svc php-service
#	kubectl delete pod mysql-deployment
#	kubectl delete pvc mysql-pv-claim
#	kubectl delete pv mysql-pv-storage
fi

if [[ $2 == 'all' ]]
then
  docker rmi -f mysql_image
  docker rmi -f php_image
  docker rmi -f wordpress_image
fi

#docker build -t mysql_image ./rus/srcs/mysql
docker build -t mysql_image srcs/mysql
docker build -t php_image srcs/phpmyadmin
docker build -t wordpress_image srcs/wordpress
kubectl apply -k ./

if [[ $1 != 'd' ]] && [[ $2 != 'd' ]]
then
	minikube dashboard
fi
