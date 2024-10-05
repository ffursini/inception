NAME = inception
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
DATA_PATH = /home/fursini/data

all: build up

build:
	@mkdir -p $(DATA_PATH)/wordpress
	@mkdir -p $(DATA_PATH)/mariadb
	@docker-compose -f $(DOCKER_COMPOSE_FILE) build

up:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean: down
	@docker system prune -af
	@docker volume rm $$(docker volume ls -q)
	@sudo rm -rf $(DATA_PATH)

fclean: clean
	@docker system prune -af --volumes

re: fclean all

.PHONY: all build up down clean fclean re

# Description:
# - 'make': Builds the Docker images and starts the containers
# - 'make build': Creates necessary directories and builds the Docker images
# - 'make up': Starts the containers in detached mode
# - 'make down': Stops and removes the containers
# - 'make clean': Stops containers, removes all unused Docker resources, and deletes data volumes and directories
# - 'make fclean': Performs a complete cleanup, including all Docker volumes
# - 'make re': Performs a complete cleanup and rebuilds/restarts the entire setup

