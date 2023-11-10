############# PUSH DOCKER IMAGES TO A DOCKERHUB ~##############################
1. **Login to Docker Hub**: 
   docker login
   
3. **Tag your Docker Image**: 
    docker tag your-image-name:your-tag your-username/your-repo-name:your-tag
   
5. **Push the Image to Docker Hub**:
   docker push your-username/your-repo-name:your-tag
   
7. **Verify the Upload**: After the upload is complete, you can verify that your image is available on Docker Hub by visiting 
your Docker Hub repository URL in a web browser or by searching for it on the Docker Hub website.

############## CHANGE THE NAME OF MY DOCKER IMAGE ############################
1. **Renommer l'image locale** :
   docker tag ancien-nom:tag nouveau-nom:tag

2. **Supprimer l'ancienne image (facultatif)** 
   docker rmi ancien-nom:tag

3. **Vérifier le renommage** : 
   docker images

############## CREATE A IMAGE FROM A CONTAINER DOCKER #######################
1. **Arrêtez le conteneur en cours d'exécution** : 
   docker stop nom-du-conteneur
   
2. **Créez une nouvelle image à partir du conteneur modifié** :
   docker commit nom-du-conteneur nom-de-l-image:v2
  
3. **Vérifiez la création de la nouvelle image** : 
   docker images

4. **Facultatif : Supprimez le conteneur de la version 1** : 
   docker rm nom-du-conteneur

5. **Facultatif : Supprimez l'image v1 (si nécessaire)** : 
   docker rmi nom-de-l-image:v1
# Astuces
############ INSTALL YARN ON CENTOS ##########################################
Pour installer Yarn sur CentOS, vous pouvez suivre ces étapes :

1. **Ajouter le référentiel Yarn :**
   Ajoutez le référentiel Yarn à votre liste de sources de packages.

   vi /etc/yum.repos.d/yarn.repo
   [yarn]
   name=Yarn Repository
   baseurl=https://dl.yarnpkg.com/rpm/
   gpgcheck=1
   gpgkey=https://dl.yarnpkg.com/rpm/pubkey.gpg
   enabled=1

3. **Installer Yarn :**
   Après avoir ajouté le référentiel, vous pouvez installer Yarn en utilisant le gestionnaire de paquets `yum`. Exécutez les commandes suivantes en tant qu'administrateur :
   sudo yum install yarn

   Cette commande installera Yarn ainsi que ses dépendances.

4. **Vérifier l'installation :**
   Après l'installation, vous pouvez vérifier si Yarn a été installé correctement en exécutant la commande suivante :
   yarn --version
   
   Cela devrait afficher la version de Yarn installée sur votre système.
