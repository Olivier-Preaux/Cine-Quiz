-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 13 nov. 2020 à 12:27
-- Version du serveur :  8.0.22-0ubuntu0.20.04.2
-- Version de PHP : 7.4.3

DROP DATABASE IF EXISTS cinequiz;
CREATE DATABASE cinequiz;

USE cinequiz;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cinequiz`
--

-- --------------------------------------------------------

--
-- Structure de la table `answer`
--

CREATE TABLE `answer` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `result` int,
  `id_question` int NOT NULL,
  `id_quizs` int NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Déchargement des données de la table `answer`
--

INSERT INTO `answer` (`id`, `name`, `result`, `id_question`, `id_quizs`) VALUES
(1, 'Scarlett Johanson', 0, 1, 1),
(2, 'Michelle Rodriguez', 0, 1, 1),
(3, 'Sigourney Weaver', 1, 1, 1),
(4, 'Zoé Saldana', 0, 1, 1),
(5, 'Steven Spielberg', 0, 2, 1),
(6, 'Georges Lucas', 0, 2, 1),
(7, 'James Cameron ', 1, 2, 1),
(8, 'Tim Burton', 0, 2, 1),
(9, 'Eden', 0, 3, 1),
(10, 'Paladin', 0, 3, 1),
(11, 'Sirius', 0, 3, 1),
(12, 'Pandora', 1, 3, 1),
(13, 'L''uranium ', 0, 4, 1),
(14, 'L''unobtainium', 1, 4, 1),
(15, 'Le Plutonium', 0, 4, 1),
(16, 'L''Or', 0, 4, 1),
(17, 'Jim', 0, 5, 1),
(18, 'Jack', 0, 5, 1),
(19, 'John', 0, 5, 1),
(20, 'Jake', 1, 5, 1),
(21, 'Eywa', 1, 6, 1),
(22, 'Na vi', 0, 6, 1),
(23, 'Toruk', 0, 6, 1),
(24, 'Ikran', 0, 6, 1),
(25, 'Mawey', 0, 7, 1),
(26, 'Makto', 0, 7, 1),
(27, 'Ikran', 1, 7, 1),
(28, 'Ikto', 0, 7, 1),
(29, 'Jim', 0, 8, 1),
(30, 'Tom', 1, 8, 1),
(31, 'John', 0, 8, 1),
(32, 'Bill', 0, 8, 1),
(33, 'Ikran Makto', 0, 9, 1),
(34, 'Taurus Makto', 0, 9, 1),
(35, 'Toruk Makto', 1, 9, 1),
(36, 'Torakto', 0, 9, 1),
(37, 'Hell''s Gate', 1, 10, 1),
(38, 'Pandora''s Gate ', 0, 10, 1),
(39, 'Fire''s Base', 0, 10, 1),
(40, 'Pandora''s Base', 0, 10, 1),
(41, 'Qui Gon Jinn', 0, 11, 3),
(42, 'Bryan Mills', 1, 11, 3),
(43, 'Ra''s al Ghul', 0, 11, 3),
(44, 'Batman', 0, 11, 3),
(45, 'Gollum', 1, 12, 3),
(46, 'Frodon', 0, 12, 3),
(47, 'Sam', 0, 12, 3),
(48, 'Pipin', 0, 12, 3),
(49, 'Vernon Dursley', 0, 13, 3),
(50, 'Hagrid', 1, 13, 3),
(51, 'Albus Dumbledore', 0, 13, 3),
(52, 'Ron Weasley', 0, 13, 3),
(53, 'Alice au pays des merveilles', 0, 14, 3),
(54, 'La Ferme se rebelle', 0, 14, 3),
(55, 'Matrix', 1, 14, 3),
(56, 'Les Looney Tunes passent à l''action', 0, 14, 3),
(57, 'Harry Potter', 0, 15, 3),
(58, 'Starsky et Hutch', 0, 15, 3),
(59, 'Retour vers le Futur', 1, 15, 3),
(60, 'Les Minions', 0, 15, 3),
(61, 'Tata Fernande', 0, 16, 3),
(62, 'Oncle Owen', 0, 16, 3),
(63, 'Tante May', 0, 16, 3),
(64, 'Oncle Ben', 1, 16, 3),
(65, 'Montmirail-Saint Denis, qu''enfer si j''oublis', 0, 17, 3),
(66, 'Montsac-Saint Denis, que meure si je péris', 0, 17, 3),
(67, 'Montluc-Saint Denis, qu''embarras si contrepétrie', 0, 17, 3),
(68, 'Montjoie-Saint Denis, que trépasse si je faiblis', 1, 17, 3),
(69, 'Brice de Nice', 0, 18, 3),
(70, 'OSS 117', 1, 18, 3),
(71, 'The Artist', 0, 18, 3),
(72, 'Les Petits mouchoirs', 0, 18, 3),
(73, 'Willy Wonka', 0, 19, 3),
(74, 'Batman', 0, 19, 3),
(75, 'Spiderman', 0, 19, 3),
(76, 'Forrest Gump', 1, 19, 3),
(77, 'Star Wars', 1, 20, 3),
(78, 'Le Seigneur des Anneaux', 0, 20, 3),
(79, 'Harry Potter', 0, 20, 3),
(80, 'Men in Black', 0, 20, 3),
(81, '2012', 0, 21, 4),
(82, '2009', 0, 21, 4),
(83, '2010', 1, 21, 4),
(84, '2014', 0, 21, 4),
(85, '1946-49', 0, 22, 4),
(86, '1980-86', 0, 22, 4),
(87, '1918-23', 0, 22, 4),
(88, '1924-27', 1, 22, 4),
(89, '1971', 0, 23, 4),
(90, '1984', 0, 23, 4),
(91, '1974', 1, 23, 4),
(92, '1961', 0, 23, 4),
(93, '2004', 0, 24, 4),
(94, '2008', 0, 24, 4),
(95, '2009', 0, 24, 4),
(96, '2006', 1, 24, 4),
(97, '2010', 0, 25, 4),
(98, '2008', 0, 25, 4),
(99, '2013', 1, 25, 4),
(100, '2005', 0, 25, 4),
(101, 'Le dernier métro (1981)', 1, 26, 4),
(102, 'La balance (1983)', 0, 26, 4),
(103, 'Trop belle pour toi (1990)', 0, 26, 4),
(104, 'Cyrano de Bergerac (1991)', 0, 26, 4),
(105, '1960', 1, 27, 4),
(106, '1962', 0, 27, 4),
(107, '1971', 0, 27, 4),
(108, '1993', 0, 27, 4),
(109, '1991', 0, 28, 4),
(110, '2003', 0, 28, 4),
(111, '1999', 1, 28, 4),
(112, '2006', 0, 28, 4),
(113, '1994', 1, 29, 4),
(114, '1995', 0, 29, 4),
(115, '2000', 0, 29, 4),
(116, '1998', 0, 29, 4),
(117, '"Star Wars, épisode IV : Un nouvel espoir"', 1, 30, 4),
(118, '"Star Wars, épisode I : La Menace fantôme"', 0, 30, 4),
(119, 'VRAI', 0, 31, 5),
(120, 'FAUX', 1, 31, 5),
(121, 'VRAI', 1, 32, 5),
(122, 'FAUX', 0, 32, 5),
(123, 'VRAI', 0, 33, 5),
(124, 'FAUX', 1, 33, 5),
(125, 'VRAI', 1, 34, 5),
(126, 'FAUX', 0, 34, 5),
(127, 'VRAI', 0, 35, 5),
(128, 'FAUX', 1, 35, 5),
(129, 'VRAI', 1, 36, 5),
(130, 'FAUX', 0, 36, 5),
(131, 'VRAI', 1, 37, 5),
(132, 'FAUX', 0, 37, 5),
(133, 'VRAI', 1, 38, 5),
(134, 'FAUX', 0, 38, 5),
(135, 'VRAI', 1, 39, 5),
(136, 'FAUX', 0, 39, 5),
(137, 'VRAI', 1, 40, 5),
(138, 'FAUX', 0, 40, 5),
(139, 'Gérard Lanvin', 0, 41, 2),
(140, 'Gérard Depardieu', 1, 41, 2),
(141, 'Vincent Lindon', 0, 41, 2),
(142, 'Michel Blanc', 1, 42, 2),
(143, 'Philippe Noiret', 0, 42, 2),
(144, 'Mylene Farmer', 0, 42, 2),
(145, 'Philippe Lefebvre', 0, 43, 2),
(146, 'Gilles Lellouche', 0, 43, 2),
(147, 'Jean Dujardin', 1, 43, 2),
(148, 'Juliette Binoche', 0, 44, 2),
(149, 'Fanny Ardant', 0, 44, 2),
(150, 'Emmanuelle Béart', 1, 44, 2),
(151, 'Jamel Debbouze', 0, 45, 2),
(152, 'Franck Dubosk', 0, 45, 2),
(153, 'Gad Elmaleh', 1, 45, 2),
(154, 'Anouk Aimée', 0, 46, 2),
(155, 'Romy Schneider', 0, 46, 2),
(156, 'Françoise Dorléac', 1, 46, 2),
(157, 'Jane Birkin', 0, 47, 2),
(158, 'Juliette Binoche', 1, 47, 2),
(159, 'Catherine Deneuve', 0, 47, 2),
(160, 'Marion Cotillard', 0, 48, 2),
(161, 'Alexandra Lamy', 0, 48, 2),
(162, 'Bérénice Bejo', 1, 48, 2),
(163, 'Omar Sy', 1, 49, 2),
(164, 'Jean Rochefort', 0, 49, 2),
(165, 'Lambert Wilson', 0, 49, 2),
(166, 'Vanessa Paradis', 0, 50, 2),
(167, 'Marion Cotillard', 1, 50, 2),
(168, 'Valérie Lemercier', 0, 50, 2),
(169, 'The easter egg', 0, 51, 6),
(170, 'The extraterrestral', 0, 51, 6),
(171, 'Akko the alien', 0, 51, 6),
(172, 'E.T the extraterrestral', 1, 51, 6),
(173, 'Le Château ambulant', 0, 52, 6),
(174, 'Ponyo sur la falaise', 0, 52, 6),
(175, 'Kiki la petite sorcière', 0, 52, 6),
(176, 'Le voyage de Chihiro', 1, 52, 6),
(177, 'Fight Club', 0, 53, 6),
(178, 'Interstellar', 1, 53, 6),
(179, 'X-Men Orignis', 0, 53, 6),
(180, 'Avengers : Endgame', 0, 53, 6),
(181, 'The Last Nights', 0, 54, 6),
(182, 'Gladiator', 0, 54, 6),
(183, 'Le Hobbit', 0, 54, 6),
(184, 'Le monde de Narnia', 1, 54, 6),
(185, 'Madagascar 3', 0, 55, 6),
(186, 'Barbie et le lac des cigognes', 0, 55, 6),
(187, 'L''âge de glace', 0, 55, 6),
(188, 'Kang Fu Panda', 1, 55, 6),
(189, 'Avengers : Engame', 0, 56, 6),
(190, 'Doctor Strange', 1, 56, 6),
(191, 'Doctor Who', 0, 56, 6),
(192, 'Doctor House', 0, 56, 6),
(193, 'Zootopia', 1, 57, 6),
(194, 'Madagascar', 0, 57, 6),
(195, 'Comme des bêtes', 0, 57, 6),
(196, 'Robin des bois', 0, 57, 6),
(197, 'Gladiator', 1, 58, 6),
(198, '300', 0, 58, 6),
(199, 'Hammer of the Gods', 0, 58, 6),
(201, 'Ready Player One', 0, 59, 6),
(202, 'Mortal Engines', 0, 59, 6),
(203, 'Rogue One : A Star Wars Story', 1, 59, 6),
(204, 'Pacific Rim', 0, 59, 6),
(205, 'Edward aux mains d''argent', 0, 60, 6),
(206, 'Charlie et la chocolaterie', 1, 60, 6),
(207, 'Mortal Engines', 0, 60, 6),
(208, 'Retour vers le futur 3', 0, 60, 6);


-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name`text NOT NULL,
  `image` text NOT NULL,
  `id_quiz` int NOT NULL,
  `nb_question` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Déchargement des données de la table `question`
--


INSERT INTO `question` (`id`, `name`, `image`, `id_quiz`, `nb_question`) VALUES
(1, 'Quelle actrice joue le rôle de Grâce Augustine', 'avatar.jpg', 1, 1),
(2, 'Qui est le réalisateur du film AVATAR ?', 'avatar.jpg', 1, 2),
(3, 'Sur quelle planète se déroule le film ?', 'avatar.jpg', 1, 3),
(4, 'Quel minerai rare est présent sur la planète ?', 'avatar.jpg', 1, 4),
(5, 'Quel est le prénom du personnage principal  ?', 'avatar.jpg', 1, 5),
(6, 'Quel est le nom de la divinité dans le film ?', 'avatar.jpg', 1, 6),
(7, 'Quelle créature volante est montée par les chasseurs ?', 'avatar.jpg', 1, 7),
(8, 'Comment s''appelle le frère décédé de Jake ?', 'avatar.jpg', 1, 8),
(9, 'Comment Jake se fait appeler à la fin du film ?', 'avatar.jpg', 1, 9),
(10, 'Comment s''appelle la base des humains ?', 'avatar.jpg', 1, 10),
(11, 'Quel personnage dit "Je vous chercherais, je vous trouverais et je vous tuerais" ?', '*** lien image ***', 3, 1),
(12, 'Quel personnage du Seigneur des Anneaux dit : "Stupide hobbit joufflu !" ?', '*** lien image ***', 3, 2),
(13, 'Dans Harry Potter qui dit : "Tu es un sorcier Harry !" ?', '*** lien image ***', 3, 3),
(14, 'Où entend-on : "Tu dois suivre le lapin blanc" ?', '*** lien image ***', 3, 4),
(15, 'Dans quel film peut-on entendre : "Qui c''est que tu traites de banane ? Banane !" ?', '*** lien image ***', 3, 5),
(16, '"Un grand pouvoir implique de grandes responsabilités" qui dit cette phrase à Peter Parker ?', '*** lien image ***', 3, 6),
(17, 'Dans "les visiteurs", quel est le cri de guerre de la famille de Montmirail ?', '*** lien image ***', 3, 7),
(18, 'Dans quel film peut-on entendre : "Comment est votre blanquette ?" ?', '*** lien image ***', 3, 8),
(19, 'Quel personnage dit : "Maman disait toujours que la vie c''est comme une boîte de chocolat, on ne sait jamais sur quoi on va tomber" ?', '*** lien image ***', 3, 9),
(20, 'Dans quelle série de films on peut entendre cette phrase : "J''ai un mauvais pressentiment" ?', '*** lien image ***', 3, 10),
(21, 'Quand Moi moche et méchant 1 est-il sorti ?', '*** lien image ***', 4, 1),
(22, 'Quand est sorti le premier court métrage de Disney ?', '*** lien image ***', 4, 2),
(23, 'En quelle année est sorti "L''Exorciste" ?', '*** lien image ***', 4, 3),
(24, 'Quand est sorti le film X-men pour la première fois ?', '*** lien image ***', 4, 4),
(25, 'Quand est sorti le film Albator ?', '*** lien image ***', 4, 5),
(26, 'Depuis la crétion des Césars, un seul film a réussi "le grand chelem" : meilleur film, meilleur acteur, meilleure actrice, meilleur rélisateur. C''était...', '*** lien image ***', 4, 6),
(27, 'En quelle année est sorti "Psychose" ?', '*** lien image ***', 4, 7),
(28, 'Quand est sorti le premier film Matrix ?', '*** lien image ***', 4, 8),
(29, 'En quelle année est sorti "Pulp Fiction" ?', '*** lien image ***', 4, 9),
(30, 'Lequel de ses deux films est sorti en premier ?', '*** lien image ***', 4, 10),
(31, 'VRAI OU FAUX? Le réalisateur a utilisé du vrai sang de cochon pour asperger l’actrice Sissy Spacek dans la scène du bal, clou du film Carrie au bal du diable sorti en 1976.', '*** lien image ***', 5, 1),
(32, 'VRAI OU FAUX? Le film d’horreur d’ados Scream est basé sur des faits réels.', '*** lien image ***', 5, 2),
(33, 'VRAI OU FAUX? Alfred Hitchcock et Janet Leigh ont tous deux remporté un Oscar pour le film Psychose.', '*** lien image ***', 5, 3),
(34, 'VRAI OU FAUX? Le réalisateur de Massacre à la tronçonneuse, Tobe Hooper, a eu l’idée du film en voyant un assortiment de scies à chaîne dans une quincaillerie.', '*** lien image ***', 5, 4),
(35, 'VRAI OU FAUX? Le film Halloween, la nuit des masques a été un échec à sa sortie en 1978, mais il est devenu un film culte par la suite.', '*** lien image ***', 5, 5),
(36, 'VRAI OU FAUX? Avec son film Nosferatu le vampire, sorti en 1922, le réalisateur F. W. Murnau a plagié le roman Dracula de Bram Stoker.', '*** lien image ***', 5, 6),
(37, 'VRAI OU FAUX? Le film Ring sorti en 1998 est en partie inspiré d’une histoire de fantôme japonaise datant du 18e siècle.', '*** lien image ***', 5, 7),
(38, 'VRAI OU FAUX? Le film Black Christmas de 1974 est inspiré d’événements réels.', '*** lien image ***', 5, 8),
(39, 'VRAI OU FAUX? Le film La nuit des morts-vivants a été le premier film d’horreur à mettre en vedette un acteur noir.', '*** lien image ***', 5, 9),
(40, 'VRAI OU FAUX? Le requin mécanique dans Les dents de la mer, le grand classique d’horreur de 1975, s’est brisé plusieurs fois durant le tournage.', '*** lien image ***', 5, 10),
(41, 'Qui est cet acteur?', '41.jpg', 2, 1),
(42, 'Qui est cet acteur?', '42.jpg', 2, 2),
(43, 'Qui joue le rôle principal de la série de film "OSS 117" ?', '43.jpg', 2, 3),
(44, 'Quelle actrice française à jouer un rôle dans le premier film Mission impossible ?', '44.jpg', 2, 4),
(45, 'Célèbre humoriste, j''ai débuté ma carrière d''acteur en 1997 avec "Salut Cousin !" de Merzak Allouache. Je joue Schmuel Weismann dans "La Rafle" (2010). Qui suis-je ?', '45.jpg', 2, 5),
(46, 'Je suis la soeur de Catherine Deneuve et je joue le rôle de Solange dans "Les Demoiselles de Rochefort". Je suis morte dans un accident de voiture le 26/06/1967. Je suis...', '46.jpg', 2, 6),
(47, 'Je suis une actrice et comédienne mondialement reconnue. J''ai reçu de nombreux Césars. Je joue dans "Le Patient anglais". Je suis...', '47.jpg', 2, 7),
(48, 'Quelle actrice à jouer aux côtés de Jean Dujardin dans "OSS 117" et "The Artist" ?', '48.jpg', 2, 8),
(49, 'Quel acteur français a joué dans plusieurs films américains, dont Xmen et Inferno, et qui a joué dans un film faisant partie du Top 5 au Box-Office français ?', '49.jpg', 2, 9),
(50, 'Je suis mondialement connue. Je joue dans "Inception", "Dark Knight Rises" ou "Les petits Mouchoirs". Je suis...', '50.jpg', 2, 10),
(51, 'De quel film provient cette créature ?', '51.jpg', 6, 1),
(52, 'De quel film d''animation provient ces 2 personnages ?', '52.jpg', 6, 2),
(53, 'De quel film célèbre provient ce personnage ?', '53.jpg', 6, 3),
(54, 'De quel film vient ce personnage ?', '54.png', 6, 4),
(55, 'De quel film provient ce personnage ?', '55.jpg', 6, 5),
(56, 'De quel film est issu cet scène ?', '56.jpg', 6, 6),
(57, 'De quel film d''animation provient cette scène ?', '57.jpg', 6, 7),
(58, 'De quel film sort ce personnage ?', '58.jpg', 6, 8),
(59, 'De quel film provient ce personnage ?', '59.jpg', 6, 9),
(60, 'De quel film est issu ce personnage ?', '60.jpg', 6, 10);


-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE `quiz` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `id_theme` int NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`id`, `name`, `id_theme`) VALUES
(1, 'avatar', 1),
(2, 'acteurs et actrices français', 2),
(3, 'culture des repliques', 3),
(4, 'histoire d''un film', 4),
(5, 'films d''horreur', 5),
(6, 'Quel est ce film ?', 6),
(7, 'pulp fiction', 1),
(8, 'avengers', 1),
(9, 'indiana jones', 1),
(10, 'ponyo', 1),
(11, 'interstellar', 1);

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Déchargement des données de la table `theme`
--

INSERT INTO `theme` (`id`, `name`) VALUES
(1, 'films'),
(2, 'acteurs'),
(3, 'repliques'),
(4, 'histoire'),
(5, 'vrai/faux'),
(6, 'fourre-tout');

--
-- Index pour les tables déchargées
--

--
-- Contraintes pour la table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`id_quizs`) REFERENCES `quiz` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
