FROM php:fpm-alpine3.20

# Install dependencies
RUN apk add --no-cache bash git zip unzip curl nodejs npm

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Install Laravel and Inertia
RUN composer create-project --prefer-dist laravel/laravel . \
    && composer require inertiajs/inertia-laravel \
    && php artisan inertia:middleware \
    && npm install && npm run build
