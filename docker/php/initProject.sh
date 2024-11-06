#!/bin/bash

# Nom du conteneur Docker et chemin du dossier cible
CONTAINER_NAME="php"  # Remplacez par le nom de votre conteneur
TARGET_DIR="/var/www"  # Chemin où vous voulez que le projet soit installé dans le conteneur

# Étape 1 : Créer le projet Symfony dans le conteneur
docker exec "$CONTAINER_NAME" sh -c "cd $TARGET_DIR && composer create-project symfony/skeleton skeleton --no-interaction"

# Étape 2 : Déplacer tout le contenu de `skeleton`, y compris les fichiers cachés, vers le dossier parent
docker exec "$CONTAINER_NAME" sh -c "cd $TARGET_DIR/skeleton && cp -a . .. && cd .. && rm -rf skeleton"

# Afficher un message de confirmation
echo "Le projet Symfony a été créé et son contenu a été déplacé dans $TARGET_DIR"