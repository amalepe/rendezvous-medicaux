-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 04 mars 2026 à 22:11
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_rdv`
--

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `creneaux`
--

CREATE TABLE `creneaux` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `medecin_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `creneaux`
--

INSERT INTO `creneaux` (`id`, `medecin_id`, `date`, `heure_debut`, `heure_fin`, `disponible`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-03-05', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(2, 1, '2026-03-05', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(3, 1, '2026-03-06', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(4, 1, '2026-03-06', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(5, 1, '2026-03-07', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(6, 1, '2026-03-07', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(7, 1, '2026-03-08', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(8, 1, '2026-03-08', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(9, 1, '2026-03-09', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(10, 1, '2026-03-09', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:43', '2026-03-04 03:28:43'),
(11, 2, '2026-03-05', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:44', '2026-03-04 03:28:44'),
(12, 2, '2026-03-05', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:44', '2026-03-04 03:28:44'),
(13, 2, '2026-03-06', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:44', '2026-03-04 03:28:44'),
(14, 2, '2026-03-06', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(15, 2, '2026-03-07', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(16, 2, '2026-03-07', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(17, 2, '2026-03-08', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(18, 2, '2026-03-08', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(19, 2, '2026-03-09', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(20, 2, '2026-03-09', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(21, 3, '2026-03-05', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(22, 3, '2026-03-05', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(23, 3, '2026-03-06', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(24, 3, '2026-03-06', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(25, 3, '2026-03-07', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(26, 3, '2026-03-07', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(27, 3, '2026-03-08', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(28, 3, '2026-03-08', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(29, 3, '2026-03-09', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(30, 3, '2026-03-09', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(31, 4, '2026-03-05', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(32, 4, '2026-03-05', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(33, 4, '2026-03-06', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(34, 4, '2026-03-06', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(35, 4, '2026-03-07', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(36, 4, '2026-03-07', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(37, 4, '2026-03-08', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:47', '2026-03-04 03:28:47'),
(38, 4, '2026-03-08', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:47', '2026-03-04 03:28:47'),
(39, 4, '2026-03-09', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:47', '2026-03-04 03:28:47'),
(40, 4, '2026-03-09', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:47', '2026-03-04 03:28:47'),
(41, 5, '2026-03-05', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:47', '2026-03-04 03:28:47'),
(42, 5, '2026-03-05', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:47', '2026-03-04 03:28:47'),
(43, 5, '2026-03-06', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:47', '2026-03-04 03:28:47'),
(44, 5, '2026-03-06', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:47', '2026-03-04 03:28:47'),
(45, 5, '2026-03-07', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:48', '2026-03-04 03:28:48'),
(46, 5, '2026-03-07', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:48', '2026-03-04 03:28:48'),
(47, 5, '2026-03-08', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:48', '2026-03-04 03:28:48'),
(48, 5, '2026-03-08', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:48', '2026-03-04 03:28:48'),
(49, 5, '2026-03-09', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:48', '2026-03-04 03:28:48'),
(50, 5, '2026-03-09', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:48', '2026-03-04 03:28:48'),
(51, 6, '2026-03-05', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:48', '2026-03-04 03:28:48'),
(52, 6, '2026-03-05', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:49', '2026-03-04 03:28:49'),
(53, 6, '2026-03-06', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:49', '2026-03-04 03:28:49'),
(54, 6, '2026-03-06', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:49', '2026-03-04 03:28:49'),
(55, 6, '2026-03-07', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:49', '2026-03-04 03:28:49'),
(56, 6, '2026-03-07', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:49', '2026-03-04 03:28:49'),
(57, 6, '2026-03-08', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:49', '2026-03-04 03:28:49'),
(58, 6, '2026-03-08', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:49', '2026-03-04 03:28:49'),
(59, 6, '2026-03-09', '09:00:00', '09:30:00', 1, '2026-03-04 03:28:49', '2026-03-04 03:28:49'),
(60, 6, '2026-03-09', '10:00:00', '10:30:00', 1, '2026-03-04 03:28:49', '2026-03-04 03:28:49');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medecins`
--

CREATE TABLE `medecins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `specialite` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medecins`
--

INSERT INTO `medecins` (`id`, `user_id`, `specialite`, `telephone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cardiologue', '0661456713', '2026-03-04 03:28:42', '2026-03-04 03:28:42'),
(2, 2, 'Dermatologue', '0661225913', '2026-03-04 03:28:44', '2026-03-04 03:28:44'),
(3, 3, 'Pédiatre', '0661931856', '2026-03-04 03:28:45', '2026-03-04 03:28:45'),
(4, 4, 'Endocrinologue', '0661225599', '2026-03-04 03:28:46', '2026-03-04 03:28:46'),
(5, 5, 'Génécologue', '0661334455', '2026-03-04 03:28:47', '2026-03-04 03:28:47'),
(6, 6, 'Généraliste', '0661002233', '2026-03-04 03:28:48', '2026-03-04 03:28:48');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_22_014700_create_personal_access_tokens_table', 1),
(5, '2026_02_22_094558_add_role_to_users_table', 1),
(6, '2026_02_22_095141_create_medecins_table', 1),
(7, '2026_02_22_095155_create_patients_table', 1),
(8, '2026_02_22_095205_create_creneaux_table', 1),
(9, '2026_02_22_095224_create_rendez_vous_table', 1),
(10, '2026_03_03_142151_drop_unique_on_creneau_id', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `telephone`, `created_at`, `updated_at`) VALUES
(1, 7, '0600000000', '2026-03-04 03:28:49', '2026-03-04 03:28:49'),
(2, 8, '0611111111', '2026-03-04 03:28:50', '2026-03-04 03:28:50'),
(3, 9, '0622222222', '2026-03-04 03:28:50', '2026-03-04 03:28:50'),
(4, 10, '0633333333', '2026-03-04 03:28:51', '2026-03-04 03:28:51');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `medecin_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `creneau_id` bigint(20) UNSIGNED NOT NULL,
  `statut` varchar(255) NOT NULL DEFAULT 'reserve',
  `doctor_status` varchar(255) NOT NULL DEFAULT 'en attente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'patient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Dr Ahmed', 'ahmed@doc.com', NULL, '$2y$12$Yq8G6DoSquYaZHyWHKVIk.zBxyYl0YzzPVyoZt60mldkrqi1.oM4G', NULL, '2026-03-04 03:28:42', '2026-03-04 03:28:42', 'medecin'),
(2, 'Dr Fatima', 'fatima@doc.com', NULL, '$2y$12$VuA/.TO3iwhdAoaQOWEKJeWq0RXnvNFUHtZZM2fRHNUC4kh.MRBQ6', NULL, '2026-03-04 03:28:44', '2026-03-04 03:28:44', 'medecin'),
(3, 'Dr Karim', 'karim@doc.com', NULL, '$2y$12$0cIW2.rFBuvgsOrFuZtPt.94lpzug52euwCwd0oaKOFVkLptsGg0G', NULL, '2026-03-04 03:28:45', '2026-03-04 03:28:45', 'medecin'),
(4, 'Dr Yahya', 'yahya@doc.com', NULL, '$2y$12$PTHCkQCz6IE1ZTsG6VQ7l.Ox8MiAoCPE5Z6KbuY4sDtF/fo4XG1TC', NULL, '2026-03-04 03:28:46', '2026-03-04 03:28:46', 'medecin'),
(5, 'Dr Hidaya', 'hidaya@doc.com', NULL, '$2y$12$nX1REYUNl4u5lswLMjuknucQkJHNpfod7jHVAtdO1rc70oZ8YggmS', NULL, '2026-03-04 03:28:47', '2026-03-04 03:28:47', 'medecin'),
(6, 'Dr Taha', 'taha@doc.com', NULL, '$2y$12$tA74zLGkWsmx0QuOZ.0Bxetqz16xpVv26G0XWteyfS0t1Vu8/1d1q', NULL, '2026-03-04 03:28:48', '2026-03-04 03:28:48', 'medecin'),
(7, 'Hassane', 'Hassane@test.com', NULL, '$2y$12$hh6z3JTlN8eVEAusEvmFleYDne3IoN.KnHAuEWU9KNH1guoeZ0J4G', NULL, '2026-03-04 03:28:49', '2026-03-04 03:28:49', 'patient'),
(8, 'Ali', 'ali@test.com', NULL, '$2y$12$CiVDqfxdohbSE3qsk/NuLeFFgoHZx2OsBt1NhQ/ghym7Jcip7Tm5u', NULL, '2026-03-04 03:28:50', '2026-03-04 03:28:50', 'patient'),
(9, 'Nadia', 'Nadia@test.com', NULL, '$2y$12$OzocW7GuLJu/9yWrJHxyueDBq69faxj0xVqP3o7lhMk4LnYaKrtXu', NULL, '2026-03-04 03:28:50', '2026-03-04 03:28:50', 'patient'),
(10, 'Areej', 'areej@test.com', NULL, '$2y$12$uVpO5S5xTwVTrzw2P3qevOwqM3eD5PGeTQWPnPNuw0.4RPtNcsRRu', NULL, '2026-03-04 03:28:51', '2026-03-04 03:28:51', 'patient');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Index pour la table `creneaux`
--
ALTER TABLE `creneaux`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creneaux_medecin_id_foreign` (`medecin_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medecins_user_id_foreign` (`user_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_user_id_foreign` (`user_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Index pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rendez_vous_medecin_id_foreign` (`medecin_id`),
  ADD KEY `rendez_vous_patient_id_foreign` (`patient_id`),
  ADD KEY `rendez_vous_creneau_id_foreign` (`creneau_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `creneaux`
--
ALTER TABLE `creneaux`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medecins`
--
ALTER TABLE `medecins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `creneaux`
--
ALTER TABLE `creneaux`
  ADD CONSTRAINT `creneaux_medecin_id_foreign` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD CONSTRAINT `medecins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD CONSTRAINT `rendez_vous_creneau_id_foreign` FOREIGN KEY (`creneau_id`) REFERENCES `creneaux` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rendez_vous_medecin_id_foreign` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rendez_vous_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
