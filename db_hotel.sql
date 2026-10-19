-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2026 at 12:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `nomor_kamar` varchar(10) NOT NULL,
  `tipe_kamar` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'Tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nomor_kamar`, `tipe_kamar`, `harga`, `status`) VALUES
(1, '101', 'standard', 300000, 'Terisi'),
(2, '102', 'standard', 300000, 'Terisi'),
(3, '201', 'deluxe', 500000, 'Terisi'),
(4, '202', 'deluxe', 500000, 'Terisi'),
(5, '301', 'suite', 800000, 'Tersedia'),
(6, '302', 'Deluxe', 500000, 'Terisi'),
(7, '104', 'standard', 300000, 'Tersedia'),
(8, '303', 'deluxe', 500000, 'Tersedia'),
(9, '107', 'deluxe', 500000, 'Tersedia'),
(10, '103', 'standard', 300000, 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `id_tamu` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`id_reservasi`, `id_tamu`, `id_kamar`, `check_in`, `check_out`) VALUES
(2, 1, 3, '2026-09-10', '2026-09-11'),
(4, 2, 6, '2026-09-14', '2026-09-15'),
(6, 3, 5, '2026-10-15', '2026-10-18'),
(7, 1, 5, '2026-10-08', '2026-10-11');

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `id_tamu` int(11) NOT NULL,
  `nama_tamu` varchar(100) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`id_tamu`, `nama_tamu`, `no_hp`, `alamat`) VALUES
(1, 'Yaumy Fitria', '0812345678', 'Bati-bati'),
(2, 'arif aulia', '0812345678', 'banjarmasin'),
(3, 'halida', '0812345677', 'bati bati'),
(4, 'laila', '0812345', 'palam');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', '123', 'Administrator Hotel');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_tamu` (`id_tamu`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id_tamu`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id_tamu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_tamu`) REFERENCES `tamu` (`id_tamu`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
