FROM        debian:buster

RUN         ["apt-get", "-y", "update"]
RUN         ["apt-get", "-y", "upgrade"]
RUN         ["apt-get", "-y", "install", "mariadb-server", "mariadb-client"]

COPY        ./tools/mariadb_setup.sh /tmp/mariadb_setup.sh
COPY        ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT  ["sh", "/tmp/mariadb_setup.sh"]
