FROM    debian:buster

RUN     ["apt-get", "-y", "update"]
RUN     ["apt-get", "-y", "upgrade"]
RUN     ["apt-get", "-y", "install", "nginx", "openssl"]

RUN     ["mkdir", "/etc/nginx/ssl"]

RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
		-subj "/C=KR/ST=Incheon/L=Bupyeong-gu/OU=42Seoul/CN=localhost" \
		-out /etc/nginx/ssl/dongmlee.42.fr.crt \
		-keyout /etc/nginx/ssl/dongmlee.42.fr.key

COPY    ./conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE  443

CMD     ["nginx", "-g", "daemon off;"]