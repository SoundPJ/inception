all:
	sudo mkdir -p /home/pjerddee/data/wordpress/
	sudo mkdir -p /home/pjerddee/data/database/
	docker compose -f ./srcs/docker-compose.yml up

up:
	docker compose -f ./srcs/docker-compose.yml up

clean:
	docker compose -f ./srcs/docker-compose.yml down

fclean: clean
	docker image rm srcs-wordpress srcs-mariadb srcs-nginx
	sudo rm -rf /home/pjerddee/data/
	docker volume rm database wordpress

re: fclean all

list:
	docker network ls
	docker volume ls
	docker ps -a
	docker image ls

bmrd:
	docker build -t mariadbd srcs/requirements/mariadb/

bmr:
	docker build -t mariadb srcs/requirements/mariadb-client/

bwp:
	docker build -t wordpress srcs/requirements/wordpress/

bnx:
	docker build -t nginx srcs/requirements/nginx

rnx:
	docker run -dit --rm --name nginx --network docker-network  nginx
	docker exec -it nginx bash

rwp:
	docker run -dit --rm --name wordpress --network docker-network wordpress
	docker exec -it wordpress bash

# Don't forget to change volume mount path
rmrd:
# docker run -dit --name mariadbd --network docker-network -p 3306:3306 -v ./mariadb_data:/var/lib/mysql mariadbd
# docker run -it --name mariadbd --network docker-network -v $(PWD)/mariadb_data:/var/lib/mysql mariadbd
# docker run -it --rm --name mariadbd --network docker-network mariadbd
	docker run -dit --rm --name mariadbd --network docker-network -v /home/pjerddee/data/database:/var/lib/mysql mariadbd
	docker exec -it mariadbd bash

rmr:
	docker run -dit --rm --name mariadb --network docker-network mariadb
	docker exec -it mariadb bash

rmmrd:
	docker stop mariadbd
	docker rm -f mariadbd

rmmr:
	docker stop mariadb
	docker rm -f mariadb

rmwp:
	docker stop wordpress
	docker rm -f wordpress

irmmrd:
	docker image rm mariadbd

irmmr:
	docker image rm mariadb

irmwp:
	docker image rm wordpress

irmall:
	docker image rm $$(docker image ls -q)

.PHONY: all up clean fclean re list bmrd bmr bwp rwp rmrd rmr rmmrd rmmr rmwp irmmrd irmmr irmwp bnx irmall