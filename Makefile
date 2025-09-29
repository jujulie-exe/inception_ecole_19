# Path al file docker-compose
COMPOSE_FILE=srcs/docker-compose.yml
DOCKER_COMPOSE=docker compose -f $(COMPOSE_FILE)

.PHONY: up down build logs restart re reset db-show db-shell

up:
	$(DOCKER_COMPOSE) up -d
	sleep 40 
	echo "GO GO GO"

down:
	$(DOCKER_COMPOSE) down

build:
	$(DOCKER_COMPOSE) build

logs:
	$(DOCKER_COMPOSE) logs -f
show-db:
	$(DOCKER_COMPOSE) exec  mariadb mariadb-show $$DOCKER_TABLE_NAME
db-shell:
	$(DOCKER_COMPOSE) exec  mariadb bash
ps:
	$(DOCKER_COMPOSE) ps
stop:
	$(DOCKER_COMPOSE) stop
kill:
	$(DOCKER_COMPOSE) kill
reset:
	$(DOCKER_COMPOSE) down -v



re: kill reset build up

restart: down up
