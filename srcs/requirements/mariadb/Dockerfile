#install image IOS
FROM debian:trixie-slim

EXPOSE 3306

#instal depandace
RUN apt update -y && \
	apt upgrade -y &&  \
	apt install mariadb-server -y

COPY init_mariabd.sh .

#clean Docker afeter install all depandace
RUN apt clean && rm -rf /var/lib/apt/lists/*
RUN service mariadb start
RUN chmod 777 init_mariabd.sh

ENTRYPOINT ["./init_mariabd.sh"]
