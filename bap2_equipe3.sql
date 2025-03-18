-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 18, 2025 at 07:56 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.14
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
--
-- Database: `bap2_equipe3`
--
-- --------------------------------------------------------
--
-- Table structure for table `connexion`
--
CREATE TABLE `connexion` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `connexion`
--
INSERT INTO `connexion` (`id`, `email`, `mdp`)
VALUES (1, 'aaa', 'aaa'),
  (2, 'aa', 'aa'),
  (3, 'aa', 'aa'),
  (4, 'admin', 'admin'),
  (5, 'aaaa', 'aaaa'),
  (6, 'sophielamsova29@gmail.com', 'Fuckyou!:3');
-- --------------------------------------------------------
--
-- Table structure for table `donnees_journee`
--
CREATE TABLE `donnees_journee` (
  `id` int NOT NULL,
  `date_jour` date NOT NULL,
  `poids_dechets` int NOT NULL,
  `poids_pain` int NOT NULL,
  `nb_repas_prevues` int NOT NULL,
  `nb_repas_adultes` int NOT NULL,
  `nb_repas_non_consommes` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `menu`
--
CREATE TABLE `menu` (
  `id` int NOT NULL,
  `entree` varchar(255) DEFAULT NULL,
  `plat` varchar(255) DEFAULT NULL,
  `dessert` varchar(255) DEFAULT NULL,
  `nom_menu` varchar(255) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Dumping data for table `menu`
--
INSERT INTO `menu` (`id`, `entree`, `plat`, `dessert`, `nom_menu`)
VALUES (
    3,
    'Macédoine',
    'Nuggets Frites',
    'Tarte au chocolat',
    'Menu du 17/03'
  ),
  (
    4,
    'Macédoine',
    'Nuggets Frites',
    'Tarte au chocolat',
    'Menu du 17/03'
  ),
  (
    5,
    'Macédoine',
    'Nuggets Frites',
    'Tarte au chocolat',
    'Menu du 17/03'
  );
--
-- Indexes for dumped tables
--
--
-- Indexes for table `connexion`
--
ALTER TABLE `connexion`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `donnees_journee`
--
ALTER TABLE `donnees_journee`
ADD PRIMARY KEY (`id`);
--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `connexion`
--
ALTER TABLE `connexion`
MODIFY `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;
-- Add `is_admin` column to `connexion` table
ALTER TABLE `connexion`
ADD `is_admin` TINYINT(1) NOT NULL DEFAULT 0;
-- Update existing data to set `is_admin` for admin users
UPDATE `connexion`
SET `is_admin` = 1
WHERE `email` = 'admin';
--
-- AUTO_INCREMENT for table `donnees_journee`
--
ALTER TABLE `donnees_journee`
MODIFY `id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;