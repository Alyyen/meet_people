-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 06 fév. 2022 à 22:38
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mymeetic`
--

-- --------------------------------------------------------

--
-- Structure de la table `hobbies`
--

CREATE TABLE `hobbies` (
  `name` varchar(255) NOT NULL,
  `id_hobby` int(10) NOT NULL,
  `id_member` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hobbies`
--

INSERT INTO `hobbies` (`name`, `id_hobby`, `id_member`) VALUES
('Cooking', 1, 62),
('Manga', 2, 63),
('Unicorn', 3, 64);

-- --------------------------------------------------------

--
-- Structure de la table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `genre` varchar(10) NOT NULL,
  `active` tinytext NOT NULL DEFAULT 'TRUE',
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `member`
--

INSERT INTO `member` (`id`, `lastname`, `firstname`, `city`, `mail`, `birthdate`, `genre`, `active`, `password`) VALUES
(1, 'HELLO', 'World', 'London', 'hello.world@mail.com', '2000-02-02', 'Man', '1', ''),
(2, 'jack', 'JACK', 'Londres', 'jj@mail.com', '2000-01-01', 'man', '1', ''),
(3, 'jack', 'JACK', 'Londres', 'jj@mail.com', '2000-01-01', 'man', '1', ''),
(4, 'jack', 'JACK', 'Londres', 'jj@mail.com', '2000-01-01', 'man', '1', ''),
(5, 'jack', 'JACK', 'Londres', 'jj@mail.com', '2000-01-01', 'man', '1', ''),
(6, 'Colomar', 'Alyssia', 'La Madeleine', 'truc@truc.truc', '2020-02-01', 'man', '1', ''),
(7, 'truc', 'truc', 'truc', 'truc@truc.truc', '2020-02-01', 'woman', '1', ''),
(8, 'truc', 'truc', 'truc', 'truc@truc.truc', '2020-02-01', 'other', '1', ''),
(9, 'j', 'j', 'j', 'j@mail.co', '2020-02-01', 'other', '1', ''),
(10, 'j', 'j', 'j', 'j@mail.co', '2020-02-01', 'other', '1', ''),
(11, 'j', 'j', 'j', 'j@mail.co', '2020-02-01', 'other', '1', ''),
(12, 'Otine', 'Guy', 'Dublin', 'guyotine@mail.co', '2020-02-01', 'man', '1', ''),
(13, 'Otine', 'Guy', 'Paris', 'guyotine@mail.co', '2020-02-01', 'other', '1', ''),
(14, 'con', 'con', 'concon', 'concombre@mail.con', '2020-02-01', 'other', '1', ''),
(15, 'c', 'a', 'b', 'a@ma.con', '2020-02-01', 'man', '1', ''),
(16, 'c', 'a', 'b', 'a@m.co', '2020-02-01', 'man', '1', ''),
(17, 'b', 'a', 'c', 'a@h.con', '2020-02-01', 'man', '1', ''),
(18, 'Colomar', 'Alyssia', 'La Madeleine', '154 Rue du Général de Gaulle', '2020-02-01', 'man', '1', ''),
(19, 'Colomar', 'Alyssia', 'La Madeleine', '154 Rue du Général de Gaulle', '2020-02-01', 'man', '1', ''),
(20, 'c', 'a', 'ab', 'ac@truc.con', '2020-02-01', 'man', '1', ''),
(21, 'Colomar', 'Alyssia', 'La Madeleine', 'truc', '2020-02-01', 'man', '1', ''),
(22, 'con', 'con', 'con', 'concombre@mail.con', '2020-02-01', 'woman', '1', ''),
(23, 'Colomar', 'Alyssia', 'La Madeleine', 'con@con.con', '2020-02-01', 'man', '1', ''),
(24, 'Colomar', 'Alyssia', 'La Madeleine', 'concombre@mail.con', '2020-02-01', 'man', '1', ''),
(25, 'truc', 'truc', 'truc', 'co', '2020-02-01', 'man', '1', ''),
(26, 'Colomar', 'Alyssia', 'La Madeleine', 'dqnkjsdhqliudh', '2020-02-01', 'man', '1', ''),
(27, 'putain', 'marche', 'enfin', 'jpp@mail.marre', '2000-02-01', 'woman', '1', ''),
(28, 'MICHEL', 'MICHEL', 'MICHEL', 'ZQHEKQZG', '2020-02-01', 'man', '1', ''),
(29, 'MICHEL', 'MICHEL', 'MICHEL', 'mail@mail.con', '2020-02-01', 'woman', '1', ''),
(30, 'JANUARIO', 'Martin', 'La Madeleine', 'raptor80jesus@gmail.com', '1997-05-05', 'man', '1', ''),
(31, 'JANUARIO', 'Martin', 'La Madeleine', 'raptor80jesus@gmail.com', '1997-05-05', 'man', '1', ''),
(32, 'JANUARIO', 'Martin', 'La Madeleine', 'raptor80jesus@gmail.com', '1997-05-05', 'man', '1', ''),
(33, 'JANUARIO', 'Martin2', 'La Madeleine', 'raptor80jesus@gmail.com', '1997-05-05', 'man', '1', ''),
(34, 'JANUARIO', 'Martin2', 'La Madeleine', 'raptor80jesus@gmail.com', '1997-05-05', 'man', '1', ''),
(35, 'JANUARIO', 'Martin2', 'La Madeleine', 'raptor80jesus@gmail.com', '1997-05-05', 'man', '1', ''),
(36, 'JANUARIO', 'Martin2', 'La Madeleine', 'raptor80jesus@gmail.com', '1997-05-05', 'man', '1', ''),
(37, 'JANUARIO', 'Martin2', 'La Madeleine', 'raptor80jesus@gmail.com', '1997-05-05', 'man', '1', ''),
(38, 'JANUARIO', 'Martin', 'La Madeleine', 'raptor80jesus@gmail.com', '1997-05-05', 'other', 'TRUE', '$2y$10$hbPRb4XkedsS4NoH6dOSaergKy4JbGONhL91IL8/XB/ve.vnCs8xe'),
(39, 'JANUARIA', 'Martine', 'La Madeleine', 'raptora80jesusa@gmail.com', '1997-05-06', 'man', 'TRUE', '$2y$10$ATql1O4rifR039mqMtV81eAFFR8Utb0uBgbVOnq1cHlFPW6sV5dCa'),
(40, 'Popotame', 'Aly', 'Nil', 'alypopo@gmail.com', '1997-05-05', 'woman', 'TRUE', '$2y$10$aS3NNvq.ggx06AvUQ5Ss/O4UGNqw9NNTt7FNNF4Ql76lXdjWYEKk2'),
(41, 'JANUARIO', 'Martin', 'La Madeleine', 'raptor80j22esus@gmail.com', '1997-05-05', 'man', 'TRUE', '$2y$10$rBRxeIGZ4zlP7.M3e09touApzKuNl2bmiIFOVhAyWNsOZfWR1FItS'),
(42, 'Pocampe', 'Aly', 'Pôle Nord', 'alypocampo@gmail.com', '1997-05-05', 'other', 'TRUE', '$2y$10$kxDa87AnDkCvoYm8Kf4OJ.mXKJkpLseh49m.yx4i9hDlwCmcPNT4y'),
(43, 'Pocampe', 'Aly', 'Pôle Nord', 'alypocampo@gmail.com', '1997-05-05', 'other', 'TRUE', '$2y$10$fqfZYS5V6xsX2UkD8Rvno.gowfa2enOJD5Q9RIL3kc.8SUAZFwrbi'),
(44, 'Pnose', 'Aly', 'Pôle Nord', 'alypnose@gmail.com', '1997-05-05', 'man', 'TRUE', '$2y$10$HSNjWClC07yapq5Jben6xOAhbyty7FpewO/TkxlydzzxDkHrWkGpy'),
(45, 'Znogood', 'ALYEN', 'Pôle Nord', 'alyznogood@gmail.com', '1997-05-05', 'woman', 'TRUE', '$2y$10$P5/t.RVBkGSO9EQC5MZaXuBrSJuqZwXO/cTMw3LP2QLWDGPZ4d4my'),
(46, 'Nimitable', 'Aly', 'Pôle Nord', 'alynimitable@gmail.com', '1997-05-05', 'other', 'TRUE', '$2y$10$XWJYspw5erjXnkeqKo4mkeuCwxjgCDAvS8gdevMpmu60I8JdzegRa'),
(47, 'Pocrite', 'Aly', 'Pôle Nord', 'alypocrite@gmail.com', '1997-05-05', 'woman', 'TRUE', '$2y$10$1MN.bg6ZH3Sr49YtIKEJx.iqIi2DBdREcVvimPOKZod8NZI084/9a'),
(48, 'Sterique', 'Aly', 'Pôle Nord', 'alysterique@gmail.com', '1997-05-05', 'woman', 'TRUE', '$2y$10$A1GM07LnKOPSbjhuHrv6HuQwB069T9T/TJKtIlGIYq3VBDzrVpRQ6'),
(49, 'aze', 'aze', 'Pôle Nord', '@gmail.com', '1997-05-05', 'man', 'TRUE', '$2y$10$6mDpd9Xj/SnT8NTnP.47PuP63IIwvOZpqyNEBNoVQeu8Wz3gvgZ1y'),
(50, 'aze', 'aze', 'Pôle Nord', 'azeaze@gmail.com', '1997-05-05', 'man', 'TRUE', '$2y$10$LcS0EYfquer87AnX74EQyuFXDQe2Z4rCbvro.vv1otBOvmjWbtPUC'),
(51, 'aze', 'aze', 'Pôle Nord', 'azzzzeaze@gmail.com', '1997-05-05', 'man', 'TRUE', '$2y$10$WWlTMaiKTy5TutbXhuSDmOAkvHAMRaM0fW9/tK0qjadGkzGAnf4zO'),
(52, 'Adit', 'Jackadit', 'Pôle Nord', 'jackaditadit@gmail.com', '1997-05-05', 'man', 'TRUE', '$2y$10$JGX6eYYzpgqexCxrDGAG3OQahr19xogphFKEB3YlwnJc1/mV8asTK'),
(53, 'muche', 'truc', 'Pôle Nord', 'truc_muche@gmail.com', '1997-05-05', 'woman', 'TRUE', '$2y$10$P7tnQIHc9pe9kQAD45s2N.Kc3GLKQG2ARyKoDfYtsCl/LPpZQFCY6'),
(54, 'sndkjdl', 'hjygdqyudk', 'Pôle Nord', 'qzheuirgelyqz@gmail.com', '1997-05-05', 'other', 'TRUE', '$2y$10$bXH4E3kRqyrhOO6BcwrwquMUZqM4RzWi7/0nXb/jMBEfkNO2tpNg.'),
(55, 'dfdgfnh', 'trerz', 'Pôle Nord', 'hyfdqdzs@gmail.com', '1997-05-05', 'man', 'TRUE', '$2y$10$RIzCpcUzQfFqYzTXK0Oei.tN4jv81VBpnC.XpqT6woXmw5l2Q3DZi'),
(56, 'dfdgfnh', 'trerz', 'Pôle Nord', 'hyfdfesfdqdzs@gmail.com', '1997-05-05', 'man', 'FALSE', '$2y$10$8MkHnyzX6jyLCL.aX.KikutYp4Ev9IOB/wUPy1vFORmOkP3fukAaK'),
(57, 'hqskuqhs', 'hdhuswgyd', 'Pôle Nord', 'qnkjdhfsykeg@gmail.com', '1997-05-05', 'man', 'TRUE', '$2y$10$QQnS8KLm8.6HaCN.QhFzh.n9994ybaWZ0IezsoehtBugQltYxBmJ2'),
(58, 'sparrow', 'jack', 'Pôle Nord', 'jsparrow@gmail.com', '1997-05-05', 'other', 'FALSE', '$2y$10$I29eg1T.rW9QQ9XqMTd1aufo9yv9jUKzOTs2/NMXUjz9.pE807wcm'),
(59, 'sparrow', 'jack', 'Pôle Nord', 'jsparrowwww@gmail.com', '1997-05-05', 'other', 'FALSE', '$2y$10$uxidJZlgVNDLWU21FGHjnOoeLfJUbY5uKs0Xs7T3V/J6GKI0OkouS'),
(60, 'sparrow', 'jack', 'Pôle Nord', 'jsparrowww@gmail.com', '1997-05-05', 'other', 'FALSE', '$2y$10$B9t3jyNfExhehwxkcLmsC.6Zv5lXks1nt63/nwZ0x2Jmqwy0Dnc26'),
(61, 'World', 'Hello', 'Pôle Nord', 'heyworld@gmail.com', '1997-05-05', 'other', 'TRUE', '$2y$10$KF2u8QuERBe.PmQfqKtbXe4SRi9WPcwBZHMR0QTC7khzTi.7ywAdu'),
(62, 'World', 'Hello', 'Pôle Nord', 'hello___world@gmail.com', '1997-05-05', 'other', 'TRUE', '$2y$10$LC8a.6.aCFazq6v6YPCnMeOoC2lZRt8EWDqsjfTxYVOXF26/yRKK.'),
(63, 'Luke', 'Lucky', 'Pôle Nord', 'luckyluke@gmail.com', '1997-05-05', 'man', 'TRUE', '$2y$10$D0x85RJoHq3AGmilUQVe1.FHM6.b6fgKJ41TBgmSjc6bSfLRCBdmi'),
(64, 'Ppopotamus', 'Aly', 'Nil', 'alyppopotamus@gmail.com', '1997-05-05', 'other', 'TRUE', '$2y$10$3ZQ6tmPOVNIrAWw6BtCVhuWmAk4e8btklscxBWrAw4J5m.DqbfWgm');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id_hobby`),
  ADD UNIQUE KEY `id_hobby_2` (`id_hobby`),
  ADD KEY `id_hobby` (`id_hobby`);

--
-- Index pour la table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id_hobby` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
