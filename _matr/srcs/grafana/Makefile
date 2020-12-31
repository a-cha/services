build:
	docker build -t grafana:matrus .

run:
	docker run -p 5050:5050 -d --name grafana grafana:matrus

runit:
	docker run -p 5050:5050 -it grafana:matrus sh

rm:
	docker rm $$(docker ps -aq)

st:
	docker stop $$(docker ps -q)

exe: rm run
	docker exec -it grafana sh
