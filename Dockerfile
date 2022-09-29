FROM php:7.4-apache



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
RUN docker-php-ext-install zip && docker-php-ext-enable zip
RUN docker-php-ext-install gd && docker-php-ext-enable gd
RUN docker-php-ext-configure intl && docker-php-ext-install intl && docker-php-ext-enable intl
RUN docker-php-ext-install soap && docker-php-ext-enable soap

ARG app_port
ARG db_root_password
ENV APP_PORT $app_port
ENV DB_ROOT_PASSWORD $db_root_password


RUN cd /var/www
RUN mkdir /var/www/moodledata
# USER root
# RUN chown -R root /var/www/moodledata
RUN chown -R root /var/www/moodledata
RUN chmod 0777 /var/www/moodledata
# COPY ./moodle311 /var/www/html
WORKDIR /var/www/html
# RUN php admin/cli/install.php

