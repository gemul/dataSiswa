-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 16, 2016 at 07:22 AM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bk_smk_yadika`
--
CREATE DATABASE IF NOT EXISTS 'bk_smk_yadika';
-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE IF NOT EXISTS `absensi` (
  `IdAbsensi` int(11) NOT NULL AUTO_INCREMENT,
  `TglAbsensi` date NOT NULL,
  `NIS` int(11) NOT NULL,
  `Absensi` int(11) NOT NULL,
  PRIMARY KEY (`IdAbsensi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cyNodes`
--

CREATE TABLE IF NOT EXISTS `cyNodes` (
  `nodeID` varchar(32) NOT NULL,
  `nodeName` text NOT NULL,
  `tokenString` varchar(64) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`nodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cyNodes`
--

INSERT INTO `cyNodes` (`nodeID`, `nodeName`, `tokenString`, `status`, `lastUpdate`) VALUES
('KMZWA8AWAA', 'development 1', '294ca63e71b1857c62b06dfb9da58b7a', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `homevisit`
--

CREATE TABLE IF NOT EXISTS `homevisit` (
  `IdHomeVisit` int(11) NOT NULL AUTO_INCREMENT,
  `TglVisit` date NOT NULL,
  `Pengunjung` varchar(30) NOT NULL,
  `nis` int(11) NOT NULL,
  `Bertemu` varchar(50) NOT NULL,
  `KeteranganVisit` text NOT NULL,
  PRIMARY KEY (`IdHomeVisit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `NamaKelas` varchar(20) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `NamaKelas`) VALUES
(1, 'XMM 1'),
(2, 'XMM 2'),
(3, 'XIMM 1'),
(4, 'XIMM 2'),
(7, 'tuhh'),
(8, 'bbb'),
(9, 'ccc'),
(10, 'sss');

-- --------------------------------------------------------

--
-- Table structure for table `keluarga`
--

CREATE TABLE IF NOT EXISTS `keluarga` (
  `IdKeluarga` int(6) NOT NULL AUTO_INCREMENT,
  `NamaKeluarga` varchar(40) NOT NULL,
  `AlamatKeluarga` text NOT NULL,
  `PendidikanKeluarga` varchar(8) NOT NULL,
  `Pekerjaan` text NOT NULL,
  `AlamatPekerjaan` text NOT NULL,
  `AgamaKeluarga` varchar(8) NOT NULL,
  `KelaminKeluarga` int(2) NOT NULL,
  `StatusKeluarga` int(2) NOT NULL,
  `NIS` int(11) NOT NULL,
  PRIMARY KEY (`IdKeluarga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `konseler`
--

CREATE TABLE IF NOT EXISTS `konseler` (
  `idkonseler` int(11) NOT NULL AUTO_INCREMENT,
  `NamaKonseler` varchar(25) NOT NULL,
  `NoHpKonseler` int(15) NOT NULL,
  `AlamatKonseler` text NOT NULL,
  PRIMARY KEY (`idkonseler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `konseling`
--

CREATE TABLE IF NOT EXISTS `konseling` (
  `IdKonseling` int(11) NOT NULL AUTO_INCREMENT,
  `NIS` int(11) NOT NULL,
  `WaktuKonseling` datetime NOT NULL,
  `KedatanganKonseling` varchar(30) NOT NULL,
  `DataKonseling` varchar(50) NOT NULL,
  `DataPenting` varchar(50) NOT NULL,
  `DiagnosaMasalah` text NOT NULL,
  `AlternatifPemecahan` text NOT NULL,
  `PutusanMasalah` text NOT NULL,
  `RencanaLayanan` text NOT NULL,
  `EvaluasiHasil` text NOT NULL,
  `Penanganan` text NOT NULL,
  PRIMARY KEY (`IdKonseling`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `panggilanortu`
--

CREATE TABLE IF NOT EXISTS `panggilanortu` (
  `IdPanggilanOrtu` int(11) NOT NULL AUTO_INCREMENT,
  `TglPemanggilan` date NOT NULL,
  `nis` int(11) NOT NULL,
  `Keperluan` varchar(30) NOT NULL,
  `Keterangan` text NOT NULL,
  PRIMARY KEY (`IdPanggilanOrtu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prestasi`
--

CREATE TABLE IF NOT EXISTS `prestasi` (
  `IdPrestasi` int(4) NOT NULL AUTO_INCREMENT,
  `Juara` varchar(20) NOT NULL,
  `Tingkat` varchar(15) NOT NULL,
  `Tahun` year(4) NOT NULL,
  `KeteranganPrestasi` text NOT NULL,
  PRIMARY KEY (`IdPrestasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rombel`
--

CREATE TABLE IF NOT EXISTS `rombel` (
  `id_rombel` int(5) NOT NULL AUTO_INCREMENT,
  `id_kelas` int(5) NOT NULL,
  `nis` int(11) NOT NULL,
  `idkonseler` int(11) NOT NULL,
  PRIMARY KEY (`id_rombel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
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
  `NamaSekolah_SMP_MTS` varchar(40) NOT NULL,
  PRIMARY KEY (`NIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`NIS`, `NamaSiswa`, `NamaPanggilan`, `TempatLahir`, `TglLahir`, `AlamatSiswa`, `Agama`, `CitaCita`, `NamaOrtu`, `AlamatOrtu`, `NoHpOrtu`, `TinggalBersama`, `PhotoSiswa`, `KelaminSiswa`, `TahunSekolah_SD_MI`, `NilaiNUN_SD_MI`, `NamaSekolah_SD_MI`, `TahunSekolah_SMP_MTS`, `NilaiNUN_SMP_MTS`, `NamaSekolah_SMP_MTS`) VALUES
('1122', 'sunandar bariman', 'nandar', 'malang', '2016-01-30', 'dekat malang', 'islam', 'presiden', 'bariman', 'dekat malang', 2147483647, NULL, NULL, 'Laki-laki', '2014', 99, 'sd anu anuan', '2015', 99, 'smp dekat malang'),
('1234123', 'fasrefasdf', '', 'wqerfgqawef', '2016-01-01', 'saergqas', 'dfsd', 'wrfqsdf', '', 'sefsadfsaef', 1234123, 'a', NULL, 'Laki-laki', '3122', 32, 'fsefasd', '1232', 32, 'sdfgsdfg'),
('21', 'sudrun asdf', 'drun', 'bangil', '2016-10-05', 'bangil', 'mosleem', '', '', 'gaerhgasdfa', 3322, 's', NULL, 'Laki-laki', '2010', 2000, 'SD MI', '2000', 100, 'SMP MTS'),
('33', 'aanu', 'anu', 'bb', '2016-08-03', 'aaa', 'islam', 'olahragawan', 'sutarlim', 'jakarta', 81, 'ortu', NULL, 'Perempuan', '', 0, '', '', 0, ''),
('344234', 'sfsef', '', 'sadfa', '2016-02-02', 'sdfasd', 'asd', 'swerf', '', 'asefase', 2343, 'fsd', NULL, 'Laki-laki', '4321', 32, 'sefde', '2432', 53, 'gasdref');

-- --------------------------------------------------------

--
-- Table structure for table `tahunajaran`
--

CREATE TABLE IF NOT EXISTS `tahunajaran` (
  `id_ta` int(2) NOT NULL AUTO_INCREMENT,
  `tahun` int(4) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_ta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

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

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(32) NOT NULL,
  `nohp` varchar(14) NOT NULL,
  `keterangan` varchar(23) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `email`, `nohp`, `keterangan`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'Administrator', 'admin@gmail.com', '', '-'),
(64, 'bayu', '81dc9bdb52d04dc20036dbd8313ed055', 'bayu', 'bayu@gmail.com', '0846898982323', '-'),
(65, 'gema', '912ec803b2ce49e4a541068d495ab570', 'Gema Ulama Putra', 'asdf@asdf.asdf', '123123123', '');

-- --------------------------------------------------------

--
-- Table structure for table `walikelas`
--

CREATE TABLE IF NOT EXISTS `walikelas` (
  `id_walikelas` int(11) NOT NULL AUTO_INCREMENT,
  `NamaWaliKelas` varchar(30) NOT NULL,
  `NoHPWali` varchar(15) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  PRIMARY KEY (`id_walikelas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `walikelas`
--

INSERT INTO `walikelas` (`id_walikelas`, `NamaWaliKelas`, `NoHPWali`, `id_kelas`) VALUES
(1, 'Abdul Makin S.Kom', '', 1),
(2, 'Moh Imron S.Kom', '2', 2),
(3, 'Harimawan ST', '1234', 4),
(4, 'Robianto S.Kom', '', 3),
(5, 'Andika Gugus P S.Kom', '999999999', 0),
(6, 'Sigit Riyadi', '777777777777', 0),
(7, 'venny', '66666666', 0),
(10, 'xxxx', '676', 0),
(11, 'sss', '666', 0),
(12, 'Abdul rokims', '123434', 7);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
