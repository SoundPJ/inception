bmrd:
	docker build -t mariadbd srcs/requirements/mariadb/

bmr:
	docker build -t mariadbd srcs/requirements/mariadb-client/

list:
	docker ps -a
	docker image ls
	docker network ls

rund:
	docker run -dit --rm --name mariadbd --network inception -p 3306 mariadbd
	docker exec -it mariadbd bash

run:
	docker run -dit --rm --name mariadb --network inception -p 3306 mariadb
	docker exec -it mariadb bash

rmd:
	docker stop mariadbd

irmd:
	docker image rm mariadbd

.PHONY: bmrd bmr list rund rmd irmd run