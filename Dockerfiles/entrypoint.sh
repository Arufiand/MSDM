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
    npm install @inertiajs/react @inertiajs/inertia @inertiajs/inertia-react
    npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p
fi
#php artisan migrate --force
echo "Laravel project found, starting"
npm install @inertiajs/progress react react-dom

# Start Laravel in the background
php artisan serve --host=0.0.0.0 --port=1305 &

echo "Running npm run dev"
#
## Start Vite and keep the container running
exec npm run dev -- --host 0.0.0.0 --port 5173