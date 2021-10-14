# syntax = docker/dockerfile:1.2
FROM php:7.4-apache

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
#RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# php config changes can be added to this dir
COPY php-conf/ "$PHP_INI_DIR/conf.d/"

RUN mkdir -p /var/www/html/
COPY unpacked/ /var/www/html

RUN mkdir -p /app
WORKDIR /app
COPY run_container.sh /app
COPY first_run.sh /app

ENTRYPOINT ["./run_container.sh"]
