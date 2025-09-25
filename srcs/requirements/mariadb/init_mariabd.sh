#!/bin/bash

echo "Start mariaDB"
service mariadb start
sleep 5

mariadb -u root << EOF
CREATE DATABASE IF NOT EXISTS \`${NAME_DATABASE}\`;

CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASS}';


GRANT ALL PRIVILEGES ON \`${NAME_DATABASE}\`.* TO '${SQL_USER}'@'%';

FLUSH PRIVILEGES;
EOF
mariadb-admin -u root -p{$SQL_PASS} shutdown
mariadbd-safe

echo "Fine script"

