# Using the penultimate stable version of Debian
FROM debian:bullseye

# COPY test .
RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y mariadb-client

# RUN apt-get install -y service
# RUN service mariadb restart
	# && mysql_secure_installation

# 	&& rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /var/lib/mysql

# EXPOSE 3306

# RUN chmod +x test

# RUN ./test

CMD ["sleep", "infinity"]
