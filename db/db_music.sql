-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2025 at 05:55 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_music`
--

-- --------------------------------------------------------

--
-- Table structure for table `lagu`
--

CREATE TABLE `lagu` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lagu`
--

INSERT INTO `lagu` (`id`, `title`, `artist`, `cover`, `file`) VALUES
(1, 'Leave The Door Open', 'Bruno Mars, Anderson. Paak, Silk Sonic', 'uploads/1740124121_cover.jpg', 'uploads/1740124121_Bruno Mars, Anderson. Paak, Silk Sonic - Leave The Door Open.mp3'),
(2, 'The Only Exception', 'Paramore', 'uploads/1740124153_cover.jpg', 'uploads/1740124153_Paramore - The Only Exception.mp3'),
(3, 'Midnights', 'Taylor Swift', 'uploads/1740124176_cover.jpg', 'uploads/1740124176_Taylor Swift - Midnights.mp3'),
(4, 'Chihiro', 'Billie Eilish', 'uploads/1740124204_cover.jpg', 'uploads/1740124204_Billie Eilish - Chihiro.mp3'),
(5, 'A Feast of Friends', 'Jim Morrison', 'uploads/1740124246_cover.jpg', 'uploads/1740124246_Jim Morrison - A Feast of Friends.mp3'),
(6, 'Riders on the Storm', 'The Doors', 'uploads/1740124267_cover.jpg', 'uploads/1740124267_The Doors - Riders on the Storm.mp3'),
(7, 'Space Oddity', 'David Bowie', 'uploads/1740124292_cover.jpg', 'uploads/1740124292_David Bowie - Space Oddity.mp3'),
(8, 'Estranged', 'Guns N\' Roses', 'uploads/1740124314_cover.jpg', 'uploads/1740124314_Guns N\' Roses - Estranged.mp3'),
(9, 'November Rain', 'Guns N\' Roses', 'uploads/1740124335_cover.jpg', 'uploads/1740124334_Guns N\' Roses - November Rain.mp3'),
(10, 'Zona Nyaman', 'Fourtwnty', 'uploads/1740124364_cover.jpg', 'uploads/1740124364_Fourtwnty - Zona Nyaman.mp3'),
(11, 'Aku Tenang', 'Fourtwnty', 'uploads/1740124390_cover.jpg', 'uploads/1740124390_Fourtwnty - Aku Tenang.mp3'),
(12, 'Untuk Perempuan Yang Sedang Di Pelukan', 'Payung Teduh, Mohammad Istiqomah', 'uploads/1740124442_cover.jpg', 'uploads/1740124442_Payung Teduh, Mohammad Istiqomah - Untuk Perempuan Yang Sedang Di Pelukan.mp3'),
(13, 'Kasih Jangan Pergi', 'Bunga', 'uploads/1740124466_cover.jpg', 'uploads/1740124466_Bunga - Kasih Jangan Pergi.mp3'),
(14, 'Ojo Ngono', 'Bunga', 'uploads/1740124488_cover.jpg', 'uploads/1740124488_Bunga - Ojo Ngono.mp3'),
(15, 'Yang Terdalam', 'Peterpan', 'uploads/1740124523_cover.jpg', 'uploads/1740124523_Noah - Yang Terdalam.mp3'),
(16, 'Suit-Suit... He-he... (Gadis Sexy)', 'Slank', 'uploads/1740124591_cover.jpg', 'uploads/1740124591_Slank - Suit-Suit... He-he... (Gadis Sexy).mp3'),
(17, 'Memang', 'Slank', 'uploads/1740124623_cover.jpg', 'uploads/1740124623_Slank - Memang.mp3'),
(18, 'Maafkan', 'Slank', 'uploads/1740124644_cover.jpg', 'uploads/1740124644_Slank - Maafkan.mp3'),
(19, 'Apatis Blues', 'Slank', 'uploads/1740124677_cover.jpg', 'uploads/1740124677_Slank - Apatis Blues.mp3'),
(20, 'American Style', 'Slank', 'uploads/1740124702_cover.jpg', 'uploads/1740124702_Slank - American Style.mp3'),
(21, 'Aku Gila', 'Slank', 'uploads/1740124730_cover.jpg', 'uploads/1740124730_Slank - Aku Gila.mp3'),
(22, 'Kalah', 'Slank', 'uploads/1740124756_cover.jpg', 'uploads/1740124755_Slank - Kalah.mp3'),
(23, 'Bocah', 'Slank', 'uploads/1740124782_cover.jpg', 'uploads/1740124782_Slank - Bocah.mp3'),
(24, 'Karang', 'Slank', 'uploads/1740124811_cover.jpg', 'uploads/1740124811_Slank - Karang.mp3'),
(25, 'Ladies Night Di Ebony', 'Slank', 'uploads/1740124846_cover.jpg', 'uploads/1740124846_Slank - Ladies Night Di Ebony.mp3'),
(26, 'Mobil Balap', 'Naif', 'uploads/1740241468_cover.jpg', 'uploads/1740241468_Naif - Mobil Balap.mp3'),
(27, 'Benci Untuk Mencinta', 'Naif', 'uploads/1740241494_cover.jpg', 'uploads/1740241494_Naif - Benci Untuk Mencinta.mp3'),
(28, 'Lampu Merah', 'The Lantis', 'uploads/1740241517_cover.jpg', 'uploads/1740241517_The Lantis - Lampu Merah.mp3'),
(29, 'Bunga Maaf', 'The Lantis', 'uploads/1740241538_cover.jpg', 'uploads/1740241538_The Lantis - Bunga Maaf.mp3'),
(30, 'Cinta Yang Lain', 'Ungu Feat. Chrisye', 'uploads/1740241559_cover.jpg', 'uploads/1740241559_Ungu Feat. Chrisye - Cinta Yang Lain.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `file_path` text NOT NULL,
  `duration` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `artist`, `file_path`, `duration`) VALUES
(1, 'Zona Nyaman', 'Fourtwnty', 'uploads/1739781004_Fourtwnty-ZonaNyaman.mp3', NULL),
(3, 'Midnights', 'Taylor Swift', 'uploads/1739810442_Taylor Swift - Midnights.mp3', NULL),
(4, 'Shallow', 'Lady Gaga ft Bradley Cooper', 'uploads/1739810537_Lady Gaga Ft Bradley Cooper - Shallow.mp3', NULL),
(5, 'The Only Exception', 'Paramore', 'uploads/1739810602_Paramore - The Only Exception.mp3', NULL),
(6, 'Aku Tenang', 'Fourtwnty', 'uploads/1739816554_Fourtwnty-AkuTenang.mp3', NULL),
(7, 'Untuk Perempuan Yang Sedang Di Pelukan', 'Payung Teduh', 'uploads/1739816662_PayungTeduh-Untuk Perempuan.mp3', NULL),
(8, 'Face Down', 'The Red Jumpsuit Apparatus', 'uploads/1739816862_The-Red-Jumpsuit-Apparatus-Face-Down.mp3', NULL),
(9, 'Sofia', 'Clairo', 'uploads/1739817298_Clairo - Sofia.mp3', NULL),
(11, 'Leave The Door Open', 'Bruno Mars, Anderson. Paak, Silk Sonic', 'uploads/1739817552_Bruno Mars, Anderson. Paak, Silk Sonic - Leave The Door Open.mp3', NULL),
(13, 'Melukis Senja', 'Budi Doremi', 'uploads/1739857424_Budi Doremi - Melukis Senja.mp3', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lagu`
--
ALTER TABLE `lagu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_title` (`title`),
  ADD KEY `idx_artist` (`artist`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lagu`
--
ALTER TABLE `lagu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
