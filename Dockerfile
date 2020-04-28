FROM ubuntu:18.04
LABEL maintainer="Joel Luth (joel.luth@gmail.com)"
LABEL description="mysqlsh environment"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		gnupg \
		lsb-release \
		wget \
	&& wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb \
	&& yes 4 | dpkg -i mysql-apt-config_0.8.15-1_all.deb \
	&& rm -f mysql-apt-config_0.8.15-1_all.deb \
	&& apt-get clean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*
