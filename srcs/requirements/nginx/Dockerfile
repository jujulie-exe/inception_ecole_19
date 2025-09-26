#install image IOS
FROM debian:trixie-slim

#expongo la porta
EXPOSE 443

#instal depandace
RUN apt update -y && \
	apt upgrade -y &&  \
	apt install nginx -y && \
	apt install openssl -y

#clean Docker afeter install all depandace
RUN apt clean && rm -rf /var/lib/apt/lists/*

#create all directory and li do i permessi
RUN mkdir -p certs && chmod 755 certs && \ 
	mkdir -p conf && chmod 755 conf

#copio la config
COPY default.conf /etc/nginx/conf.d/default.conf

#creao il mio certificato
RUN openssl req -x509 -nodes -days 1 \
  -newkey rsa:2048 \
  -keyout certs/selfsigned.key \
  -out certs/selfsigned.crt \
  -subj "/C=BE/ST=Belgium/L=Scuola/O=Progetto/OU=Dev/CN=..../UID=..."

ENTRYPOINT ["nginx", "-g", "deamon off;"]
