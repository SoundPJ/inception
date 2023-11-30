# Using the penultimate stable version of Debian
FROM Debian:11

RUN apt-get update \
	&& apt-get install -y mariadb-server mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql