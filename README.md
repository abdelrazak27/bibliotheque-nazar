# NAZAR Library

NAZAR Library est une bibliothèque fictive qui regroupe des livres.

## Prérequis

- PHP (version recommandée : +8.0)
- Composer
- MySQL (version recommandée : +5.7)
- Symfony CLI (pour le serveur de développement)

## Installation

1. Cloner le dépôt :

```bash
git clone lien_du_repo.git
```

2. Installer les dépendances :

```bash
composer install
```

3. Configurer la base de données :
- Modifier les valeurs dans le fichier `.env` avec vos informations de connexion à la base de donnée.
	- `USERNAME` = Nom d'utilisateur phpMyAdmin
	- `PASSWORD` = Mot de passe phpMyAdmin
	- `DB_NAME` = Nom de la base de donnée ("nazar_db", si importé)

```bash
DATABASE_URL="mysql://USERNAME:PASSWORD@127.0.0.1:3306/DB_NAME?serverVersion=8.0.32&charset=utf8mb4"
```

4. Importer la base de donnée localement :
- Importer le fichier .sql nazar_db si vous l'avez en votre possession.

5. Créer la base de données (si pas possible d'importer) :
- Si la base de données n'existe pas déjà, vous pouvez la créer avec:
```bash 
php bin/console doctrine:database:create
```

6. Appliquer les migrations : 
- Pour créer ou mettre à jour les tables nécessaires :
```bash
php bin/console doctrine:migrations:migrate
```

7. Démarrer le serveur :
- Si vous avez Symfony CLI installé :
```bash
symfony server:start
```
- Sinon, utilisez le serveur intégré de PHP :
```bash
php -S 127.0.0.1:8000 -t public/
```

## Usage

Sur l'application il est web il est possible de voir la liste des livres en étant connecté ou non.
Il est donc possible de s'inscrire et de se connecter. Un utilisateur authentifié peut alors ajouter, modifier, supprimer un livre. Des boutons assez explicites sont présent pour vous guider dans l'administration des livres.