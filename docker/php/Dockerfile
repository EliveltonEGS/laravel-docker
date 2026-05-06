FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    git curl zip unzip libpng-dev libonig-dev libxml2-dev libzip-dev libpq-dev libjpeg-dev libfreetype-dev nodejs npm \
    && docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd zip \
    && pecl install redis xdebug && docker-php-ext-enable redis xdebug \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

WORKDIR /var/www

RUN chown -R www-data:www-data /var/www && chmod -R 775 /var/www
