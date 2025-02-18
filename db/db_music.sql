-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Feb 2025 pada 08.22
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

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
-- Struktur dari tabel `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `file_path` text NOT NULL,
  `duration` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `songs`
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
-- Indeks untuk tabel `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_title` (`title`),
  ADD KEY `idx_artist` (`artist`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
