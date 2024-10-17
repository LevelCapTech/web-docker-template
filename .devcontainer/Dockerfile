# ベースイメージとして最新の PHP + Apache を使用
FROM php:8.2-apache

# OSのパッケージリストを更新
RUN apt-get update

# Apache の設定を調整
RUN a2enmod rewrite && \
    sed -i 's!/var/www/html!/app/public_html!g' /etc/apache2/sites-available/000-default.conf

# ロケールの設定 (ja_JP.UTF-8)
RUN apt-get update && apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# Composer のインストール (任意)
RUN apt-get install -y git unzip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Xdebug をインストール (デバッグ用)
RUN pecl install xdebug && docker-php-ext-enable xdebug

# PHP 拡張のインストール例（必要に応じて追加）
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 作業ディレクトリを /app に設定
WORKDIR /app

# ポート80を開放
EXPOSE 80

# サービス起動
CMD ["apache2-foreground"]