FROM php:8.1.0-apache

WORKDIR /var/www/html

RUN a2enmod rewrite

#libicu is mandatory for php intcl
RUN apt-get update -y && apt-get install -y libicu-dev unzip zip 

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#create php extension
RUN docker-php-ext-install gettext intl pdo_mysql




