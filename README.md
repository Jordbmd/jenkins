# Projet DevSecOps Jenkins TP

Ce projet est un exemple de pipeline DevSecOps utilisant Jenkins, Maven, et divers outils de sécurité.

## Prérequis

- Docker installé sur votre machine
- Accès à Internet pour télécharger les images Docker et les dépendances Maven

## Lancer le Projet

1. **Construire l'image Docker Jenkins**

   Assurez-vous d'être dans le répertoire racine du projet où se trouve le `Dockerfile`, puis exécutez la commande suivante pour construire l'image Docker :

   ```bash
   docker build -t jenkins-tp .
   ```

2. **Démarrer le conteneur Jenkins**

   Une fois l'image construite, vous pouvez démarrer un conteneur Jenkins avec la commande suivante :

   ```bash
   docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-tp jenkins-tp
   ```

   **Note**: Si vous souhaitez que Jenkins puisse utiliser Docker, vous pouvez monter le socket Docker :

   ```bash
   docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-tp -v /var/run/docker.sock:/var/run/docker.sock jenkins-tp
   ```

3. **Accéder à l'interface Jenkins**

   Ouvrez votre navigateur web et accédez à l'URL suivante pour voir l'interface Jenkins :

   ```
   http://localhost:8080
   ```

4. **Déverrouiller Jenkins**

   Lors de votre première connexion, Jenkins vous demandera un mot de passe d'administrateur. Vous pouvez le trouver en exécutant la commande suivante pour afficher le mot de passe initial :

   ```bash
   docker exec jenkins-tp cat /var/jenkins_home/secrets/initialAdminPassword
   ```

5. **Configurer Jenkins**

   Suivez les instructions à l'écran pour terminer la configuration de Jenkins, installer les plugins recommandés, et créer votre premier utilisateur administrateur.

## Structure du Projet

- **pom.xml**: Fichier de configuration Maven contenant les dépendances et les plugins utilisés.
- **Dockerfile**: Fichier de configuration pour construire l'image Docker Jenkins.
- **.gitignore**: Fichier listant les fichiers et répertoires à ignorer par Git.

## Outils de Sécurité Intégrés

- **OWASP Dependency-Check**: Analyse les dépendances Maven pour détecter les vulnérabilités connues.
- **SpotBugs**: Analyse statique du code pour détecter les bugs potentiels.

## Remarques

- Assurez-vous que votre machine dispose des ressources nécessaires pour exécuter Docker et Jenkins.
- Pour des raisons de sécurité, il est recommandé de ne pas exposer Jenkins directement à Internet sans configuration de sécurité appropriée.
