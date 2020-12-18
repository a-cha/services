# /bin/sh

# NGINX

if [[ $1 == 're' ]]
then
	kubectl delete deploy nginx-deployment
	kubectl delete svc nginx-service
fi

if [[ $(kubectl get pods | grep "nginx-deployment" | awk '{ print $2 }') != "1/1" ]] || [[ $1 == 'force' ]]
then
	docker build -t nginx_image srcs/nginx
	kubectl apply -f srcs/nginx/nginx.yaml
fi

if [[ $1 != 'd' ]] && [[ $2 != 'd' ]]
then
	minikube dashboard
fi
