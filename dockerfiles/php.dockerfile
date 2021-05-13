FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

RUN docker-php-ext-install pdo_mysql

RUN apk add --update npm

RUN apk add --update composer

RUN addgroup -g 1000 developer && adduser -G developer -g developer -s /bin/sh -D developer
 
USER developer
