#!/bin/sh

# Exit if any command fails
set -e

# Check if Laravel project exists
if [ ! -f "artisan" ]; then
    echo "Laravel project not found. Creating a new Laravel project..."
    composer create-project --prefer-dist laravel/laravel .
    composer require inertiajs/inertia-laravel
    npm install
    php artisan inertia:middleware
    composer install
    php artisan migrate --force
fi

echo "Laravel project found, starting"

# Start Laravel in the background
php artisan serve --host=0.0.0.0 --port=8000

#echo "Running npm run dev"
#
## Start Vite and keep the container running
#npm run dev
