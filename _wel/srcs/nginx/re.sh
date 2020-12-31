!#/bin/sh
kubectl delete deploy nginx
kubectl delete svc nginx-svc
eval $(minikube docker-env)
docker build -t nginx_image .
kubectl apply -f nginx.yaml
