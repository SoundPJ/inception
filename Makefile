NAME = inception
HOSTV = /home/pjerddee/data
YML = ./srcs/docker-compose.yml

all:
	sudo mkdir -p $(HOSTV)/wordpress/
	sudo mkdir -p $(HOSTV)/database/
	docker compose -f $(YML) build --no-cache
	docker compose -f $(YML) up

$(NAME): all

up:
	docker compose -f $(YML) up

clean:
	docker compose -f $(YML) down

fclean: clean
	docker image rm wordpress:inception mariadb:inception nginx:inception
	sudo rm -rf $(HOSTV)
	docker volume rm database wordpress

re: fclean all

list:
	docker network ls
	docker volume ls
	docker ps -a
	docker image ls

.PHONY: all up clean fclean re list