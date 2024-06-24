#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

echo "LARAVEL ENTRYPONT EXECUTING"
# until mysqladmin ping -h "$DB_HOST" -u "$DB_USERNAME" -p "$DB_PASSWORD" &> /dev/null; do
#     echo "Waiting for MySQL to be ready..."
    # sleep 15
# done
# # Run any Laravel commands if necessary
php artisan key:generate
php artisan migrate --force
php artisan db:seed --force
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "LARAVEL ENTRYPONT migrations ran"
# Start PHP-FPM
exec php-fpm -F
    sleep 5
exec php-fpm
