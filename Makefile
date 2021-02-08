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

# TESTING

## Testing Server And Client
test:
	cd ./Tests/server/ && dotnet test && \\
	cd ../../ && cd ./client/ && ./node_modules/.bin/jest ./client/src/tests/About.test.tsx

lint:
	./node_modules/.bin/eslint ./client/

lint-fix:
	./node_modules/.bin/prettier --write ./client/src/**/*.ts{,x} && eslint ./client/ --fix

# DOTNET

## Make pre release for the project
prerelease:
	cross-env ASPNETCORE_ENVIRONMENT=Production && \\
	cd client && ./node_modules/.bin/webpack --config ./webpack.config.js \\
	&& cd ../server/ && dotnet publish --configuration Release

## After making a pre release
postinstall:
	dotnet restore ./server/

## Create migration
migrate:
	cd ./server/ && node ./Scripts/create-migration.js && dotnet ef database update

# ANSIBLE

## Provision Containers
provision:
	ansible-playbook -l production -i ./ansible/config.yml ./ansible/provision.yml

## Deploy to containers
deploy:
	npm run prerelease && ansible-playbook -l production -i ./ansible/config.yml ./ansible/deploy.yml

# COTAINERS

## SSH to containers
ssh:
	ssh `grep 'deploy_user=' ./ansible/hosts | tail -n1 | awk -F'=' '{ print $2}'`@`awk 'f{print;f=0} /[production]/{f=1}' ./ansible/hosts | head -n 1