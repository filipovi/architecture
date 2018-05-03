FROM php:7.1-fpm

RUN apt-get update && \
    apt-get install -y curl vim wget git-core libmcrypt-dev libssl-dev zlib1g-dev libicu-dev g++ make cmake libgmp-dev uuid-dev && \
    apt-get autoclean -y && \
    apt-get clean -y

RUN docker-php-ext-install \
        bcmath \
        intl \
        mbstring \
        pcntl \
        shmop \
        zip

# Install composer
RUN curl -k -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN pecl install channel://pecl.php.net/redis-3.1.6 && docker-php-ext-enable redis

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /root/.ssh \
    && ssh-keyscan github.com >> /root/.ssh/known_hosts \
    && chmod 700 /root/.ssh \
    && chmod 600 /root/.ssh/known_hosts

COPY config/cli/php.ini /usr/local/etc/php/php.ini
COPY config/conf.d/global.ini /usr/local/etc/php/conf.d/global.ini
COPY config/conf.d/intl.ini /usr/local/etc/php/conf.d/intl.ini
COPY config/conf.d/modules.ini /usr/local/etc/php/conf.d/modules.ini
COPY config/conf.d/redis.ini /usr/local/etc/php/conf.d/redis.ini
COPY config/conf.d/cassandra.ini /usr/local/etc/php/conf.d/cassandra.ini

# Workaround for write permission on write to MacOS X volumes
# See https://github.com/boot2docker/boot2docker/pull/534
RUN usermod -u 1000 www-data

WORKDIR /srv/notification
ENV GIT_DIR=/srv/notification

EXPOSE 9000

COPY ./entrypoint.sh /entrypoint.sh
COPY ./bin/consumers.sh /bin/consumers.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm", "-F"]
