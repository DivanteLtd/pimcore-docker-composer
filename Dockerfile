FROM composer

MAINTAINER Mateusz Koszutowski <mkoszutowski@divante.pl>

RUN apk update \
    && apk upgrade

RUN apk --update add \
        freetype \
        libpng \
        libjpeg-turbo \
        freetype-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        libxml2-dev \
        bzip2-dev \
        icu-dev \
    && docker-php-ext-install \
        pdo_mysql \
        iconv \
        dom \
        simplexml \
        exif \
        fileinfo \
        mbstring \
        zip \
        bz2 \
        intl \
        opcache \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd
