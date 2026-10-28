FROM php:8.3-apache

ARG DEBIAN_FRONTEND=noninteractive

LABEL org.opencontainers.image.title="Custom PHP Apache"
LABEL org.opencontainers.image.description="PHP 8.3 Apache with MySQL, GD, Imagick, Node.js, Composer, FFmpeg, OCR and document utilities"
LABEL org.opencontainers.image.source="https://github.com/mrasmith/php-apache-custom"

# System utilities, image libraries and PHP build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends 
    autoconf 
    dpkg-dev 
    file 
    g++ 
    gcc 
    libc-dev 
    make 
    pkg-config 
    re2c 
    ca-certificates 
    curl 
    gnupg 
    wget 
    git 
    unzip 
    zip 
    brotli 
    libbrotli-dev 
    libfreetype-dev 
    libjpeg62-turbo-dev 
    libpng-dev 
    libzip-dev 
    libmagickwand-dev 
    libexif-dev 
    ffmpeg 
    poppler-utils 
    tesseract-ocr 
    pandoc 
    imagemagick 
    && rm -rf /var/lib/apt/lists/*

# PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg 
    && docker-php-ext-install -j"$(nproc)" 
        mysqli 
        pdo_mysql 
        gd 
        exif 
        calendar 
        zip

# Imagick PHP extension
RUN pecl install imagick 
    && docker-php-ext-enable imagick

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Node.js 24
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key 
    | gpg --dearmor -o /usr/share/keyrings/nodesource.gpg 
    && echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_24.x nodistro main" 
        > /etc/apt/sources.list.d/nodesource.list 
    && apt-get update 
    && apt-get install -y --no-install-recommends nodejs 
    && rm -rf /var/lib/apt/lists/*

# Useful Apache modules
RUN a2enmod rewrite headers expires

WORKDIR /var/www/html
