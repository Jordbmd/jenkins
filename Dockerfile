# Utiliser l'image officielle Jenkins LTS
FROM jenkins/jenkins:lts

# Passer en utilisateur root pour installer les outils système
USER root

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    gnupg \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    software-properties-common \
    wget

# Créer le groupe docker puis ajouter l'utilisateur jenkins à ce groupe
RUN groupadd docker && \
    usermod -aG docker jenkins && \
    echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# Mettre à jour les paquets et installer Maven, Git, Docker client et les dépendances
RUN apt-get update && \
    apt-get install -y maven git docker.io curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Installation de Trivy (scan de vulnérabilités pour image Docker)
RUN curl -sSfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin

# (Optionnel) Pour permettre d'utiliser Docker depuis Jenkins,
# vous pouvez envisager de monter le socket Docker lors du lancement du conteneur.
#
# Par exemple, lors du démarrage : -v /var/run/docker.sock:/var/run/docker.sock

# Revenir à l'utilisateur Jenkins
USER jenkins