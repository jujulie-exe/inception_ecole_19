# Path al file docker-compose
COMPOSE_FILE=srcs/docker-compose.yml
DOCKER_COMPOSE=docker compose -f $(COMPOSE_FILE)
DOCKER_VOLUME=srcs_wordpress srcs_mariadb

.PHONY: up down build logs restart re reset db-show db-shell

up:
	$(DOCKER_COMPOSE) up -d
	#sleep 15
	echo "GO GO GO"

down:
	$(DOCKER_COMPOSE) down -v

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
	$(DOCKER_COMPOSE) down
	docker volume rm -f $(DOCKER_VOLUME)
	sudo rm -fr ~/../jfranco/mariadb
	sudo rm -fr ~/../jfranco/wordpress
	sudo mkdir -p  ~/../jfranco/wordpress ~/../jfranco/mariadb
	sudo chmod 777 ~/../jfranco/wordpress
	sudo chmod 777 ~/../jfranco/mariadb




re: reset build up

restart: down up
