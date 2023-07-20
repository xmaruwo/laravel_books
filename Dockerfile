# ベースイメージを指定
FROM php:8.1-fpm

# 必要なツールやライブラリをインストール
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Composerのインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 作業ディレクトリを設定
WORKDIR /app

# ホストのプロジェクトをコンテナにコピー
COPY . /app

# Composerパッケージのインストール
RUN composer install

# コンテナを起動する際のコマンド
CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
