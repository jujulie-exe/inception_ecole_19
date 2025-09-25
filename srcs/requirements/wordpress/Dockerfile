
#install image IOS
FROM debian:trixie-slim

#expongo la porta
EXPOSE 443

#instal depandace
RUN apt update -y && \
	apt upgrade -y &&  \
	apt install wget -y && \

#clean Docker afeter install all depandace
RUN apt clean && rm -rf /var/lib/apt/lists/*
