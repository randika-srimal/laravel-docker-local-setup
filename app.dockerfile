FROM php:8.0-fpm-alpine

ARG UID

WORKDIR /var/www/html

RUN apk add --update npm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions start

RUN docker-php-ext-install pdo_mysql

# Install PHP extensions end

RUN addgroup -g ${UID} developer && adduser -G developer -g developer -s /bin/sh -D developer
 
USER developer
