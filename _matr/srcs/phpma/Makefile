build:
	docker build -t phpmyadmin:matrus .

run:
	docker run -p 5050:5050 -d --name phpmyadmin phpmyadmin:matrus

runit:
	docker run -p 5050:5050 -it phpmyadmin:matrus sh

rm:
	docker rm $$(docker ps -aq)

st:
	docker stop $$(docker ps -q)

exe: rm run
	docker exec -it phpmyadmin sh
