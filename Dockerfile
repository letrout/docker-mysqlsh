FROM ubuntu:18.04
LABEL maintainer="Joel Luth (joel.luth@gmail.com)"
LABEL description="mysqlsh environment"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		wget \
	&& apt-get clean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*
