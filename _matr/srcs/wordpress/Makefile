build:
	docker build -t wordpress:matrus .

run:
	docker run -p 5050:5050 -d --name wordpress wordpress:matrus

runit:
	docker run -p 5050:5050 -it wordpress:matrus sh

rm:
	docker rm $$(docker ps -aq)

st:
	docker stop $$(docker ps -q)

exe: rm run
	docker exec -it wordpress sh
