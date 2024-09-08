services:
  mailhog:
    image: jcalonso/mailhog:latest
    restart: always
    ports:
      - "1025:1025"
      - "51203:8025" # Change to unique port
  wordpress:
    container_name: ${COMPOSE_PROJECT_NAME:-wordpress}
    build:
      dockerfile: Dockerfile # this line is actually redundant here - you need it only if you want to use some custom name for your Dockerfile
#      context: ./xdebug # a path to a directory containing a Dockerfile, or a url to a git repository
    volumes:
      - ./config/php.conf.ini:/usr/local/etc/php/php.ini
      # Docker WordPress files will be placed at the root.
#      - ../:/var/www/html
      - ../wp-content/mu-plugins:/var/www/html/wp-content/mu-plugins:cached
      - ../wp-content/themes/breakdance-zero-theme:/var/www/html/wp-content/themes/breakdance-zero-theme:cached
      - ../wp-config.php:/var/www/html/wp-config.php
      - ../.htaccess:/var/www/html/.htaccess:cached
    environment:
      XDEBUG_CONFIG: "remote_host=host.docker.internal" #This config works for MacOS, otherwise should be ip address of the host machine because docker container cannot find the host by localhost.
      WORDPRESS_DB_HOST: ${WORDPRESS_DB_HOST:-mysql}
      WORDPRESS_DB_USER: ${DATABASE_USER:-root}
      WORDPRESS_DB_PASSWORD: ${DATABASE_PASSWORD:-password}
      WORDPRESS_DB_NAME: ${COMPOSE_PROJECT_NAME:-wordpress}
      WORDPRESS_TABLE_PREFIX: ${WORDPRESS_TABLE_PREFIX}
      # - XDEBUG_CONFIG=remote_host=192.168.1.2
    depends_on:
      - mysql
    restart: always
    ports:
      - "80:80"

  mysql:
    image: mariadb:${MARIADB_VERSION:-latest}
    container_name: ${COMPOSE_PROJECT_NAME}_mysql
    volumes:
      - ./mysql:/var/lib/mysql
    environment:
      MYSQL_ROOT_USER: ${DATABASE_USER:-root}
      MYSQL_ROOT_PASSWORD: ${DATABASE_PASSWORD:-password}
      MYSQL_PASSWORD: ${DATABASE_PASSWORD:-password}
      MYSQL_DATABASE: ${COMPOSE_PROJECT_NAME}
    restart: always
    ports:
      - "3306:3306"

  phpmyadmin:
    image: phpmyadmin:latest
    container_name: ${COMPOSE_PROJECT_NAME}_phpmyadmin
    environment:
      PMA_HOST: mysql
      PMA_PASSWORD: ${DATABASE_PASSWORD:-password}
    restart: unless-stopped
    ports:
      - "8080:80"
