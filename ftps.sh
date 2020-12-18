# /bin/sh

# FTPS

if [[ $1 == 're' ]]
then
	kubectl delete deploy ftps-deployment
	kubectl delete svc ftps-service
fi

if [[ $(kubectl get pods | grep "ftps-deployment" | awk '{ print $2 }') != "1/1" ]] || [[ $1 == 'force' ]]
then
	docker build -t ftps_image srcs/ftps
	kubectl apply -f srcs/ftps/ftps.yaml
fi

if [[ $1 != 'd' ]] && [[ $2 != 'd' ]]
then
	minikube dashboard
fi
