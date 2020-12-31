build:
	docker build -t mysql:matrus .

run:
	docker run -p 3306:3306 -d mysql:matrus

runit:
	docker run -p 3306:3306 -it mysql:matrus sh

rm:
	docker rm $$(docker ps -aq)
