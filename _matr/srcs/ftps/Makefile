build:
	docker build -t ftps:matrus .

run:
	docker run -p 21:21 -d ftps:matrus

runit:
	docker run -p 21:21 -it ftps:matrus sh

rm:
	docker rm $$(docker ps -aq)

st:
	docker stop $$(docker ps -q)

ft: build
	kubectl delete deploy ftps && kubectl apply -f ftps.yaml
