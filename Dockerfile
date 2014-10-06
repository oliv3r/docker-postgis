FROM postgres:9.3
MAINTAINER Mike Dillon <mike@embody.org>

ENV POSTGIS_MAJOR 2.1
ENV POSTGIS_VERSION 2.1.4+dfsg-1.pgdg70+2

RUN echo deb http://http.debian.net/debian wheezy-backports main >> /etc/apt/sources.list
RUN apt-get update \
      && apt-get install -y \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION \
      && rm -rf /var/lib/apt/lists/*

# Need to replace upstream entrypoint to allow postgis initialization
COPY ./docker-entrypoint.sh /