FROM wordpress:6.6.2-php8.1-apache

ENV WP_CLI_ALLOW_ROOT=true

# Install packages under Debian
RUN apt-get update && apt-get install -y \
    libmariadb-dev-compat \
    libmariadb-dev \
    libzip-dev \
    zlib1g-dev \
    git \
    vim \
    rsync \
    zsh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql

RUN cd /tmp && \
    git clone https://github.com/bradt/xdebug-log-filter.git && \
    cd xdebug-log-filter && \
    mv xdebug-log-filter /var/www/html/wp-content && \
    rm -rf /tmp/xdebug-log-filter

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini && \
        sed -i -e "s/^ *memory_limit.*/memory_limit = 4G/g" /usr/local/etc/php/php.ini

RUN cd /tmp && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
        chsh -s /bin/zsh root

COPY --chown=www-data:www-data files-to-copy/var/www/html/wp-content/plugins /var/www/html/wp-content/plugins/
COPY --chown=www-data:www-data files-to-copy/var/www/html/wp-content/uploads /var/www/html/wp-content/uploads/

# Run the WP-CLI command after the container starts
#CMD ["wp", "language", "plugin", "install", "--all", "es_ES"]
