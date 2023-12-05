-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2023 at 10:38 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spkmoor`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_User` int(15) NOT NULL,
  `username` varchar(125) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_User`, `username`, `password`) VALUES
(1, 'adminsekolah', 'c5a9c89e63451dfcd9f6b6d07f4c9fd0');

-- --------------------------------------------------------

--
-- Table structure for table `data_alternatif`
--

CREATE TABLE `data_alternatif` (
  `ID_Alter` int(15) NOT NULL,
  `Nama_Siswa` varchar(100) DEFAULT NULL,
  `JK` varchar(100) DEFAULT NULL,
  `Kelas` varchar(100) DEFAULT NULL,
  `Alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_alternatif`
--

INSERT INTO `data_alternatif` (`ID_Alter`, `Nama_Siswa`, `JK`, `Kelas`, `Alamat`) VALUES
(14, 'Khakha Surya Samudra', 'Laki-laki', '5', 'Dusun III Tanjung Mulia'),
(15, 'Anjani Septriansyah', 'Laki-laki', '2', 'Dusun I Tanjung Mulia'),
(16, 'Armansyah Daulay', 'Laki-laki', '2', 'DSN IV Tanjung Mulia'),
(17, 'Ismaya Dwi Aprianti', 'Perempuan', '3', 'Punden Rejo'),
(18, 'Putri Amelia ', 'Perempuan', '3', 'Tanjung Mulia');

-- --------------------------------------------------------

--
-- Table structure for table `data_kriteria`
--

CREATE TABLE `data_kriteria` (
  `ID_Kriteria` int(15) NOT NULL,
  `Nama_Kriteria` varchar(100) DEFAULT NULL,
  `Nilai_Bobot` float DEFAULT NULL,
  `Atribut` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_kriteria`
--

INSERT INTO `data_kriteria` (`ID_Kriteria`, `Nama_Kriteria`, `Nilai_Bobot`, `Atribut`) VALUES
(17, 'Pendapatan Orang Tua', 0.4, 'Cost'),
(18, 'Tanggungan Anak Sekolah', 0.2, 'Benefit'),
(19, 'Pekerjaan Orang Tua', 0.15, 'Benefit'),
(20, 'Nilai Raport', 0.05, 'Benefit'),
(21, 'Status Orang Tua', 0.2, 'Benefit'),
(22, 'Memiliki Kartu  Program Pemerintah', 0.3, 'Cost');

-- --------------------------------------------------------

--
-- Table structure for table `data_penilaian`
--

CREATE TABLE `data_penilaian` (
  `ID_Penilaian` int(15) NOT NULL,
  `ID_Alter` int(15) DEFAULT NULL,
  `ID_Kriteria` int(15) DEFAULT NULL,
  `Nilai` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_penilaian`
--

INSERT INTO `data_penilaian` (`ID_Penilaian`, `ID_Alter`, `ID_Kriteria`, `Nilai`) VALUES
(199, 14, 17, 2),
(200, 14, 18, 2),
(201, 14, 19, 3),
(202, 14, 20, 3),
(203, 14, 21, 3),
(204, 14, 22, 1),
(205, 15, 17, 5),
(206, 15, 18, 3),
(207, 15, 19, 2),
(208, 15, 20, 3),
(209, 15, 21, 1),
(210, 15, 22, 3),
(211, 16, 17, 2),
(212, 16, 18, 3),
(213, 16, 19, 4),
(214, 16, 20, 3),
(215, 16, 21, 1),
(216, 16, 22, 3),
(217, 17, 17, 4),
(218, 17, 18, 2),
(219, 17, 19, 4),
(220, 17, 20, 3),
(221, 17, 21, 1),
(222, 17, 22, 3),
(223, 18, 17, 2),
(224, 18, 18, 4),
(225, 18, 19, 3),
(226, 18, 20, 3),
(227, 18, 21, 1),
(228, 18, 22, 3);

-- --------------------------------------------------------

--
-- Table structure for table `data_subkriteria`
--

CREATE TABLE `data_subkriteria` (
  `ID_Sub` int(15) NOT NULL,
  `ID_Kriteria` int(15) DEFAULT NULL,
  `Nama_Subkriteria` varchar(120) DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `Nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_subkriteria`
--

INSERT INTO `data_subkriteria` (`ID_Sub`, `ID_Kriteria`, `Nama_Subkriteria`, `Keterangan`, `Nilai`) VALUES
(69, 17, '&lt;700.000', 'Sangat Buruk', 1),
(70, 17, '701.000 - 1.000.000', 'Kurang Baik', 2),
(71, 17, '1.001.000 - 1.200.000', 'Cukup', 3),
(72, 17, '1.201.000 - 1.500.000', 'Baik', 4),
(73, 17, '&gt; 1.501.000', 'Sangat Baik', 5),
(74, 18, '1 anak', 'Tidak Baik', 1),
(75, 18, '2 anak', 'Cukup', 2),
(76, 18, '3 anak', 'Baik', 3),
(77, 18, '&lt; 4 anak', 'Sangat Baik', 4),
(78, 19, 'PNS', 'Tidak Baik', 1),
(79, 19, 'Karyawan/Wiraswasta', 'Cukup', 2),
(80, 19, 'Petani', 'Baik', 3),
(81, 19, 'Buruh', 'Sangat Baik', 4),
(82, 20, '&lt; 70', 'Tidak Baik', 1),
(83, 20, '71 - 80', 'Cukup', 2),
(84, 20, '81 - 90', 'Baik', 3),
(85, 20, '91 - 100', 'Sangat Baik', 4),
(86, 21, 'Masih Ada Keduanya ', 'Tidak Baik', 1),
(87, 21, 'Piatu', 'Cukup', 2),
(88, 21, 'Yatim', 'Baik', 3),
(89, 21, 'Yatim Piatu', 'Sangat Baik', 4),
(90, 22, 'Tidak ada', 'Sangat Baik', 4),
(91, 22, 'Memiliki SKTM', 'Baik', 3),
(92, 22, 'Terdaftar PKH', 'Cukup', 2),
(93, 22, 'Terdaftar KPS', 'Tidak Baik', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hasil_normalisasi`
--

CREATE TABLE `hasil_normalisasi` (
  `ID_Norm` int(15) NOT NULL,
  `ID_Alter` int(15) DEFAULT NULL,
  `ID_Kriteria` int(15) DEFAULT NULL,
  `Hasil_Norm` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasil_normalisasi`
--

INSERT INTO `hasil_normalisasi` (`ID_Norm`, `ID_Alter`, `ID_Kriteria`, `Hasil_Norm`) VALUES
(1, 14, 17, 0.274721),
(2, 15, 17, 0.686803),
(3, 16, 17, 0.274721),
(4, 17, 17, 0.549442),
(5, 18, 17, 0.274721),
(6, 14, 18, 0.308607),
(7, 15, 18, 0.46291),
(8, 16, 18, 0.46291),
(9, 17, 18, 0.308607),
(10, 18, 18, 0.617213),
(11, 14, 19, 0.408248),
(12, 15, 19, 0.272166),
(13, 16, 19, 0.544331),
(14, 17, 19, 0.544331),
(15, 18, 19, 0.408248),
(16, 14, 20, 0.447214),
(17, 15, 20, 0.447214),
(18, 16, 20, 0.447214),
(19, 17, 20, 0.447214),
(20, 18, 20, 0.447214),
(21, 14, 21, 0.83205),
(22, 15, 21, 0.27735),
(23, 16, 21, 0.27735),
(24, 17, 21, 0.27735),
(25, 18, 21, 0.27735),
(26, 14, 22, 0.164399),
(27, 15, 22, 0.493197),
(28, 16, 22, 0.493197),
(29, 17, 22, 0.493197),
(30, 18, 22, 0.493197);

-- --------------------------------------------------------

--
-- Table structure for table `hasil_optimasi`
--

CREATE TABLE `hasil_optimasi` (
  `ID_Optimasi` int(11) NOT NULL,
  `ID_Alter` int(11) DEFAULT NULL,
  `ID_Kriteria` int(11) DEFAULT NULL,
  `Hasil_Optimasi` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasil_optimasi`
--

INSERT INTO `hasil_optimasi` (`ID_Optimasi`, `ID_Alter`, `ID_Kriteria`, `Hasil_Optimasi`) VALUES
(1, 14, 17, 0.109888),
(2, 15, 17, 0.274721),
(3, 16, 17, 0.109888),
(4, 17, 17, 0.219777),
(5, 18, 17, 0.109888),
(6, 14, 18, 0.0617213),
(7, 15, 18, 0.092582),
(8, 16, 18, 0.092582),
(9, 17, 18, 0.0617213),
(10, 18, 18, 0.123443),
(11, 14, 19, 0.0612372),
(12, 15, 19, 0.0408248),
(13, 16, 19, 0.0816497),
(14, 17, 19, 0.0816497),
(15, 18, 19, 0.0612372),
(16, 14, 20, 0.0223607),
(17, 15, 20, 0.0223607),
(18, 16, 20, 0.0223607),
(19, 17, 20, 0.0223607),
(20, 18, 20, 0.0223607),
(21, 14, 21, 0.16641),
(22, 15, 21, 0.05547),
(23, 16, 21, 0.05547),
(24, 17, 21, 0.05547),
(25, 18, 21, 0.05547),
(26, 14, 22, 0.0493197),
(27, 15, 22, 0.147959),
(28, 16, 22, 0.147959),
(29, 17, 22, 0.147959),
(30, 18, 22, 0.147959);

-- --------------------------------------------------------

--
-- Table structure for table `hasil_preferensi`
--

CREATE TABLE `hasil_preferensi` (
  `ID_Pref` int(15) NOT NULL,
  `ID_Alter` int(15) DEFAULT NULL,
  `hasil_pref` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasil_preferensi`
--

INSERT INTO `hasil_preferensi` (`ID_Pref`, `ID_Alter`, `hasil_pref`) VALUES
(1, 14, 0.152522),
(2, 15, -0.211443),
(3, 16, -0.0057846),
(4, 17, -0.146534),
(5, 18, 0.0046639);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_User`);

--
-- Indexes for table `data_alternatif`
--
ALTER TABLE `data_alternatif`
  ADD PRIMARY KEY (`ID_Alter`);

--
-- Indexes for table `data_kriteria`
--
ALTER TABLE `data_kriteria`
  ADD PRIMARY KEY (`ID_Kriteria`);

--
-- Indexes for table `data_penilaian`
--
ALTER TABLE `data_penilaian`
  ADD PRIMARY KEY (`ID_Penilaian`),
  ADD KEY `data_penilaian_FK_1` (`ID_Alter`),
  ADD KEY `data_penilaian_FK` (`ID_Kriteria`);

--
-- Indexes for table `data_subkriteria`
--
ALTER TABLE `data_subkriteria`
  ADD PRIMARY KEY (`ID_Sub`),
  ADD KEY `data_subkriteria_FK` (`ID_Kriteria`);

--
-- Indexes for table `hasil_normalisasi`
--
ALTER TABLE `hasil_normalisasi`
  ADD PRIMARY KEY (`ID_Norm`),
  ADD KEY `hasil_normalisasi_FK` (`ID_Alter`),
  ADD KEY `hasil_normalisasi_FK_1` (`ID_Kriteria`);

--
-- Indexes for table `hasil_optimasi`
--
ALTER TABLE `hasil_optimasi`
  ADD PRIMARY KEY (`ID_Optimasi`),
  ADD KEY `ID_Alter` (`ID_Alter`),
  ADD KEY `ID_Kriteria` (`ID_Kriteria`);

--
-- Indexes for table `hasil_preferensi`
--
ALTER TABLE `hasil_preferensi`
  ADD PRIMARY KEY (`ID_Pref`),
  ADD KEY `hasil_preferensi_FK` (`ID_Alter`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_User` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_alternatif`
--
ALTER TABLE `data_alternatif`
  MODIFY `ID_Alter` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `data_kriteria`
--
ALTER TABLE `data_kriteria`
  MODIFY `ID_Kriteria` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `data_penilaian`
--
ALTER TABLE `data_penilaian`
  MODIFY `ID_Penilaian` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `data_subkriteria`
--
ALTER TABLE `data_subkriteria`
  MODIFY `ID_Sub` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `hasil_normalisasi`
--
ALTER TABLE `hasil_normalisasi`
  MODIFY `ID_Norm` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `hasil_optimasi`
--
ALTER TABLE `hasil_optimasi`
  MODIFY `ID_Optimasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `hasil_preferensi`
--
ALTER TABLE `hasil_preferensi`
  MODIFY `ID_Pref` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_penilaian`
--
ALTER TABLE `data_penilaian`
  ADD CONSTRAINT `data_penilaian_FK` FOREIGN KEY (`ID_Kriteria`) REFERENCES `data_kriteria` (`ID_Kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_penilaian_FK_1` FOREIGN KEY (`ID_Alter`) REFERENCES `data_alternatif` (`ID_Alter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_subkriteria`
--
ALTER TABLE `data_subkriteria`
  ADD CONSTRAINT `data_subkriteria_FK` FOREIGN KEY (`ID_Kriteria`) REFERENCES `data_kriteria` (`ID_Kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil_normalisasi`
--
ALTER TABLE `hasil_normalisasi`
  ADD CONSTRAINT `hasil_normalisasi_FK` FOREIGN KEY (`ID_Alter`) REFERENCES `data_alternatif` (`ID_Alter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_normalisasi_FK_1` FOREIGN KEY (`ID_Kriteria`) REFERENCES `data_kriteria` (`ID_Kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil_optimasi`
--
ALTER TABLE `hasil_optimasi`
  ADD CONSTRAINT `hasil_optimasi_ibfk_1` FOREIGN KEY (`ID_Alter`) REFERENCES `data_alternatif` (`ID_Alter`),
  ADD CONSTRAINT `hasil_optimasi_ibfk_2` FOREIGN KEY (`ID_Kriteria`) REFERENCES `data_kriteria` (`ID_Kriteria`);

--
-- Constraints for table `hasil_preferensi`
--
ALTER TABLE `hasil_preferensi`
  ADD CONSTRAINT `hasil_preferensi_FK` FOREIGN KEY (`ID_Alter`) REFERENCES `data_alternatif` (`ID_Alter`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
