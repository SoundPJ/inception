# Using the penultimate stable version of Debian
FROM debian:bullseye

ARG MYSQL_ROOT_USER
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ADMIN
ARG MYSQL_ADMIN_PASSWORD
ARG DB_NAME

RUN apt-get update && apt-get upgrade
RUN apt-get install -y mariadb-server

COPY 50-server.cnf etc/mysql/mariadb.conf.d/

COPY test.sh .
RUN chmod +x ./test.sh
RUN bash ./test.sh

EXPOSE 3306

CMD ["mysqld"]
