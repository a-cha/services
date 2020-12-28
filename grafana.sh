#! /bin/sh

# NGINX

eval $(minikube docker-env)

if [[ $1 == 're' ]]
then
	kubectl delete deploy grafana-deployment
	kubectl delete svc grafana-service
fi

if [[ $2 == 'all' ]]
then
  docker rmi -f grafana_image
fi

docker build -t grafana_image srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml

if [[ $1 != 'd' ]] && [[ $2 != 'd' ]] && [[ $3 != 'd' ]]
then
	minikube dashboard
fi
