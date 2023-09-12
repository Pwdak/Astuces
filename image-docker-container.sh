#!/bin/bash

# Récupérer le nom du conteneur en cours d'exécution
container_name=$(docker ps --format "{{.Names}}" --filter "status=running" | head -n 1)

# Vérifier si un conteneur est en cours d'exécution
if [ -z "$container_name" ]; then
    echo "Aucun conteneur en cours d'exécution n'a été trouvé."
    exit 1
fi

# Nom de base de l'image
image_name="nom-de-l-image"

# Trouver la version actuelle
current_version=$(docker images "${image_name}" --format "{{.Tag}}" | grep -oE 'v[0-9]+' | sort -r | head -n 1)

# Générer la nouvelle version
if [ -z "$current_version" ]; then
    new_version="v1"
else
    current_version_number=${current_version#v}
    new_version_number=$((current_version_number + 1))
    new_version="v${new_version_number}"
fi

# Générer un nom d'image complet avec la nouvelle version
new_image_name="${image_name}:${new_version}"

# Étape 1 : Arrêter le conteneur en cours d'exécution
docker stop "$container_name"

# Étape 2 : Créer une nouvelle image à partir du conteneur modifié
docker commit "$container_name" "$new_image_name"

# Étape 3 : Vérifier la création de la nouvelle image
docker images

# Étape 4 (facultatif) : Supprimer le conteneur de la version 1
# docker rm "$container_name"

# Étape 5 (facultatif) : Supprimer l'image précédente (si nécessaire)
# docker rmi "${image_name}:${current_version}"
