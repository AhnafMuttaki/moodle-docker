FROM php:7.4-apache

ARG app_port


RUN sed -si 's/Listen 80/Listen '$app_port'/' /etc/apache2/ports.conf
RUN sed -si 's/VirtualHost .:80/VirtualHost *:'$app_port'/' /etc/apache2/sites-enabled/000-default.conf


RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libicu-dev \
    libxml2-dev

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-install zip && docker-php-ext-enable zip
RUN docker-php-ext-install gd && docker-php-ext-enable gd
RUN docker-php-ext-configure intl && docker-php-ext-install intl && docker-php-ext-enable intl
RUN docker-php-ext-install soap && docker-php-ext-enable soap


RUN cd /var/www
RUN mkdir /var/www/moodledata
# USER root
# RUN chown -R root /var/www/moodledata
RUN chown -R root /var/www/moodledata
RUN chmod 0777 /var/www/moodledata
# COPY ./moodle311 /var/www/html
WORKDIR /var/www/html
EXPOSE $app_port
# RUN php admin/cli/install.php

