#! /bin/sh

# FTPS

eval "$(minikube docker-env)"

if [ "$1" = 're' ]
then
	kubectl delete deploy ftps-deployment
	kubectl delete svc ftps-service
fi

if [ "$2" = 'all' ]
then
  docker rmi -f ftps_image
fi

docker build -t ftps_image srcs/ftps

kubectl apply -f srcs/ftps/ftps.yaml

if [ "$1" != 'd' ] && [ "$2" != 'd' ] && [ "$3" != 'd' ]
then
	minikube dashboard
fi
