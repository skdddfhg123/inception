FROM    debian:buster

RUN     ["apt-get", "-y", "update"]
RUN     ["apt-get", "-y", "upgrade"]
RUN     ["apt-get", "-y", "install", "wget", "curl", "tar", "php7.3", "php7.3-fpm", "php-mysql", "mariadb-client", "php-cli", "sudo"]

COPY    ./tools/wordpress_setup.sh /tmp/wordpress_setup.sh
COPY    ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN     ["wget", "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"]
RUN     ["chmod", "+x", "wp-cli.phar"]
RUN     ["mv", "wp-cli.phar", "/usr/bin/wp"]

WORKDIR /var/www/html/wordpress
RUN     ["mkdir", "-p", "/run/php"]

CMD     ["sh", "/tmp/wordpress_setup.sh"]