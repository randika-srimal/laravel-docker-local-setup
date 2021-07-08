FROM php:7.3.29-fpm-alpine3.13

ARG UID

WORKDIR /var/www/html

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/main/ nodejs=10.24.1-r0 npm 

RUN apk add composer

RUN composer self-update --1

# To fix a bug in npm old version - START

RUN mkdir -p /.npm

RUN chown -R ${UID}:${GID} /.npm

# To fix a bug in npm old version - END

# Install PHP extensions start

RUN docker-php-ext-install pdo_mysql

# Install PHP extensions end

RUN addgroup -g ${UID} developer && adduser -G developer -g developer -s /bin/sh -D developer
 
USER developer
