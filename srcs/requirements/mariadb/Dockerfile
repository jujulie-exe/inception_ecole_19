#install image IOS
FROM debian:trixie-slim

EXPOSE 3306

#instal depandace
RUN apt update -y && \
	apt upgrade -y &&  \
	apt install mariadb-server -y

#clean Docker afeter install all depandace
RUN apt clean && rm -rf /var/lib/apt/lists/*


