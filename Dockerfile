FROM java:8-jre
MAINTAINER Joost de Vries

RUN apt-get update && \
apt-get install -y postgresql-client-9.4 && \
rm -rf /var/lib/apt/lists/*

COPY wait-for-postgres.sh /wait-for-postgres.sh
RUN ["chmod", "+x", "/wait-for-postgres.sh"]

