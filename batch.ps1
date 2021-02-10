# PRODUCTION
## Stop all containers
function Stop {
	docker container stop $(docker ps -aq)
}
## Remove all containers
function Delete {
	docker container rm $(docker ps -aq)
}

# DEVELOPMENT
## Temporarily shut down containers
function Remove {
	docker-compose down --remove-orphans
}
## Build containers from scratch
function Build {
	docker-compose -f docker-compose.dev.yml up --build
}
## Start temporarily stopped containers again
function Up {
    docker-compose -f docker-compose.dev.yml up
}
## List all containers currently present
function PS {
	docker-compose ps -a
}

# CONTAINERS
## Client container
function Client-Container {
	docker exec -it client bash
}
## Backend container
function Backend-Container {
	docker exec -it backend bash
}
## Web Server Container
function Web-Server-Container {
	docker exec -it web-server bash
}
## PostGre Container
function Primary-Container {
	docker exec -it primary bash
}
## MongoDB Container
function Secondary-Container {
	docker exec -it secondary bash
}
## Cache container
function Cache-Container {
	docker exec -it cache bash
}
## SSH to containers
function SSH {
	ssh `grep 'deploy_user=' ./ansible/hosts | tail -n1 | awk -F'=' '{ print $2}'`@`awk 'f{print;f=0} /[production]/{f=1}' ./ansible/hosts | head -n 1
}

# TESTING
## Testing Server And Client
function Test {
	Write-Host "------------------"
	Write-Host "Testing For Server"
	Write-Host "------------------"
	cd ./Tests/server/
	dotnet test
	Write-Host "------------------"
	Write-Host "Testing For Client"
	Write-Host "------------------"
	cd ../../
	./client/node_modules/jest/node_modules/.bin/jest ./client/src/tests/App.test.tsx
}
function Lint {
	Write-Host "Linting client ... "
	./node_modules/.bin/eslint ./client/
}
function Lint-Fix {
	Write-Host "Running prettier and eslint on client for possible fix ... "
	./node_modules/.bin/prettier --write ./client/src/**/*.{"ts","tsx"}
	./node_modules/.bin/eslint ./client/ --fix
}

# DOTNET
## Make pre release for the project
function Prerelease {
	npm run --prefix client webpack:build
	./node_modules/.bin/cross-env ASPNETCORE_ENVIRONMENT=Production
	cd ./server/ && dotnet publish -c Release
}
## After making a pre release
function Postinstall {
	dotnet restore ./server/
}
## Create migration
function Migrate {
	# TODO: Create script to migrate database for serve {
	cd ./server/ 
	# node ./Scripts/create-migration.js 
	dotnet ef database update
}

# ANSIBLE
## Provision Containers
function Provision {
	ansible-playbook -l production -i ./ansible/config.yml ./ansible/provision.yml
}
## Deploy to containers
function Deploy {
	npm run prerelease 
	ansible-playbook -l production -i ./ansible/config.yml ./ansible/deploy.yml
}