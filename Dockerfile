# Use PHP 8.2 FPM base image for Laravel
FROM php:8.3-fpm

# Install system dependencies for Nginx, Supervisor, and Cron
RUN apt-get update && apt-get install -y \
    build-essential \
    nginx \
    supervisor \
    cron \
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

# Install PHP extensions needed for Laravel and PostgreSQL
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-install zip && docker-php-ext-enable zip
RUN docker-php-ext-install gd && docker-php-ext-enable gd
RUN docker-php-ext-configure intl && docker-php-ext-install intl && docker-php-ext-enable intl
RUN docker-php-ext-install soap && docker-php-ext-enable soap
# Enable the exif extension
RUN docker-php-ext-enable opcache

RUN docker-php-ext-install exif
RUN docker-php-ext-configure exif
RUN docker-php-ext-enable exif

# Add custom opcache configuration
COPY ./docker/opcache.ini /usr/local/etc/php/conf.d/

# Set working directory
WORKDIR /var/www/html

# Copy the Laravel app source code into the container
COPY ./moodle /var/www/html

COPY ./moodledata /var/www/moodledata

# Set permissions for Laravel
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/moodledata

# Copy Nginx configuration
COPY ./docker/nginx.conf /etc/nginx/nginx.conf

# Copy Supervisor configuration
COPY ./docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy the entrypoint script
COPY ./docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose HTTP port
EXPOSE 80

# Run the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
