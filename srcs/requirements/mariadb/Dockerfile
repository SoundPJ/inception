# Using the penultimate stable version of Debian
FROM debian:bullseye

# Reference the argument from the docker compose file
ARG MYSQL_ROOT_USER
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ADMIN
ARG MYSQL_ADMIN_PASSWORD
ARG DB_NAME

# Install
RUN apt-get update && apt-get upgrade
RUN apt-get install -y mariadb-server

# Copy mariadb config file to the container
COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/

# Copy mariadb config file to the container
COPY ./tools/mariadb_script.sh .
RUN chmod +x ./mariadb_script.sh
RUN bash ./mariadb_script.sh
RUN rm ./mariadb_script.sh

# Export port 3306 to communicate with wordpress
EXPOSE 3306

CMD ["mysqld"]
