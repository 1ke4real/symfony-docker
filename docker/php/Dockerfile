FROM php:8.2-fpm
LABEL maintainer="Mike Leman"
# Met à jour les paquets et installe les dépendances nécessaires pour GD
RUN apt-get update && apt-get upgrade
# Installe les dépendances nécessaires pour Composer et Symfony
RUN apt-get update && apt-get install -y \
    zip unzip git libzip-dev \
    && docker-php-ext-install zip

# Install Composer \
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Exécute la commande de création de projet uniquement si le répertoire est vide
RUN echo "Current directory:" && pwd && echo "Contents:" && ls -la


CMD ["php-fpm"]
EXPOSE 9000
