build:
	docker build -t influxdb:matrus .

run:
	docker run -p 5050:5050 -d --name influxdb influxdb:matrus

runit:
	docker run -p 5050:5050 -it influxdb:matrus sh

rm:
	docker rm $$(docker ps -aq)

st:
	docker stop $$(docker ps -q)

exe: rm run
	docker exec -it influxdb sh
