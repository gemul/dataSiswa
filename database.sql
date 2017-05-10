-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2017 at 04:50 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE bk_smk_yadika;
use bk_smk_yadika;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bk_smk_yadika`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `IdAbsensi` int(11) NOT NULL,
  `TglAbsensi` date NOT NULL,
  `NIS` varchar(32) NOT NULL,
  `Absensi` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`IdAbsensi`, `TglAbsensi`, `NIS`, `Absensi`) VALUES
(1, '2017-03-07', '1122', 'A'),
(2, '2017-03-08', '1122', 'S'),
(4, '2017-03-06', '21', 'S'),
(5, '2017-03-07', '21', 'A'),
(7, '2017-03-09', '1122', 'S'),
(8, '2017-03-20', '1122', 'I');

-- --------------------------------------------------------

--
-- Table structure for table `cyNodes`
--

CREATE TABLE `cyNodes` (
  `nodeID` varchar(32) NOT NULL,
  `nodeName` text NOT NULL,
  `tokenString` varchar(64) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `lastUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cyNodes`
--

INSERT INTO `cyNodes` (`nodeID`, `nodeName`, `tokenString`, `status`, `lastUpdate`) VALUES
('KMZWA8AWAA', 'development 1', '43941c3486ffa6869a70ba6057faacda', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `homevisit`
--

CREATE TABLE `homevisit` (
  `IdHomeVisit` int(11) NOT NULL,
  `TglVisit` date NOT NULL,
  `Pengunjung` varchar(30) NOT NULL,
  `nis` int(11) NOT NULL,
  `Bertemu` varchar(50) NOT NULL,
  `KeteranganVisit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `NamaKelas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `NamaKelas`) VALUES
(1, 'XMM 1'),
(2, 'XMM 2'),
(3, 'XIMM 1'),
(4, 'XIMM 2'),
(7, 'tuhh'),
(9, 'ccc'),
(10, 'sss'),
(11, 'aasdd');

-- --------------------------------------------------------

--
-- Table structure for table `keluarga`
--

CREATE TABLE `keluarga` (
  `IdKeluarga` int(6) NOT NULL,
  `NamaKeluarga` varchar(40) NOT NULL,
  `AlamatKeluarga` text NOT NULL,
  `PendidikanKeluarga` varchar(8) NOT NULL,
  `Pekerjaan` text NOT NULL,
  `AlamatPekerjaan` text NOT NULL,
  `AgamaKeluarga` varchar(8) NOT NULL,
  `KelaminKeluarga` int(2) NOT NULL,
  `StatusKeluarga` int(2) NOT NULL,
  `NIS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `konseler`
--

CREATE TABLE `konseler` (
  `idkonseler` int(11) NOT NULL,
  `NamaKonseler` varchar(25) NOT NULL,
  `NoHpKonseler` int(15) NOT NULL,
  `AlamatKonseler` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `konseler`
--

INSERT INTO `konseler` (`idkonseler`, `NamaKonseler`, `NoHpKonseler`, `AlamatKonseler`) VALUES
(1, 'Doraemon', 1231231232, 'bangil'),
(2, 'Nobita', 2342342, 'Bangil pisan'),
(3, 'Mahmudin', 421321, 'Malang');

-- --------------------------------------------------------

--
-- Table structure for table `konseling`
--

CREATE TABLE `konseling` (
  `IdKonseling` int(11) NOT NULL,
  `NIS` int(11) NOT NULL,
  `WaktuKonseling` date NOT NULL,
  `KedatanganKonseling` varchar(30) NOT NULL,
  `DataKonseling` varchar(50) NOT NULL,
  `DataPenting` varchar(50) NOT NULL,
  `DiagnosaMasalah` text NOT NULL,
  `AlternatifPemecahan` text NOT NULL,
  `PutusanMasalah` text NOT NULL,
  `RencanaLayanan` text NOT NULL,
  `EvaluasiHasil` text NOT NULL,
  `Penanganan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `konseling`
--

INSERT INTO `konseling` (`IdKonseling`, `NIS`, `WaktuKonseling`, `KedatanganKonseling`, `DataKonseling`, `DataPenting`, `DiagnosaMasalah`, `AlternatifPemecahan`, `PutusanMasalah`, `RencanaLayanan`, `EvaluasiHasil`, `Penanganan`) VALUES
(3, 1122, '2017-03-09', '1', 'aasdfasdfasdfasdfasdfasdf', 'sd', 'fasf', 'efsefa', 'ergsr', 'gsdfg', 'dfgsdf', 'sdfgdfg');

-- --------------------------------------------------------

--
-- Table structure for table `panggilanortu`
--

CREATE TABLE `panggilanortu` (
  `IdPanggilanOrtu` int(11) NOT NULL,
  `TglPemanggilan` date NOT NULL,
  `nis` int(11) NOT NULL,
  `Keperluan` varchar(30) NOT NULL,
  `Keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi`
--

CREATE TABLE `prestasi` (
  `IdPrestasi` int(4) NOT NULL,
  `Juara` varchar(20) NOT NULL,
  `Tingkat` varchar(15) NOT NULL,
  `Tahun` year(4) NOT NULL,
  `KeteranganPrestasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rombel`
--

CREATE TABLE `rombel` (
  `id_rombel` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `NIS` varchar(32) NOT NULL,
  `idkonseler` int(11) NOT NULL,
  `tahun` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rombel`
--

INSERT INTO `rombel` (`id_rombel`, `id_kelas`, `NIS`, `idkonseler`, `tahun`) VALUES
(1, 1, '1122', 0, 2017),
(8, 2, '33', 0, 2017),
(9, 1, '21', 0, 2017);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `NIS` varchar(32) NOT NULL,
  `NamaSiswa` varchar(45) DEFAULT NULL,
  `NamaPanggilan` varchar(15) NOT NULL,
  `TempatLahir` varchar(45) DEFAULT NULL,
  `TglLahir` date DEFAULT NULL,
  `AlamatSiswa` varchar(45) DEFAULT NULL,
  `Agama` varchar(45) DEFAULT NULL,
  `CitaCita` varchar(45) DEFAULT NULL,
  `NamaOrtu` varchar(64) NOT NULL,
  `AlamatOrtu` varchar(45) DEFAULT NULL,
  `NoHpOrtu` int(16) DEFAULT NULL,
  `TinggalBersama` varchar(45) DEFAULT NULL,
  `PhotoSiswa` varchar(45) DEFAULT NULL,
  `KelaminSiswa` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `TahunSekolah_SD_MI` varchar(9) NOT NULL,
  `NilaiNUN_SD_MI` float NOT NULL,
  `NamaSekolah_SD_MI` varchar(40) NOT NULL,
  `TahunSekolah_SMP_MTS` varchar(9) NOT NULL,
  `NilaiNUN_SMP_MTS` float NOT NULL,
  `NamaSekolah_SMP_MTS` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`NIS`, `NamaSiswa`, `NamaPanggilan`, `TempatLahir`, `TglLahir`, `AlamatSiswa`, `Agama`, `CitaCita`, `NamaOrtu`, `AlamatOrtu`, `NoHpOrtu`, `TinggalBersama`, `PhotoSiswa`, `KelaminSiswa`, `TahunSekolah_SD_MI`, `NilaiNUN_SD_MI`, `NamaSekolah_SD_MI`, `TahunSekolah_SMP_MTS`, `NilaiNUN_SMP_MTS`, `NamaSekolah_SMP_MTS`) VALUES
('1122', 'sunandar bariman', 'nandar', 'malang', '2016-01-30', 'dekat malang', 'islam', 'presiden', 'bariman', 'dekat malang', 2147483647, NULL, NULL, 'Laki-laki', '2014', 99, 'sd anu anuan', '2015', 99, 'smp dekat malang'),
('21', 'sudrun asdf', 'drun', 'bangil', '2016-10-05', 'bangil', 'mosleem', '', '', 'gaerhgasdfa', 3322, 's', NULL, 'Laki-laki', '2010', 2000, 'SD MI', '2000', 100, 'SMP MTS'),
('33', 'aanu', 'anu', 'bb', '2016-08-03', 'aaa', 'islam', 'olahragawan', 'sutarlim', 'jakarta', 81, 'ortu', NULL, 'Perempuan', '', 0, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tahunajaran`
--

CREATE TABLE `tahunajaran` (
  `id_ta` int(2) NOT NULL,
  `tahun` int(4) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahunajaran`
--

INSERT INTO `tahunajaran` (`id_ta`, `tahun`, `status`) VALUES
(1, 2015, 0),
(21, 2014, 0),
(22, 2013, 0),
(23, 2016, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(32) NOT NULL,
  `nohp` varchar(14) NOT NULL,
  `keterangan` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `email`, `nohp`, `keterangan`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'Administrator', 'admin@gmail.com', '', '-'),
(64, 'bayu', '81dc9bdb52d04dc20036dbd8313ed055', 'bayu', 'bayu@gmail.com', '0846898982323', '-'),
(65, 'gema', '81dc9bdb52d04dc20036dbd8313ed055', 'Gema Ulama Putra', 'asdf@asdf.asdf', '123123123', '');

-- --------------------------------------------------------

--
-- Table structure for table `walikelas`
--

CREATE TABLE `walikelas` (
  `id_walikelas` int(11) NOT NULL,
  `NamaWaliKelas` varchar(30) NOT NULL,
  `NoHPWali` varchar(15) NOT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `walikelas`
--

INSERT INTO `walikelas` (`id_walikelas`, `NamaWaliKelas`, `NoHPWali`, `id_kelas`) VALUES
(1, 'Abdul Makin S.Kom', '', 1),
(2, 'Moh Imron S.Kom', '2', 2),
(3, 'Harimawan STMJ', '1234', 4),
(4, 'Robianto S.Kom', '', 3),
(5, 'Andika Gugus P S.Kom', '999999999', 0),
(6, 'Sigit Riyadi', '777777777777', 0),
(7, 'venny', '66666666', 0),
(12, 'Abdul rokims', '123434', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`IdAbsensi`);

--
-- Indexes for table `cyNodes`
--
ALTER TABLE `cyNodes`
  ADD PRIMARY KEY (`nodeID`);

--
-- Indexes for table `homevisit`
--
ALTER TABLE `homevisit`
  ADD PRIMARY KEY (`IdHomeVisit`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`IdKeluarga`);

--
-- Indexes for table `konseler`
--
ALTER TABLE `konseler`
  ADD PRIMARY KEY (`idkonseler`);

--
-- Indexes for table `konseling`
--
ALTER TABLE `konseling`
  ADD PRIMARY KEY (`IdKonseling`);

--
-- Indexes for table `panggilanortu`
--
ALTER TABLE `panggilanortu`
  ADD PRIMARY KEY (`IdPanggilanOrtu`);

--
-- Indexes for table `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`IdPrestasi`);

--
-- Indexes for table `rombel`
--
ALTER TABLE `rombel`
  ADD PRIMARY KEY (`id_rombel`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`NIS`);

--
-- Indexes for table `tahunajaran`
--
ALTER TABLE `tahunajaran`
  ADD PRIMARY KEY (`id_ta`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `walikelas`
--
ALTER TABLE `walikelas`
  ADD PRIMARY KEY (`id_walikelas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `IdAbsensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `homevisit`
--
ALTER TABLE `homevisit`
  MODIFY `IdHomeVisit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `keluarga`
--
ALTER TABLE `keluarga`
  MODIFY `IdKeluarga` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `konseler`
--
ALTER TABLE `konseler`
  MODIFY `idkonseler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `konseling`
--
ALTER TABLE `konseling`
  MODIFY `IdKonseling` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `panggilanortu`
--
ALTER TABLE `panggilanortu`
  MODIFY `IdPanggilanOrtu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `IdPrestasi` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rombel`
--
ALTER TABLE `rombel`
  MODIFY `id_rombel` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tahunajaran`
--
ALTER TABLE `tahunajaran`
  MODIFY `id_ta` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `walikelas`
--
ALTER TABLE `walikelas`
  MODIFY `id_walikelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
