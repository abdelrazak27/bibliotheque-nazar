-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 30 août 2023 à 11:27
-- Version du serveur : 5.7.40
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nazar_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'Aventure'),
(2, 'Thriller'),
(3, 'Horreur'),
(4, 'Roman'),
(5, 'Philosophie');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230828205007', '2023-08-28 20:50:51', 36),
('DoctrineMigrations\\Version20230828210424', '2023-08-28 21:04:30', 33),
('DoctrineMigrations\\Version20230828221003', '2023-08-28 22:10:09', 69),
('DoctrineMigrations\\Version20230828224632', '2023-08-28 22:46:35', 117),
('DoctrineMigrations\\Version20230829093707', '2023-08-29 09:37:12', 93);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auteur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_edition` date NOT NULL,
  `date_ajout` date NOT NULL,
  `date_modification` date DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id`, `titre`, `auteur`, `date_edition`, `date_ajout`, `date_modification`, `image_path`, `categorie_id`) VALUES
(19, 'L\'Appel de la forêt', 'Jack London', '1903-07-01', '2023-08-30', NULL, '64eefdbf93de0.webp', 1),
(20, 'Les Aventures de Tintin: Le Lotus Bleu', 'Hergé', '1936-08-09', '2023-08-30', NULL, '64eefe02a66ae.webp', 1),
(21, 'La Route', 'Cormac McCarthy', '2006-03-26', '2023-08-30', NULL, '64eefe489c087.webp', 4),
(22, 'Ainsi parlait Zarathoustra', 'Friedrich Nietzsche', '1885-10-18', '2023-08-30', NULL, '64eefeaa9d347.webp', 5),
(23, 'Être et Temps', 'Martin Heidegger', '1927-04-08', '2023-08-30', NULL, '64eefef59e40f.webp', 5),
(24, 'Ça', 'Stephen King', '1986-09-15', '2023-08-30', '2023-08-30', '64eeff5d85fe7.webp', 3),
(25, 'Cent ans de solitude', 'Gabriel Garcia Marquez', '1967-05-30', '2023-08-30', NULL, '64eeffc004eb0.webp', 4),
(26, 'La Fille du train', 'Paula Hawkins', '2015-01-13', '2023-08-30', NULL, '64ef004be5b01.webp', 2),
(27, 'Dracula', 'Bram Stoker', '1897-05-26', '2023-08-30', NULL, '64ef009ee09fa.webp', 3),
(28, 'Da Vinci Code', 'Dan Brown', '2003-03-18', '2023-08-30', NULL, '64ef00cf31878.webp', 2),
(29, 'L\'Île mystérieuse', 'Jules Verne', '1875-06-01', '2023-08-30', NULL, '64ef00fc3abe3.webp', 1);

-- --------------------------------------------------------

--
-- Structure de la table `test_entity`
--

DROP TABLE IF EXISTS `test_entity`;
CREATE TABLE IF NOT EXISTS `test_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_field` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'ammara.abdelrazak@gmail.com', '[]', '$2y$13$oGLy4YQPTOHMdrCLraRfROCEJlHAXzDXyAt3eDmYkuCcoZam9Jp02'),
(2, 'ammara.abdelrazak2@gmail.com', '[]', '$2y$13$EKnewxwcIcjW8gjM5xe/lOpmjvaLdhlEsut7twyi5eZn6.mgmOR5.'),
(3, 'ammara.abdelrazakqsfdsq@gmail.com', '[]', '$2y$13$BYQvLAoGEpH4I8waLq0uEuvKZZDewZhhZ5X29ZyscT6cx7R4OKkf6');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
