-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2023 at 01:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs_warga_gfh`
--

-- --------------------------------------------------------

--
-- Table structure for table `blok_kavling`
--

CREATE TABLE `blok_kavling` (
  `kd_blok` int(5) NOT NULL,
  `nama_blok` varchar(3) NOT NULL,
  `no_blok` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blok_kavling`
--

INSERT INTO `blok_kavling` (`kd_blok`, `nama_blok`, `no_blok`) VALUES
(1, 'E1', '02'),
(2, 'E1', '07'),
(3, 'E1', '08'),
(4, 'E1', '09'),
(5, 'E1', '10'),
(6, 'E1', '12'),
(7, 'E1', '12A'),
(8, 'E2', '01'),
(9, 'E2', '02'),
(10, 'E2', '03');

-- --------------------------------------------------------

--
-- Table structure for table `info_warga`
--

CREATE TABLE `info_warga` (
  `kd_info` int(11) NOT NULL,
  `judul_info` varchar(30) NOT NULL,
  `informasi` text NOT NULL,
  `tgl_info` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `info_warga`
--

INSERT INTO `info_warga` (`kd_info`, `judul_info`, `informasi`, `tgl_info`) VALUES
(1, 'Kerja Bakti', 'Diberitahuan kepada seluruh warga pada tanggal 3 november kita akan mengadakan kerja bakti, Diharapkan kepada bapak/ibu agar dapat bertasipasi dalam kegiatan ini.Terimakasi', '2023-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `iuran_warga`
--

CREATE TABLE `iuran_warga` (
  `kd_iuran` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `jenis_pembayaran` enum('KAS','Lainnya') NOT NULL,
  `keterangan` text NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `bukti_iuran` varchar(100) NOT NULL,
  `kas_tahun` varchar(4) NOT NULL,
  `kas_bulan` int(1) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `iuran_warga`
--

INSERT INTO `iuran_warga` (`kd_iuran`, `nik`, `jenis_pembayaran`, `keterangan`, `tgl_pembayaran`, `bukti_iuran`, `kas_tahun`, `kas_bulan`, `status`) VALUES
(1, '3174108807990003', 'KAS', 'Oktober', '2023-10-31', '', '2023', 10, 0),
(2, '3021441067701125', 'KAS', 'BAYAR KAS OKTOBER 2023', '2023-10-18', '', '2023', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `penduduk`
--

CREATE TABLE `penduduk` (
  `kd_penduduk` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `kk` varchar(16) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` enum('Islam','Kristen','Budha','Hindu','Konghucu') NOT NULL,
  `status_perkawinan` enum('Menikah','Belum Menikah','Janda','Duda') NOT NULL,
  `status_keluarga` enum('Kepala Keluarga','Istri','Anak','Orang Tua','Saudara') NOT NULL,
  `status_pekerjaan` enum('PNS','Karyawan Swasta','Dosen','Guru','Wiraswasta','Mengurus Rumah Tangga','Pelajar/Mahasiswa') NOT NULL,
  `status_kewarganegaraan` enum('WNI','WNA') NOT NULL,
  `kd_blok` int(5) NOT NULL,
  `status_kavling` enum('Pemilik','Kontrak') NOT NULL,
  `tgl_masuk` date NOT NULL,
  `status_huni` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penduduk`
--

INSERT INTO `penduduk` (`kd_penduduk`, `nik`, `kk`, `foto`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `status_perkawinan`, `status_keluarga`, `status_pekerjaan`, `status_kewarganegaraan`, `kd_blok`, `status_kavling`, `tgl_masuk`, `status_huni`) VALUES
(1, '3174108807990003', '3271108807990003', '', 'Marni Sumarni', 'Bogor', '1993-10-02', 'P', 'Islam', 'Menikah', 'Istri', 'Mengurus Rumah Tangga', 'WNI', 2, 'Pemilik', '2020-08-16', 'Aktif'),
(2, '3174108807780012', '3271108807990003', '', 'Tio Darmawan', 'Jakarta', '1994-05-12', 'L', 'Islam', 'Menikah', 'Kepala Keluarga', 'Karyawan Swasta', 'WNI', 2, 'Pemilik', '2020-08-16', 'Aktif'),
(3, '3021441067701125', '3121441067701125', '', 'Ryan Hermawan', 'Semarang', '1989-09-17', 'L', 'Kristen', 'Duda', 'Kepala Keluarga', 'PNS', 'WNI', 4, 'Pemilik', '2022-01-05', 'Aktif'),
(4, '3021441006080007', '3121441067701125', '', 'Raisya Hermawan ', 'Bogor', '2017-04-21', 'P', 'Kristen', 'Belum Menikah', 'Anak', 'Pelajar/Mahasiswa', 'WNI', 4, 'Pemilik', '2022-01-05', 'Tidak Aktif'),
(5, '3021441006011239', '3121441067701125', '', 'Teressa Kristiani ', 'Denpasar', '1958-03-05', 'P', 'Kristen', 'Janda', 'Orang Tua', 'Mengurus Rumah Tangga', 'WNI', 4, 'Pemilik', '2022-01-05', 'Tidak Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `pesan_warga`
--

CREATE TABLE `pesan_warga` (
  `kd_pesan` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `pesan` text NOT NULL,
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesan_warga`
--

INSERT INTO `pesan_warga` (`kd_pesan`, `nik`, `pesan`, `tgl_pesan`) VALUES
(1, '3174108807990003', 'Pak pemberitahuan PAM tolong disebarkan biar kita bisa siap siap soalnya suka kehabisan air dirumah', '2023-10-27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blok_kavling`
--
ALTER TABLE `blok_kavling`
  ADD PRIMARY KEY (`kd_blok`);

--
-- Indexes for table `info_warga`
--
ALTER TABLE `info_warga`
  ADD PRIMARY KEY (`kd_info`);

--
-- Indexes for table `iuran_warga`
--
ALTER TABLE `iuran_warga`
  ADD PRIMARY KEY (`kd_iuran`);

--
-- Indexes for table `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`kd_penduduk`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indexes for table `pesan_warga`
--
ALTER TABLE `pesan_warga`
  ADD PRIMARY KEY (`kd_pesan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blok_kavling`
--
ALTER TABLE `blok_kavling`
  MODIFY `kd_blok` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `info_warga`
--
ALTER TABLE `info_warga`
  MODIFY `kd_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `iuran_warga`
--
ALTER TABLE `iuran_warga`
  MODIFY `kd_iuran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `kd_penduduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesan_warga`
--
ALTER TABLE `pesan_warga`
  MODIFY `kd_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
