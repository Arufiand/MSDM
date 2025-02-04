# Use the PHP FPM image
FROM php:fpm-alpine3.20

# Install dependencies
RUN apk add --no-cache bash curl libzip-dev zip unzip nodejs npm

# Install PHP extensions required for Laravel
RUN docker-php-ext-install pdo pdo_mysql zip

# Install Composer (latest LTS version)
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer \
    --2

# Set the working directory
WORKDIR /var/www/html

# Copy entrypoint script
COPY Dockerfiles/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Default command
CMD ["/entrypoint.sh"]