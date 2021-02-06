# PRODUCTION

## Stop all containers
stop:
	docker container stop $(docker ps -aq)

## Remove all containers
delete:
	docker container rm $(docker ps -aq)

# DEVELOPMENT

## Temporarily shut down containers
remove:
	sudo docker-compose down --remove-orphans

## Build containers from scratch
build:
	sudo docker-compose -f docker-compose.dev.yml up --build

## Start temporarily stopped containers again
up:
	sudo docker-compose -f docker-compose.dev.yml up

## List all containers currently present
ps:
	sudo docker-compose ps -a

# CONTAINERS

## Client container
client-con:
	sudo docker exec -it client bash

## Server container
server-con:
	sudo docker exec -it server

## Web Server Container
web-server-con:
	sudo docker exec -it web-server

## SMTP Container
smtp-con:
	sudo docker exec -it smtp

## PostGre Container
psotgres-con:
	sudo docker exec -it postgres

## MongoDB Container
mongo-con:
	sudo docker exec -it mongo

## Cache container
cache-con:
	sudo docker exec -it cache