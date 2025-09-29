# Path al file docker-compose
COMPOSE_FILE=srcs/docker-compose.yml
DOCKER_COMPOSE=docker-compose -f $(COMPOSE_FILE)

.PHONY: up down build logs restart re

up:
	$(DOCKER_COMPOSE) up 

down:
	$(DOCKER_COMPOSE) down -v

build:
	$(DOCKER_COMPOSE) build

logs:
	$(DOCKER_COMPOSE) logs -f

re: down build up

restart: down up

