#!/bin/bash

# Build Laravel (composer, migrate, permissions)
# composer install --no-interaction --optimize-autoloader
# php artisan migrate --force
# chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
# chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Start Supervisor to run Nginx, PHP-FPM, and Cron
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf