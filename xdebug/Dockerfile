FROM wordpress:5.7-php7.4-apache


# Install packages under Debian
RUN apt-get update && \
    apt-get -y install git

# Install XDebug from source as described here:
# https://xdebug.org/docs/install
# Available branches of XDebug could be seen here:
# https://github.com/xdebug/xdebug/branches
RUN cd /tmp && \
    git clone git://github.com/xdebug/xdebug.git && \
    cd xdebug && \
    git checkout xdebug_2_9 && \
    phpize && \
    ./configure --enable-xdebug && \
    make && \
    make install && \
    rm -rf /tmp/xdebug

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

RUN apt-get install -y vim

RUN apt-get install -y zsh && \
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
        chsh -s /bin/zsh root

COPY --chown=www-data:www-data files-to-copy/ /

# Since this Dockerfile extends the official Docker image `wordpress`
# and since `wordpress` in turn extends the offcicial Docker image `php`,
# the the helper script docker-php-ext-enable (defined for image `php`)
# works here and we can use it to enable xdebug:
# RUN docker-php-ext-enable xdebug
