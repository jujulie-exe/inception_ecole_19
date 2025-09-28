
#!/bin/bash
sleep 30
echo "Start init wordpress"

cat > /etc/wordpress/config-default.php << EOF
<?php
// Dati database
define('DB_NAME','${NAME_DATABASE}');                // nome del database
define('DB_USER','${SQL_USER}');                  // utente MariaDB
define('DB_PASSWORD', '${SQL_PASS}');        // password MariaDB
define('DB_HOST', 'mariadb');                  // hostname o container name DB

// URL del sito
define('WP_HOME', 'https://localhost:8080');
define('WP_SITEURL', 'https://localhost:8080');

// Impostazioni extra consigliate
define('FS_METHOD', 'direct');
define('WP_DEBUG', false);
EOF
#sed -i 's/^;listen = .*/listen = 0.0.0.0:9000/' /etc/php/8.4/fpm/pool.d/www.conf
#sed -i 's/^;clear_env = .*/clear_env = no/' /etc/php/8.4/fpm/pool.d/www.conf
cat >> /etc/php/8.4/fpm/pool.d/www.conf << EFO
listen = 0.0.0.0:9000
clear_env = no
EFO
cat /etc/wordpress/config-default.php 
env
wp core version  --path=/usr/share/wordpress --allow-root
wp core install --allow-root --path=/usr/share/wordpress --url="https://localhost:8080" --title="test" --admin_user="admin" --admin_password="password" --admin_email="email@example.com"
wp user create --allow-root bob bob@example.com --role=author --path=/usr/share/wordpress 
#service php8.4-fpm shutdown
#killall php8.4-fpm
sleep 1
echo "avvio php8.4"
#root@9743c0077094:/# killall /usr/sbin/php-fpm8.4
#root@9743c0077094:/# /usr/sbin/php-fpm8.4 -F
killall /usr/sbin/php-fpm8.4
/usr/sbin/php-fpm8.4 -F -R

#php8.4-fpm -F -R
