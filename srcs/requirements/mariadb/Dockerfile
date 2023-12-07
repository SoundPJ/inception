# Using the penultimate stable version of Debian
FROM debian:11

# COPY test.sh /docker-entrypoint-initdb.d/
COPY test.sh .

RUN apt-get update && apt-get upgrade

RUN apt-get install -y mariadb-server

RUN service mariadb restart

# RUN mysql_secure_installation

COPY 50-server.cnf etc/mysql/mariadb.conf.d/

# EXPOSE 3306

# RUN chmod +x /docker-entrypoint-initdb.d/test.sh
RUN chmod +x ./test.sh

RUN bash ./test.sh

CMD ["mysqld"]

# CMD ["sleep", "infinity"]