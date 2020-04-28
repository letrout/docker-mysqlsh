FROM ubuntu:18.04
LABEL maintainer="Joel Luth (joel.luth@gmail.com)"
LABEL description="mysqlsh environment"

ENV mysql_apt_repo mysql-apt-config_0.8.15-1_all.deb

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		gnupg \
		lsb-release \
		wget \
	&& wget https://dev.mysql.com/get/${mysql_apt_repo} \
	&& yes 4 | dpkg -i ${mysql_apt_repo} \
	&& rm -f ${mysql_apt_repo} \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		mysql-apt-config \
		mysql-shell \
	&& apt-get clean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*
