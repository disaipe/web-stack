ARG VERSION=7.3.2
FROM php:${VERSION}-fpm

RUN apt-get update && apt-get install -y \
        libzip-dev zip \
		libwebp-dev libjpeg62-turbo-dev libpng-dev \
		libfreetype6-dev \
	&& docker-php-ext-configure zip --with-libzip \
	&& docker-php-ext-install zip \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-configure gd \
		--with-gd \
		--with-webp-dir \
		--with-jpeg-dir \
    	--with-png-dir \
		--with-zlib-dir \
		--with-freetype-dir \
    	--enable-gd-native-ttf \
	&& docker-php-ext-install gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

EXPOSE 9000

WORKDIR /var/www/html