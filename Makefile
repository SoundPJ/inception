bmrd:
	docker build -t mariadbd srcs/requirements/mariadb/

bmr:
	docker build -t mariadb srcs/requirements/mariadb-client/

list:
	docker ps -a
	docker image ls
	docker network ls
	docker volume ls

# Don't forget to change volume mount path 
rund:
	docker run -dit --rm --name mariadbd --network docker-network -p 3306 -v ./mariadb_data:/var/lib/mysql mariadbd
	docker exec -it mariadbd bash

run:
	docker run -dit --rm --name mariadb --network docker-network -p 3306 mariadb
	docker exec -it mariadb bash

rmd:
	docker stop mariadbd

rm:
	docker stop mariadb

irmd:
	docker image rm mariadbd

irm:
	docker image rm mariadb

.PHONY: bmrd bmr list rund rmd irmd run rm irm