
#install image IOS
FROM debian:trixie-slim

#expongo la porta
EXPOSE 9000
EXPOSE 3306
#instal depandace
RUN apt update -y && \
	apt install wordpress mariadb-client -y && \
	apt upgrade -y &&  \
	apt install php8.4 php8.4-fpm php8.4-mysql -y &&\
	apt install php-cli php-mbstring unzip curl -y
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar ; mv wp-cli.phar /usr/local/bin/wp



#clean Docker afeter install all depandace
RUN apt clean && rm -rf /var/lib/apt/lists/*
#clean add config for worpress
COPY config_wordpress.sh .
RUN chmod 777 config_wordpress.sh 
#RUN chmod 777 usr/share/wordpress
ENTRYPOINT ["/bin/bash", "./config_wordpress.sh"]


	
