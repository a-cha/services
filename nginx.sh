#! /bin/sh

# NGINX

if [[ $1 == 're' ]]
then
	kubectl delete deploy nginx-deployment
	kubectl delete svc nginx-service
fi

if [[ $2 == 'all' ]]
then
  docker rmi -f nginx_image
fi

docker build -t nginx_image srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

if [[ $1 != 'd' ]] && [[ $2 != 'd' ]] && [[ $3 != 'd' ]]
then
	minikube dashboard
fi
