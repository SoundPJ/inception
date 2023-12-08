# Using the penultimate stable version of Debian
FROM debian:bullseye

RUN apt-get update && apt-get upgrade

RUN apt-get install -y mariadb-server

# RUN mkdir /home/pjerddee/data

COPY test.sh .

COPY 50-server.cnf etc/mysql/mariadb.conf.d/

EXPOSE 3306

RUN chmod +x ./test.sh

RUN bash ./test.sh

CMD ["mysqld"]