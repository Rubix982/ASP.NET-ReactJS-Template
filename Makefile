stop:
	docker container stop $(docker ps -aq)

delete:
	docker container rm $(docker ps -aq)

remove:
	sudo docker-compose down --remove-orphans

build:
	sudo docker-compose -f docker-compose.dev.yml up --build

up:
	sudo docker-compose -f docker-compose.dev.yml up

ps:
	sudo docker-compose ps -a