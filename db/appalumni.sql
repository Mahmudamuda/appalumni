-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2024 at 08:47 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appalumni`
--
CREATE DATABASE IF NOT EXISTS `appalumni` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `appalumni`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adat`
--

CREATE TABLE `tbl_adat` (
  `id_adat` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `ruangan` varchar(20) NOT NULL,
  `suku` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_adat`
--

INSERT INTO `tbl_adat` (`id_adat`, `id_anggota`, `tanggal_mulai`, `tanggal_selesai`, `ruangan`, `suku`) VALUES
(1, 1, '2024-02-06', '2024-02-10', '1', 'Madura'),
(2, 2, '2024-02-01', '2024-02-03', 'A', 'Jawa'),
(3, 3, '2024-02-01', '2024-02-02', '1', 'Jawa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anggota`
--

CREATE TABLE `tbl_anggota` (
  `id_anggota` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `no_kk` varchar(20) NOT NULL,
  `nama` varchar(80) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(50) NOT NULL,
  `rt` int(11) NOT NULL,
  `rw` int(11) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `status_kawin` varchar(20) NOT NULL,
  `status` varchar(25) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_anggota`
--

INSERT INTO `tbl_anggota` (`id_anggota`, `nik`, `no_kk`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `kota`, `rt`, `rw`, `agama`, `status_kawin`, `status`, `foto`) VALUES
(1, '637102040279', '6321312312320', 'Ribhan Jayyidan', 'Banjarbaru', '2000-01-01', 'L', 'JL Mangga-', 'Banjarmasin', 2, 3, 'Islam', 'Menikah', 'Ada', '6f417a68cb35526bd3e8d653267e9d06_1706879068907.jpg'),
(2, '212', '444', 'muuds', 'Buntok', '1999-09-03', 'L', 'jdjdd', 'butok', 1, 2, 'Islam', 'Menikah', 'Ada', '_MG_2049.JPG'),
(3, '1', '2', 'Mahmuda', 'buntok', '2024-02-01', 'L', 'bbb', 'buntok', 1, 2, 'Islam', 'Belum Menikah', 'Ada', 'Chrome.jfif');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bumdesa`
--

CREATE TABLE `tbl_bumdesa` (
  `id_bumdesa` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `nama_desa` varchar(50) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `jenis_usaha` varchar(50) NOT NULL,
  `jumlah_orang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_bumdesa`
--

INSERT INTO `tbl_bumdesa` (`id_bumdesa`, `id_anggota`, `nama_desa`, `tanggal_mulai`, `tanggal_selesai`, `jenis_usaha`, `jumlah_orang`) VALUES
(1, 1, 'Habirau', '2024-02-06', '2024-02-17', 'Krupuk', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hak_akses`
--

CREATE TABLE `tbl_hak_akses` (
  `id` int(11) NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hak_akses`
--

INSERT INTO `tbl_hak_akses` (`id`, `id_user_level`, `id_menu`) VALUES
(15, 1, 2),
(31, 1, 10),
(32, 1, 11),
(33, 1, 12),
(34, 1, 13),
(35, 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_main_menu` int(11) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL COMMENT 'y=yes,n=no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `title`, `url`, `icon`, `is_main_menu`, `is_aktif`) VALUES
(1, 'KELOLA MENU', 'kelolamenu', 'fa fa-server', 0, 'y'),
(2, 'KELOLA PENGGUNA', 'user', 'fa fa-user-o', 0, 'y'),
(3, 'level PENGGUNA', 'userlevel', 'fa fa-users', 0, 'y'),
(9, 'Contoh Form', 'welcome/form', 'fa fa-id-card', 0, 'y'),
(10, 'DATA ANGGOTA', 'tbl_anggota', 'fa fa-id-card', 0, 'y'),
(11, 'DATA ADAT', 'tbl_adat', 'fa fa-users', 0, 'y'),
(12, 'DATA BUMDESA', 'tbl_bumdesa', 'fa fa-google-wallet', 0, 'y'),
(13, 'DATA TRANSMIGRASI', 'tbl_transmigrasi', 'fa fa-plane', 0, 'y'),
(14, 'DATA PRUKADES', 'tbl_prukades', 'fa fa-money', 0, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prukades`
--

CREATE TABLE `tbl_prukades` (
  `id_prukades` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `nama_desa` varchar(50) NOT NULL,
  `kegiatan` varchar(50) NOT NULL,
  `jumlah_orang` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_prukades`
--

INSERT INTO `tbl_prukades` (`id_prukades`, `id_anggota`, `tanggal_mulai`, `tanggal_selesai`, `nama_desa`, `kegiatan`, `jumlah_orang`, `nama_produk`) VALUES
(1, 1, '2024-02-06', '2024-02-27', 'Habirau', 'Jualan', 2, 'Untuk'),
(2, 2, '2024-02-04', '2024-02-05', 'ab', 'cd', 4, 'ed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id_setting` int(11) NOT NULL,
  `nama_setting` varchar(50) NOT NULL,
  `value` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`id_setting`, `nama_setting`, `value`) VALUES
(1, 'Tampil Menu', 'ya');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transmigrasi`
--

CREATE TABLE `tbl_transmigrasi` (
  `id_transmigrasi` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `asal_kota` varchar(50) NOT NULL,
  `kota_tujuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transmigrasi`
--

INSERT INTO `tbl_transmigrasi` (`id_transmigrasi`, `id_anggota`, `tanggal_mulai`, `tanggal_selesai`, `asal_kota`, `kota_tujuan`) VALUES
(1, 1, '2024-02-06', '2024-02-06', 'Banjarmasin', 'Banjarbaru');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_users` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `images` text NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_users`, `full_name`, `email`, `password`, `images`, `id_user_level`, `is_aktif`) VALUES
(1, 'MAHMUDA', 'admin@gmail.com', '$2y$04$Wbyfv4xwihb..POfhxY5Y.jHOJqEFIG3dLfBYwAmnOACpH0EWCCdq', 'atomix_user31.png', 1, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_level`
--

CREATE TABLE `tbl_user_level` (
  `id_user_level` int(11) NOT NULL,
  `nama_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_level`
--

INSERT INTO `tbl_user_level` (`id_user_level`, `nama_level`) VALUES
(1, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_adat`
--
ALTER TABLE `tbl_adat`
  ADD PRIMARY KEY (`id_adat`);

--
-- Indexes for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `tbl_bumdesa`
--
ALTER TABLE `tbl_bumdesa`
  ADD PRIMARY KEY (`id_bumdesa`);

--
-- Indexes for table `tbl_hak_akses`
--
ALTER TABLE `tbl_hak_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `tbl_prukades`
--
ALTER TABLE `tbl_prukades`
  ADD PRIMARY KEY (`id_prukades`);

--
-- Indexes for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `tbl_transmigrasi`
--
ALTER TABLE `tbl_transmigrasi`
  ADD PRIMARY KEY (`id_transmigrasi`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `tbl_user_level`
--
ALTER TABLE `tbl_user_level`
  ADD PRIMARY KEY (`id_user_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_adat`
--
ALTER TABLE `tbl_adat`
  MODIFY `id_adat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_bumdesa`
--
ALTER TABLE `tbl_bumdesa`
  MODIFY `id_bumdesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_hak_akses`
--
ALTER TABLE `tbl_hak_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_prukades`
--
ALTER TABLE `tbl_prukades`
  MODIFY `id_prukades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_transmigrasi`
--
ALTER TABLE `tbl_transmigrasi`
  MODIFY `id_transmigrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_user_level`
--
ALTER TABLE `tbl_user_level`
  MODIFY `id_user_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `bppm`
--
CREATE DATABASE IF NOT EXISTS `bppm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bppm`;
--
-- Database: `bppmddtt-banjarmasin`
--
CREATE DATABASE IF NOT EXISTS `bppmddtt-banjarmasin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bppmddtt-banjarmasin`;

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `agama` enum('Buddha','Islam','Hindu','Katolik','Kristen Protestan','Khonghucu','Protestan','Kristen') NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kabupaten` varchar(255) NOT NULL,
  `provinsi` enum('Kalimantan Barat','Kalimantan Selatan','Kalimantan Utara','Kalimantan Timur','Kalimantan Tengah') NOT NULL,
  `kegiatan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`id`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `pendidikan`, `agama`, `alamat`, `kecamatan`, `kabupaten`, `provinsi`, `kegiatan_id`) VALUES
(1, 'MUHAMMAD ILHAM', 'Pria', 'Abung', '1989-10-22', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Abung', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(2, 'RUSDIANSYAH', 'Pria', 'abung', '1991-02-06', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Abung', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(3, 'DISTI YURITA', 'Wanita', 'biha nungka', '2003-03-20', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Abung', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(4, 'MALIKUR RAHMAN', 'Pria', 'abung surapati', '1994-01-21', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Abung Surapati', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(5, 'ABDURAHMAN', 'Pria', 'abung surapati', '1980-07-01', 'SD', 'Islam', 'Desa Abung Surapati', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(6, 'HIDAYATUL LASMI ', 'Wanita', 'abung surapati', '1997-09-06', 'Strata I', 'Islam', 'Desa Abung Surapati', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(7, 'LISA ERLIANI', 'Wanita', 'duhat taal', '1996-12-06', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Batang Bahalang', 'Labuan Amas Selatan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(8, 'RAHMAD HIDAYAT', 'Pria', 'batang bahalang', '1998-09-22', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Batang Bahalang ', 'Labuan Amas Selatan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(9, 'AKHYAR', 'Pria', 'belanti', '1990-09-19', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Binjai Pirua', 'Labuan Aman Utara', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(10, 'NOORBAYAH ', 'Wanita', 'binjai pirua ', '1997-03-05', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Binjai Pirua', 'Labuan Aman Utara', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(11, 'JUNAIDI J', 'Pria', 'abung wirajaya', '1987-08-18', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Hawang ', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(12, 'MILLYA SANTY ', 'Wanita', 'pulau', '1978-08-02', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Hawang', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(13, 'PATHURRAHMAN', 'Pria', 'abung wirajaya ', '1980-05-06', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Hawang', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(14, 'JAKARIA', 'Pria', 'jamil', '1981-02-10', 'lainnya', 'Islam', 'Desa Jamil ', 'Labuan Amas Selatan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(15, 'ROBI MAHPUS', 'Pria', 'jamil', '2000-02-02', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jamil', 'Labuan Amas Selatan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(16, 'MUHAMMAD RIDUAN', 'Pria', 'kahakan', '1999-05-18', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Kalibaru', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(17, 'HIFIZ ANSARI', 'Pria', 'hulu sungai tengah', '1997-05-30', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Kalibaru', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(18, 'MUHAMMAD HIDAYAT', 'Pria', 'birik', '1994-03-05', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Kalibaru ', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(19, 'MASRUDIN', 'Pria', 'limpasu', '1979-04-17', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Limpasu ', 'Limpasu ', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(20, 'MASTIKA', 'Wanita', 'limpasu', '1998-08-29', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa limpasu', 'limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(21, 'DEDE DORES', 'Pria', 'pulau kembang', '1989-04-04', 'Strata I', 'Islam', 'Desa Limpasu ', 'Limpasu ', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(22, 'ABDUL KHAIR', 'Pria', 'murung taal', '1984-08-27', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Murung Taal', 'Labuan Amas Selatan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(23, 'ABDURRAHIM', 'Pria', 'banjarmasin', '1978-05-04', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Murung Taal', 'Labuan Amas Selatan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(24, 'ABDUL RA\'UF', 'Pria', 'pauh', '1986-04-29', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Pauh', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(25, 'DEVI AYU RUSANA', 'Wanita', 'pauh', '1997-02-26', 'Strata I', 'Islam', 'Desa pauh', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(26, 'SARBANI', 'Pria', 'pauh', '1988-12-18', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Pauh', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(27, 'AHMAD SYAHRANI', 'Pria', 'pauh', '1990-01-09', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Pauh', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(28, 'SYAMSUL HILAL', 'Pria', 'tapuk telaga jaya', '1974-12-11', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Tapuk', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(29, 'KHAIRIL KARIM', 'Pria', 'haur gading', '1988-09-21', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Tapuk', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(30, 'NADIA ERYANI', 'Wanita', 'hulu sungai tengah', '2003-05-05', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Tapuk ', 'Limpasu', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 1),
(31, 'NAHARUDDIN', 'Pria', 'talabangi', '1972-12-29', 'Strata I', 'Islam', 'Desa Wonorejo', 'Satui', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(32, 'HERRY EFFENDY', 'Pria', 'barambai', '1984-04-29', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Dukuhrejo', 'Mantewe', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(33, 'ERYK INDRIA SETYAWAN', 'Pria', 'samarinda ', '1979-09-09', 'Strata I', 'Kristen Protestan', 'Desa Karang Indah', 'Angsana', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(34, 'MUHAMMAD ASPANI', 'Pria', 'kusambi', '2000-10-20', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Maju Makmur', 'Batu Licin', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(35, 'NADIRA TALLAISIA', 'Wanita', 'bogor', '1996-05-18', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Desa Maju Makmur', 'Batu Licin', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(36, 'HAIRUNNISA ', 'Wanita', 'sei danau', '1998-03-20', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Makmur Mulia', 'Satui', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(37, 'YULIANTI DWI CAHYANINGSIH', 'Wanita', 'sungai danau', '1999-07-08', 'Strata I', 'Islam', 'Desa Makmur Mulia', 'Satui', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(38, 'SURATMAN', 'Pria', 'mantewe', '1992-07-07', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Mantawakan Mulia', 'Mantewe', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(39, 'MUTHOHIR', 'Pria', 'ngawi', '1973-06-24', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Mekar Jaya', 'Angsana', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(40, 'KATIRAN', 'Pria', 'bayuwangi', '1969-06-10', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Desa Mekar Jaya', 'Angsana', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(41, 'RIRIN RIYANA ', 'Wanita', 'simpang empat ', '1991-04-06', 'Strata I', 'Islam', 'Desa Mekarsari', 'Simpang Empat', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(42, 'RAUDHATUL ZANNAH', 'Wanita', 'barabai', '1997-06-29', 'Strata I', 'Islam', 'Desa Mekarsari', 'Simpang Empat', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(43, 'MUHAMMAD ELMI', 'Pria', 'rantau panjang', '1981-07-12', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Pulau Burung', 'Simpang Empat', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(44, 'ZAINAL ABIDIN', 'Pria', 'kampung baru', '1988-04-14', 'Strata I', 'Islam', 'Desa Pulau Burung', 'Simpang Empat', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(45, 'AIRIL HAMSYAH', 'Pria', 'pulau burung', '1978-02-06', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Pulau Burung', 'Simpang Empat', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(46, 'JUNAIDI', 'Pria', 'tanggak', '1989-08-12', 'Strata I', 'Islam', 'Desa Ringkit', 'Kuranji', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(47, 'RAHMAT HIDAYAT', 'Pria', 'kotabaru', '1999-09-18', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Ringkit', 'Kuranji', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(48, 'ARIF ADI UTOMO', 'Pria', 'jember', '1978-01-24', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sari Mulya', 'Sungai Loban', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(49, 'JAINURI', 'Pria', 'batulicin ', '1977-07-08', 'Strata I', 'Islam', 'Desa Sarimulya', 'Mantewe', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(50, 'M MUHAJIRIN', 'Pria', 'wonosobo', '1974-02-22', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sarimulya', 'Mantewe', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(51, 'SUBARDI', 'Pria', 'boyolali', '1979-07-09', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Sarimulya', 'Mantewe', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(52, 'RISKI AMELIA', 'Wanita', 'pagatan', '2003-03-26', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Saring Sungai Bubu', 'Kusan Tengah', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(53, 'NUR AZIZAH YULIANI FINANDAR', 'Wanita', 'saring sei bubu', '2000-07-19', 'Strata I', 'Islam', 'Desa Saring Sungai Bubu', 'Kusan Tengah', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(54, 'DADANG SAPUTRA ', 'Pria', 'kotagajah', '1985-02-13', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sukamaju', 'Batu Licin', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(55, 'SUWARDIYONO', 'Pria', 'jember', '1978-01-12', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sukamaju', 'Batu Licin', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(56, 'SURIANI', 'Pria', 'teluk kepayang', '1992-07-12', 'Strata I', 'Islam', 'Desa Teluk Kepayang', 'Teluk Kepayang', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(57, 'AULIA RAHMAH', 'Wanita', 'teluk kepayang', '2002-06-16', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Teluk Kepayang', 'Teluk Kepayang', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(58, 'RAHMADI', 'Pria', 'kusan hulu', '1999-02-01', 'Strata I', 'Islam', 'Desa Teluk Kepayang', 'Teluk Kepayang', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(59, 'SUKMA RASYA', 'Wanita', 'kotabaru', '1993-10-25', 'Strata I', 'Islam', 'Desa Waringin Tunggal', 'Kuranji', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(60, 'Y DANANG PRAMUDITA', 'Pria', 'surakarta', '1986-03-28', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Waringin Tunggal', 'Kuranji', 'Tanah Bumbu', 'Kalimantan Selatan', 2),
(61, 'MUSTAPA', 'Pria', 'Tideng Pale', '1974-08-12', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Sekatak Buji', 'Sekatak', ' Bulungan', 'Kalimantan Utara', 3),
(64, 'AFRIANSYAH ROMADANI ', 'Pria', 'Tarakan', '1988-04-18', 'S1', 'Islam', 'Desa Sekatak Buji', 'Sekatak ', ' Bulungan', 'Kalimantan Utara', 3),
(65, 'GHAZALI RAHMAN', 'Pria', 'Antutan', '1991-06-26', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Sekatak Buji', 'Sekatak ', ' Bulungan', 'Kalimantan Utara', 3),
(66, 'SARPONO', 'Pria', 'Antal', '1985-06-07', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sekatak Buji', 'Sekatak ', ' Bulungan', 'Kalimantan Utara', 3),
(67, 'SUARDI', 'Pria', 'Tanjung Palas', '1991-10-21', 'S1', 'Islam', 'Desa Sekatak Buji', 'Sekatak', 'Bulungan', 'Kalimantan Utara', 3),
(68, 'WINARTO ', 'Pria', 'Banyuwangi', '1977-05-14', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Bumi Rahayu', 'Tanjung Selor ', ' Bulungan', 'Kalimantan Utara', 3),
(69, 'PUJIONO', 'Pria', 'Tanjung Selor', '1994-07-11', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Bumi Rahayu', 'Tanjung Selor ', 'Bulungan', 'Kalimantan Utara', 3),
(70, 'MOH. RUDIANSYAH', 'Pria', 'Samarinda', '1979-01-03', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Bumi Rahayu', 'Tanjung Selor ', 'Bulungan', 'Kalimantan Utara', 3),
(71, 'RONALDI ANDITAR', 'Pria', 'Tarakan', '1995-11-05', 'Strata I', 'Kristen', 'Jelarai', 'Tanjung Selor ', 'Bulungan', 'Kalimantan Utara', 3),
(72, 'DAMOS BETTI', 'Pria', 'Long Klawit', '1969-06-14', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Jelarai Selor', 'Tanjung Selor ', 'Bulungan', 'Kalimantan Utara', 3),
(73, 'SUMARIANI', 'Wanita', 'Jelarai Tengah', '1996-09-10', '', 'Kristen Protestan', 'Jelarai Tengah ', 'tanjung Selor', 'Bulungan', 'Kalimantan Utara', 3),
(74, 'ENDI WAGIANTORO', 'Pria', 'Pasuruan', '1980-01-28', 'Strata I', 'Islam', 'Jelarai Selor', 'Tanjung Selor ', 'Bulungan', 'Kalimantan Utara', 3),
(75, 'MUHAMMAD MUSTOFA', 'Pria', 'Pandan Sari Lor', '1979-07-24', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Silvarahayu', 'Tanjung Palas Timur', 'Bulungan', 'Kalimantan Utara', 3),
(76, 'RENSIANA MARNI DIRI', 'Wanita', 'Ruteng', '1991-09-21', 'D3', 'Katolik', 'Silvarahayu', 'Tanjung Palas Tengah', 'Bulungan', 'Kalimantan Utara', 3),
(77, 'SAIFUL', 'Pria', 'Bulungan', '1998-06-10', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Silvarahayu', 'Tanjung Palas Utara', 'Bulungan', 'Kalimantan Utara', 3),
(78, 'ABDUL ROZAQ', 'Pria', 'Panca Agung', '2000-01-28', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Panca Agung ', 'Tanjung Palas Utara', 'Bulungan', 'Kalimantan Utara', 3),
(79, 'YOSRAN EFENDI', 'Pria', 'Soppeng', '1990-04-23', 'Strata I', 'Islam', 'Ardi Mulyo ', 'Tanjung Palas Utara', 'Bulungan', 'Kalimantan Utara', 3),
(80, 'JONI PRIANTO', 'Pria', 'Karang Agung', '1994-03-28', 'Strata I', 'Islam', 'Karang Agung ', 'Tanjung Palas Utara', 'Bulungan', 'Kalimantan Utara', 3),
(81, 'MAIMUNAH', 'Wanita', 'Saronda', '1991-05-02', 'SMK', 'Islam', 'Mangkupadi', 'Tanjung Palas Timur', 'Bulungan', 'Kalimantan Utara', 3),
(82, 'LISA KARLA', 'Wanita', 'Mangkupadi', '1990-07-14', 'Strata I', 'Islam', 'Mangkupadi', 'Tanjung Palas Timur', 'Bulungan', 'Kalimantan Utara', 3),
(83, 'CAHYA PUSPITA', 'Pria', 'Mangkupadi', '1991-05-02', 'Strata I', 'Islam', 'Mangkupadi', 'Tanjung Palas Timur', 'Bulungan', 'Kalimantan Utara', 3),
(84, 'MUH. MUSLIM M', 'Wanita', 'Makasar', '1976-10-18', 'Strata I', 'Islam', 'Tanah Kuning ', 'Tanjung Palas Timur', 'Bulungan', 'Kalimantan Utara', 3),
(85, 'AGUS RAMADHAN', 'Pria', 'Tarakan', '1977-08-28', 'S1', 'Islam', 'Tanah Kuning ', 'Tanjung Palas Timur', 'Bulungan', 'Kalimantan Utara', 3),
(86, 'YUSUF', 'Pria', 'Enrekang', '1990-03-19', 'SMA/SLTA/MA/Sederajat', 'Buddha', 'Tanah Kuning ', 'Tanjung Palas Timur', 'Bulungan', 'Kalimantan Utara', 3),
(87, 'NURFADILA', 'Wanita', 'Bone-Bone', '1992-09-21', 'S1', 'Islam', 'Desa Binai', 'Tanjung Palas Timur', ' Bulungan', 'Kalimantan Utara', 3),
(88, 'WELDENNEZER', 'Pria', 'Tanjung Selor', '1992-01-21', 'S1', 'Kristen Protestan', 'Desa Binai', 'Tanjung Palas Timur', ' Bulungan', 'Kalimantan Utara', 3),
(89, 'NOVA KLARA AGATA', 'Wanita', 'Tanjung Selor', '1998-11-10', 'D3', 'Kristen Protestan', 'Desa Binai', 'Tanjung Palas Timur', ' Bulungan', 'Kalimantan Utara', 3),
(90, 'KRISMAN', 'Pria', 'Tanah Kuning', '1969-07-05', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sajau Hilir ', 'Tanjung Palas Timur', ' Bulungan', 'Kalimantan Utara', 3),
(91, 'RICKI KRISNATA', 'Pria', 'Jakarta Barat', '1985-04-14', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Sajau Hilir', 'Tanjung Palas Timur', ' Bulungan', 'Kalimantan Utara', 3),
(92, 'SITI MAISYAROH', 'Wanita', 'Banyuwangi', '1976-08-06', '-', 'Islam', 'Desa Sajau Hilir', 'Tanjung Palas Timur', ' Bulungan', 'Kalimantan Utara', 3),
(93, 'Epansyah Rulhadi', 'Pria', 'Gohong', '1981-08-20', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gohong', 'Kahayan Hilir', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(94, 'Yusriadi, DS.', 'Pria', 'Gohong', '1968-02-19', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gohong', 'Kahayan Hilir', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(97, 'Haryono', 'Pria', 'Cilacap', '1982-01-01', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gohong', 'Kahayan Hilir', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(98, 'Markurius, S.Pd.', 'Pria', 'Buntoi', '1972-03-02', 'S1', 'Kristen', 'Desa Buntoi', 'Kahayan Hilir', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(99, 'Toto Haryanto', 'Pria', 'Buntoi', '1973-09-29', 'SMP/SLTP/MTs/Sederajat', 'Kristen', 'Desa Buntoi', 'Kahayan Hilir', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(100, 'Jaraid', 'Pria', 'Buntoi', '1968-06-19', 'SMP/SLTP/MTs/Sederajat', 'Kristen', 'Desa Buntoi', 'Kahayan Hilir', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(101, 'Farida Susanti', 'Wanita', 'Palangka Raya', '1975-02-09', 'S1', 'Kristen', 'Desa Pilang', 'Jabiren Raya', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(102, 'Karyanto', 'Pria', 'Kuala Kapuas', '1972-01-13', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Pilang', 'Jabiren Raya', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(103, 'Sukma Wijaya Kusnadi', 'Pria', 'Palangka Raya', '1963-05-09', 'SMA/SLTA/MA/Sederajat', 'Katolik', 'Desa Pilang', 'Jabiren Raya', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(104, 'Wanson', 'Pria', 'Garung', '1977-05-18', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Garung', 'Jabiren Raya', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(107, 'Herie Tahau', 'Pria', 'Pulau Kaladan', '1972-10-25', 'SMP/SLTP/MTs/Sederajat', 'Kristen', 'Desa Garung', 'Jabiren Raya', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(108, 'Lindawati', 'Wanita', 'Balokun', '1980-08-07', 'SMP/SLTP/MTs/Sederajat', 'Kristen', 'Desa Garung', 'Jabiren Raya', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(109, 'Muhammad Nor', 'Pria', 'Kuala Kapuas', '1984-03-06', 'S1', 'Islam', 'Desa Pangkoh Hulu', 'Pandih Batu', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(110, 'Juriah', 'Wanita', 'Pangkoh', '1965-04-02', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Pangkoh Hulu', 'Pandih Batu', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(111, 'Hartoni', 'Pria', 'Pangkoh', '1983-08-02', 'S1', 'Islam', 'Desa Pangkoh Hulu', 'Pandih Batu', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(112, 'Basirah', 'Pria', 'Dandang', '1974-12-06', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Karya Bersama', 'Pandih Batu', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(113, 'Pirma', 'Pria', 'Pulang Pisau', '1993-09-17', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Karya Bersama', 'Pandih Batu', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(114, 'Muhammad Rizqi Rahmadhani', 'Pria', 'Saka Hanya', '1999-12-24', 'S1', 'Islam', 'Desa Karya Bersama', 'Pandih Batu', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(115, 'Budi', 'Pria', 'Cemantan', '1982-05-14', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Cemantan', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(116, 'Badiansyah', 'Pria', 'Cemantan', '1982-02-15', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Cemantan', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(117, 'Hasan', 'Pria', 'Cemantan', '1994-07-25', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Cemantan', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(118, 'Muhammad Alfian Rifani', 'Pria', 'Sei Pudak', '1994-12-27', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sei Pudak', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(119, 'Muhammad Saprian', 'Pria', 'Sei Panangah', '1975-08-05', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sei Pudak', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(120, 'Alpisah', 'Pria', 'Pudak', '1981-06-11', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Sei Pudak', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(121, 'Lindayadia, SH.', 'Wanita', 'Tumbang Empas', '1978-04-20', 'S1', 'Kristen', 'Tumbang Tarusan', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(123, 'Priskila Cristina, S.Pd.', 'Wanita', 'Tumbang Tarusan', '1994-06-28', 'S1', 'Kristen', 'Desa Tumbang Tarusan', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(124, 'Yuliana Lamasi', 'Wanita', 'Ramang', '1971-08-18', 'SMA/SLTA/MA/Sederajat', 'Katolik', 'Tumbang Tarusan', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(125, 'Bici, S.Pd.', 'Pria', 'Maliku', '1982-11-23', 'S1', 'Kristen', 'Desa Tangkahen', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(126, 'Kardie', 'Pria', 'Tangkahen', '1979-10-20', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Tangkahen', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(127, 'Congmeng', 'Pria', 'Pembaruan', '1979-09-27', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Tangkahen', 'Kahayan Kuala', 'Pulang Pisau', 'Kalimantan Tengah', 4),
(128, 'WINA ASTUTI', 'Wanita', 'Dahian Tambuk', '1996-03-23', 'D3', 'Kristen', 'Desa Petak Bahandang', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(129, 'FRENKY', 'Pria', 'Kuala Kurun', '1999-08-18', 'SMA/SLTA/MA/Sederajat', 'Hindu', 'Desa Petak Bahandang ', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(130, 'DESI RATNASARI', 'Wanita', 'Petak Bahandang', '1990-06-25', 'D3', 'Kristen', 'Desa Petak Bahandang', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(131, 'YULMIA', 'Wanita', 'Petak Bahandang', '1980-06-14', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Petak Bahandang', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(132, 'TRISIA PRONIKA', 'Wanita', 'Tanjung Riu', '1997-09-18', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Tanjung Riu', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(133, 'YENSI', 'Pria', 'Tumbang Miri', '1986-02-01', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Tanjung Riu', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(134, 'SEMITAE', 'Wanita', 'Tanjung Riu', '1988-09-05', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Tanjung Riu', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(135, 'ETI ELVITA', 'Wanita', 'Kapuas', '1994-07-28', 'D3', 'Kristen', 'Desa Teluk Nyatu ', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(136, 'RISCA DIANA APRILIA', 'Wanita', 'Palangkaraya', '1996-04-09', 'Strata I', 'Kristen', 'Desa Teluk Nyatu ', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(137, 'YANTI', 'Wanita', 'Pasangon', '1993-12-25', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Teluk Nyatu', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(138, 'KRISPINAE', 'Pria', 'Teluk Nyatu', '1987-04-14', 'S1', 'Kristen', 'Desa Teluk Nyatu', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(139, 'SRI TETI', 'Pria', 'Tumbang Lampahung', '1996-04-07', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Tumbang Lampahung', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(140, 'AFRIDA', 'Pria', 'Tumbang Mujau', '1992-04-15', 'SMP/SLTP/MTs/Sederajat', 'Kristen', 'Desa Tumbang Lampahung', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(141, 'RUSLY', 'Wanita', 'Tumbang Lampahung', '1989-05-12', 'SMP/SLTP/MTs/Sederajat', 'Kristen', 'Desa Tumbang Lampahung ', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(142, 'IRAYANTI, S.SOS', 'Wanita', 'Tumbang Lampahung', '1991-09-01', 'Strata I', 'Kristen', 'Desa Tumbang Lampahung ', 'Kurun ', 'Gunung Mas', 'Kalimantan Tengah', 5),
(143, 'LILA YULITA', 'Wanita', 'Sei Antai', '1996-03-29', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Tewang Pajangan', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(144, 'LIRA VERONICA PUSPITA SARI', 'Wanita', 'Tewang Pajangan', '1989-06-26', 'D3', 'Kristen', 'Desa Tewang Pajangan', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(145, 'WINIA RAYUNANSI', 'Wanita', 'Tewang Pajangan', '1985-10-09', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Tewang Pajangan ', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(146, 'IPI HERLINA', 'Wanita', 'Bajuh', '1985-10-09', 'SMA/SLTA/MA/Sederajat', 'Kristen', 'Desa Tewang Pajangan', 'Kurun', 'Gunung Mas', 'Kalimantan Tengah', 5),
(147, 'RAHMANSYAH', 'Pria', 'Bakungan', '1985-06-07', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Bakungan', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(148, 'RACHMAN', 'Pria', 'Samarinda', '1981-07-06', 'S1', 'Islam', 'Desa Bakungan', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(149, 'TUKIRIN', 'Pria', 'Blitar', '1971-07-01', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Bakungan', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(150, 'NORSIAH', 'Pria', 'Muara Mutai', '1972-07-24', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Loa Duri Ulu ', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(151, 'YANUARI RIDANI', 'Pria', 'Samarinda', '1997-11-21', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Loa Duri Ulu ', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(152, 'SYAHIDIN', 'Pria', 'Loa Duri', '1972-10-10', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Loa Duri Ulu', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(153, 'ABDUL KOHAR', 'Pria', 'Tasikmalaya', '1975-07-11', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Tani Bahkti', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(154, 'KHULUD FIRDAUS', 'Pria', 'Banyuwangi', '1997-02-08', 'SMK', 'Islam', 'Desa Tani Bahkti', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(155, 'SITI KAMSAH', 'Wanita', 'Loa Janan', '1996-08-22', 'SMK', 'Islam', 'Desa Tani Bahkti', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(156, 'PURWADI', 'Pria', 'Kendiri', '1971-07-18', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Purwajaya', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(157, 'EVA YUNITA', 'Wanita', 'Cianjur', '1999-06-03', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa purwajaya', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(158, 'ENDANG NYUMIATI', 'Wanita', 'Samarinda', '1988-12-11', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Purwajaya', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(159, 'MUHAMMAD TASLIM', 'Pria', 'Loa Janan', '1997-08-27', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Loa Janan', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(161, 'ABDUL KOHAR', 'Pria', 'Bone', '1975-10-28', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Tani Harapan', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(162, 'DARMIATI ISRO', 'Pria', 'Kutai', '1995-02-28', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Tani Harapan', 'Loa Janan', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(163, 'KAMALIA SP', 'Wanita', 'Bakungan', '1984-02-02', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jembayan', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(164, 'KAMALIA SP', 'Wanita', 'Bakungan', '1984-02-02', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jembayan', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Timur', 6),
(165, 'MIRWAN EDWAR', 'Pria', 'Kota Bangun', '1962-08-21', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jemabayan', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(166, 'ASRIBATHUL PUTRI', 'Wanita', 'Loa Janan', '1999-04-13', 'D3', 'Islam', 'Desa Jemabayan ', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(167, 'WINARNO', 'Pria', 'Tenggerang', '1983-09-18', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Margahayu', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(168, 'WAHYU KURNIANTO', 'Wanita', 'Kutai Kartenegara', '1999-06-08', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Margahayu', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(169, 'JARIYAH', 'Wanita', 'Kutai', '1994-09-03', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Margahayu', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(170, 'PATHURRAHMAN', 'Pria', 'Lempatan Baru', '1987-11-17', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jembayan Tengah', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(171, 'M.ALI SADIKIN', 'Pria', 'Sentuk', '1993-12-25', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jembayan Tengah', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(172, 'LAZARUS EKO ADIANTO', 'Pria', 'Banyu Wangi', '1980-04-08', 'S1', 'Islam', 'Desa Jembayan Tengah', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(173, 'TUYANAH', 'Wanita', 'Batang', '1982-01-02', 'S1', 'Islam', 'Desa Jonggon Jaya', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(174, 'JAMHUR', 'Pria', 'Jabar', '1973-09-21', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jonggon Jaya', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(175, 'HADI SUYITNO', 'Pria', 'Banyuwangi', '1974-04-21', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jonggan Jaya', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(176, 'WAHYUDI', 'Pria', 'Aceh', '1988-03-30', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jonggan Desa', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 6),
(177, 'HARNO', 'Pria', 'Temanggung', '1988-11-15', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jonggan Desa', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Timur', 6),
(178, 'JAFAR AMINUDIN', 'Pria', 'Temanggung', '1993-10-31', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Jonggan Desa', 'Loa Kulu', 'Kutai Kartanegara', 'Kalimantan Tengah', 5),
(179, 'MUNAWIR', 'Pria', 'Gunung Intan', '1991-10-22', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Intan', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(180, 'KUATNO', 'Pria', 'Ciamis', '1975-12-14', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Desa Gunung Intan', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(181, 'SRI WINARTI', 'Wanita', 'Tulung Agung', '1969-09-15', 'SD', 'Islam', 'Desa Gunung Intan ', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(182, 'EKO WAHYU WIDAYAT', 'Pria', 'Pasir', '1994-05-03', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Intan', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(183, 'MUHAMMAD RIDUANSYAH', 'Pria', 'Long Kali', '1987-11-16', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Intan', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(184, 'MISTAH', 'Wanita', 'Sinjai', '1984-02-17', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Mulia', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(185, 'SUMARNI', 'Wanita', 'Gunung Intan', '1982-02-14', 'D3', 'Islam', 'Desa Gunung Mulia ', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(186, 'AMBARWATI', 'Wanita', 'Kasungan', '1984-12-29', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Mulia', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(187, 'SOLIHAH', 'Wanita', 'Cianjur', '1974-09-18', 'SD', 'Islam', 'Desa Gunung Mulia', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(188, 'PUJIATUN', 'Wanita', 'Pacitan', '1976-05-07', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Mulia', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(189, 'LAILIL WAHYU VADILA', 'Wanita', 'Balikpapan', '1999-06-23', 'D3', 'Islam', 'Desa Gunung Makmur', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(190, 'TRIA ULFA HIDAYAH', 'Wanita', 'Gunung Makmur', '1998-09-13', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Makmur', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(191, 'DWI BUDI RISTANTO', 'Pria', 'Blora', '1975-11-07', 'S1', 'Islam', 'Desa Gunung Makmur', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(192, 'EKA MEILANI', 'Wanita', 'Pasir', '1992-05-15', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Makmur', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(193, 'TITIN KARTINI', 'Wanita', 'Kutai', '1966-01-13', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Makmur ', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(194, 'TUMISAN', 'Pria', 'Lamongan', '1965-06-03', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Desa Sumber Sari', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(195, 'MUKANI', 'Pria', 'Tulung Agung', '1967-02-17', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Desa Sumber Sari', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(196, 'WAREH ALAS KAWURI', 'Wanita', 'Pasir', '1992-07-24', 'SMA/SLTA/MA/Sederajat', 'Katolik', 'Desa Sumber Sari', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(197, 'SITI ROHAYATI', 'Wanita', 'Subang', '1990-01-12', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Desa Sumber Sari', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(198, 'HAIRUL ANAM', 'Pria', 'Lombok', '1977-11-10', 'SD', 'Islam', 'Desa Sumber Sari', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(199, 'PUTHUT SUBAGYO', 'Pria', 'Ngawi', '1970-02-20', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Babulu Darat', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(200, 'INDAH PUJI ASTUTI, SE', 'Wanita', 'Babulu Darat', '1984-04-02', 'S1', 'Islam', 'Desa Babulu Darat', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(201, 'RIA YURISTIANA DEWI', 'Wanita', 'Babulu Darat', '1994-09-29', 'D3', 'Islam', 'Desa Babulu Darat', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(202, 'JULIATI', 'Wanita', 'Babulu Darat', '1987-07-08', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Babulu Darat', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(203, 'JUMIATI', 'Wanita', 'Gunung Tabrak', '1974-04-04', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Babulu Darat', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(204, 'WIJI LESTARI HANDAYANI', 'Wanita', 'Banyuwangi', '1973-11-10', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(205, 'DINA DITA WATI', 'Wanita', 'Rintik', '1997-05-22', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(206, 'SURYANI', 'Wanita', 'Sekiet', '1996-02-06', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(207, 'JUMRIANI', 'Wanita', 'Sekiet', '1988-05-07', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(208, 'PINGKI DWI LESTARI', 'Wanita', 'Banyuwani', '1996-09-05', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 7),
(209, 'JUNI PUTRA', 'Pria', 'Melak', '1987-06-28', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sumber Sari', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(210, 'TANJUNG SAPTO AJI', 'Pria', 'Banjarmasin', '1987-07-24', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Sumber Sari', 'Kutai Barat', 'Barong Tongkok', 'Kalimantan Timur', 8),
(211, 'MATIUS SURYANTHO', 'Pria', 'Sumber Sari', '1988-09-06', 'Stara I', 'Kristen Protestan', 'Desa Sumber Sari', 'Kutai Barat', 'Barong Tongkok', 'Kalimantan Timur', 8),
(212, 'SLAMET RIYANTO', 'Pria', 'Sumber Sari', '1982-05-15', '-', 'Islam', 'Desa Sumber Sari', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(213, 'FX. SUDIRO, SKM', 'Pria', 'Geleo Baru', '1958-05-15', 'Stara I', 'Katolik', 'Desa Geleo Baru', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(214, 'TUSIN', 'Pria', 'Geleo Baru', '1970-03-05', 'SMK', 'Katolik', 'Desa Geleo Baru', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(215, 'ROBI, SE', 'Pria', 'Geleo Baru', '1982-10-18', '-', 'Katolik', 'Desa Geleo Baru', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(216, 'OMOSUGIANTO', 'Pria', 'Geleo Asa', '1968-12-12', '', 'Kristen', 'Desa Geleo Asa', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(217, 'ROBENI', 'Pria', 'Geleo Asa', '1987-03-21', 'SMK', 'Kristen', 'Desa Geleo Asa', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(218, 'NINGIR', 'Pria', 'Geleo Asa', '1990-03-07', 'SMA', 'Kristen', 'Desa Geleo Asa', 'Kutai Barat', 'Barong Tongkok', 'Kalimantan Timur', 8),
(219, 'DWI RATMI', 'Wanita', 'Purwodadi', '1991-07-10', 'D3', 'Kristen', 'Desa Juaq Asa', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(220, 'ADRIANA LITAK', 'Wanita', 'Tondok Bakarau', '1972-12-22', 'SMA', 'Kristen', 'Desa Juaq Asa', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(221, 'RITAWATI', 'Wanita', 'Tondok Bakarau', '1985-02-22', 'Strata I', 'Kristen', 'Desa Juaq Asa', 'Barong Tongkok', 'Kutai Barat', 'Kalimantan Timur', 8),
(222, 'HAPPY DAMAYANTI', 'Wanita', 'Samarinda', '1976-09-05', 'SMA', 'Kristen', 'Desa Linggang Bigung', 'Linggang Bigung', 'Kutai Barat', 'Kalimantan Timur', 8),
(223, 'MEGA ANGGRESA SEPTIANI, SE', 'Wanita', 'Linggang Bigung', '1990-09-23', 'Strata I', 'Kristen Protestan', 'Desa Linggang Bigung', 'Linggang Bigung', 'Kutai Barat', 'Kalimantan Timur', 8),
(224, 'FADLI ROHADI/SANTI ROSITA', 'Pria', 'DKI Jakarta', '1983-08-25', 'STM', 'Islam', 'Desa Linggang Bigung', 'Linggang Bigung', 'Kutai Barat', 'Kalimantan Timur', 8),
(225, 'RAIZA SANJAYA, SE', 'Pria', 'Linggang Bigung', '1988-06-14', 'Strata I', 'Islam', 'Desa Linggang Bigung', 'Linggang Bigung', 'Kutai Barat', 'Kalimantan Timur', 8),
(226, 'H. KUSMAN', 'Pria', 'Damai', '1970-01-12', 'SLTA', 'Islam', 'Desa Sumber Bangun', 'Sekolaq Darat', 'Kutai Barat', 'Kalimantan Timur', 8),
(227, 'NURLI ADELAN, S.Pd', 'Pria', 'Samarinda', '1976-11-13', 'Strata I', 'Islam', 'Desa Sumber Bangun', 'Sekolaq Darat', 'Kutai Barat', 'Kalimantan Timur', 8),
(228, 'SALEHAH', 'Wanita', 'Sumber Bangun', '2000-08-10', '-', 'Islam', 'Desa Sumber Bangun', 'Sekolaq Darat', 'Kutai Barat', 'Kalimantan Timur', 8),
(229, 'YOSEP FLORES BANANG', 'Pria', 'Balok Asa', '1969-06-29', 'SMA/SLTA/MA/Sederajat', 'Katolik', 'Desa Sekolaq Joleq', 'Sekolaq Darat', 'Kutai Barat', 'Kalimantan Timur', 8),
(230, 'ERTI', 'Wanita', 'Sekolaq Joleq', '1991-01-09', 'SLTA', 'Katolik', 'Desa Sekolaq Joleq', 'Sekolaq Darat', 'Kutai Barat', 'Kalimantan Timur', 8),
(231, 'ADE TUMARA', 'Pria', 'Sekolaq Joleq', '1987-04-06', 'SMA/SLTA/MA/Sederajat', 'Katolik', 'Desa Sekolaq Joleq', 'Sekolaq Darat', 'Kutai Barat', 'Kalimantan Timur', 8),
(232, 'PRENGKI', 'Pria', 'Sekolaq Joleq', '1988-02-04', '-', 'Katolik', 'Desa Sekolaq Joleq', 'Sekolaq Darat', 'Kutai Barat', 'Kalimantan Timur', 8),
(233, 'ROBBY MALINDO', 'Pria', 'Samarinda', '1985-02-02', '-', 'Islam', 'Desa Pulau Lanting', 'Jempang', 'Kutai Barat', 'Kalimantan Timur', 8),
(234, 'MUHAMMAD NASIR', 'Pria', 'Muara Ohong', '1970-12-21', '-', 'Islam', 'Desa Pulau Lanting', 'Jempang', 'Kutai Barat', 'Kalimantan Timur', 8),
(235, 'ALPIAN NUR, HS', 'Pria', 'Pulau Lanting', '1991-02-06', '-', 'Islam', 'Desa Pulau Lanting', 'Jempang', 'Kutai Barat', 'Kalimantan Timur', 8),
(236, 'ROI MARTIN, S.Pd', 'Pria', 'Penawai', '1992-05-02', 'Stara I', 'Islam', 'Desa Penawai', 'Bongan', 'Kutai Barat', 'Kalimantan Timur', 8),
(237, 'MARIANI', 'Wanita', 'Pulau Lanting1', '2001-05-15', 'SMK', 'Islam', 'Desa Penawai', 'Bongan', 'Kutai Barat', 'Kalimantan Timur', 8),
(238, 'ERLANGGA', 'Pria', 'Penawai', '1995-09-18', 'SMA', 'Islam', 'Desa Penawai', 'Bongan', 'Kutai Barat', 'Kalimantan Timur', 8),
(239, 'MUNAWIR', 'Pria', 'Gunung Intan', '1991-10-22', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Gunung Intan', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(240, 'KUATNO', 'Pria', 'Ciamis', '1975-12-14', 'SMP', 'Islam', 'Desa Gunung Intan', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(241, 'SRI WINARTI', 'Wanita', 'Tulung Agung', '1969-09-15', 'SD', 'Islam', 'Desa Gunung Intan', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(242, 'EKO WAHYU WIDAYAT', 'Pria', 'Pasir', '1994-05-03', 'SMA', 'Islam', 'Desa Gunung Intan', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(243, 'MUHAMMAD RIDUANSYAH', 'Pria', 'Long Kali', '1987-11-16', 'SMA', 'Islam', 'Desa Gunung Intan', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(244, 'MISTAH', 'Wanita', 'Sinjai', '1984-02-17', 'SLTA/Sederajat', 'Islam', 'Desa Gunung Mulia', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(245, 'SUMARNI', 'Wanita', 'Gunung Intan', '1982-02-14', 'D3', 'Islam', 'Desa Gunung Mulia ', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(246, 'AMBARWATI', 'Wanita', 'Kasungan', '1984-09-29', 'SLTA/Sederajat', 'Islam', 'Desa Gunung Mulia ', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(247, 'SOLIHAH', 'Wanita', 'Cianjur', '1974-09-18', 'TAMAT SD/SEDERAJAT', 'Islam', 'Desa Gunung Mulia', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(248, 'PUJIATUN', 'Wanita', 'Pacitan', '1976-05-07', 'SLTA/', 'Islam', 'Desa Gunung Mulia', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(249, 'LAILIL WAHYU VADILA', 'Wanita', 'Balikpapan', '1999-06-23', 'D3', 'Islam', 'Desa Gunung Makmur', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(250, 'TRIA ULFA HIDAYAH', 'Wanita', 'Gunung Makmur', '1998-09-13', 'SMA', 'Islam', 'Desa Gunung Makmur', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(251, 'DWI BUDI RISTANTO', 'Pria', 'Blora', '1975-11-07', 'S1', 'Islam', 'Desa Gunung Makmur', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(252, 'EKA MEILANI', 'Wanita', 'Pasir', '1992-05-15', 'SMA', 'Islam', 'Desa Gunung Makmur', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(253, 'TITIN KARTINI', 'Wanita', 'Kutai', '1966-01-13', 'SPP SPMA', 'Islam', 'Desa Gunung Makmur', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(254, 'TUMISAN', 'Pria', 'Lamongan', '1965-06-03', 'SLTP', 'Islam', 'Desa Sumber Sari', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(255, 'MUKANI', 'Pria', 'Tulung Agung', '1967-02-17', 'SLTP', 'Islam', 'Desa Sumber Sari ', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(256, 'WAREH ALAS KAWURI', 'Wanita', 'Pasir', '1992-07-24', 'SLTA', 'Katolik', 'Desa Sumber Sari', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(257, 'SITI ROHAYATI', 'Wanita', 'Subang', '1990-01-12', 'SLTP', 'Islam', 'Desa Sumber Sari', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(258, 'HAIRUL ANAM', 'Pria', 'Lombok', '1977-11-10', 'SD', 'Islam', 'Desa Sumber Sari', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(259, 'PUTHUT SUBAGYO', 'Pria', 'Ngawi', '1970-02-20', 'SLTA', 'Islam', 'Desa Babulu Darat', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(260, 'INDAH PUJI ASTUTI, SE', 'Wanita', 'Babulu Darat', '1984-04-02', 'S1', 'Islam', 'Desa Babulu Darat', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(261, 'RIA YURISTIANA DEWI', 'Wanita', 'Babulu Darat', '1994-09-29', 'D3', 'Islam', 'Desa Babulu Darat', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(262, 'JULIATI', 'Wanita', 'Babulu Darat', '1987-07-08', 'SLTA', 'Islam', 'Desa Babulu Darat ', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(263, 'JUMIATI', 'Wanita', 'Gunung Tabrak', '1974-04-04', 'SLTA', 'Islam', 'Desa Babulu Darat', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(264, 'WIJI LESTARI HANDAYANI', 'Wanita', 'Banyuwangi', '1973-11-10', 'SLTA', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(265, 'DINA DITA WATI', 'Wanita', 'Rintik', '1997-05-22', 'SLTA', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(266, 'SURYANI', 'Wanita', 'Sekiet', '1996-05-07', 'SLTA', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(267, 'JUMRIANI', 'Wanita', 'Sekiet', '1988-05-07', 'SLTA', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(268, 'PINGKI DWI LESTARI', 'Wanita', 'Banyuwangi', '1996-09-05', 'SLTA', 'Islam', 'Desa Rintik', 'Babulu', 'Penajam Paser Utara', 'Kalimantan Timur', 9),
(269, 'SITI ARPIAH', 'Wanita', 'Kotabaru', '2003-04-27', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Pembelacanan', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(270, 'JUMAISIH', 'Wanita', 'Pembelacanan', '1980-02-19', 'S1', 'Islam', 'Pembelacanan', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(271, 'MUHAMMAD AL AMIN', 'Pria', 'Pembelacanan', '2002-05-11', 'SMK', 'Islam', 'Desa Pembelacanan', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(272, 'HIDAYATUN NADIYA', 'Wanita', 'Lamongan', '2000-10-05', 'SMA', 'Islam', 'Desa Bumi Asih', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(273, 'MEYDITA NORMAULINDA', 'Wanita', 'Kotabaru', '2002-05-21', 'SMA', 'Islam', 'Desa Bumi Asih', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(274, 'YUANNISA NADEA', 'Wanita', 'kandangan', '2000-03-05', 'SMA', 'Islam', 'Desa Bumi Asih', 'Kelumpang Selatan ', 'Kota Baru', 'Kalimantan Selatan', 10),
(275, 'SENIWATI', 'Wanita', 'Kota baru', '1983-02-15', 'SMP', 'Islam', 'Desa Pantai Baru', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(276, 'SITI KHODIJAH', 'Wanita', 'kota baru', '2002-07-15', 'SMK', 'Islam', 'Desa Pantai Baru', 'Kelumpang Selatan ', 'Kota baru', 'Kalimantan Selatan', 10),
(277, 'SULISTYANINGSIH', 'Wanita', 'Blora', '1983-11-07', 'SMP', 'Islam', 'Desa Pantai Baru', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(278, 'REKEN WIHARTO', 'Pria', 'Kota baru', '1994-03-08', 'SMA', 'Islam', 'Desa Sukamaju', 'Kelumpang Selatan', 'KotaBaru', 'Kalimantan Selatan', 10),
(279, 'SRIYANA', 'Wanita', 'kebumen', '1992-07-09', 'S1', 'Islam', 'Desa Sukamaju', 'Kelumpang Selatan ', 'Kota Baru', 'Kalimantan Selatan', 10),
(280, 'KHUSNUL WAHIDAH', 'Wanita', 'Demak', '1984-02-16', 'SMP', 'Islam', 'Desa Sukamaju', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(281, 'ASHFA MAZAYA', 'Wanita', 'Pantai', '2002-04-26', 'SMA', 'Islam', 'Desa Pantai', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(282, 'MUHAMMAD FIJAY NASUHA', 'Pria', 'Sang-sang', '2000-02-12', 'SMA', 'Islam', 'Desa Pantai', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(283, 'MISLAWATI', 'Wanita', 'Desa Pantai', '1989-02-10', 'SMA', 'Islam', 'Desa Pantai', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(284, 'WINARTO', 'Pria', 'Lamongan', '1982-07-09', 'SMP', 'Islam', 'Desa Sungai Kupang Jaya', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(285, 'YESI YULIANTI', 'Wanita', 'Kota Baru', '1995-01-01', 'SMA', 'Islam', 'Desa Sungai Kupang Jaya', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(286, 'SITI AISYAH', 'Wanita', 'kota baru', '2001-06-28', 'SMA', 'Islam', 'Desa Sungai Kupang Jaya', 'Kelumpang Selatan', 'Kota Baru', 'Kalimantan Selatan', 10),
(287, 'ERMA DAMAYANTI', 'Wanita', 'kota baru2003', '2003-08-05', 'SMA', 'Islam', 'Desa Sangking Baru', 'Kelumpang Selatan', 'Kota baru', 'Kalimantan Selatan', 10),
(288, 'SRI RAHAYU', 'Wanita', 'kota baru', '2002-01-18', 'SMA', 'Islam', 'Desa Sangking Baru', 'Kelumpang Selatan', 'Kota baru', 'Kalimantan Selatan', 10),
(294, 'FITRI NURHANA', 'Wanita', 'kota baru', '2002-12-10', 'SMA', 'Islam', 'Desa Sangking Baru', 'Kelumpang Selatan', 'Kota baru', 'Kalimantan Selatan', 10),
(295, 'ADE TIYA RUKMANA', 'Wanita', 'kota baru', '1995-11-24', 'SMA', 'Islam', 'Desa Sungai Nipah ', 'Kelumpang selatan', 'kota baru', 'Kalimantan Selatan', 10),
(296, 'TITI HANDAYANI', 'Wanita', 'kota baru', '2000-10-10', 'SMA', 'Islam', 'Desa Sungai Nipah', 'Kelumpang Selatan', 'Kota baru', 'Kalimantan Selatan', 10),
(297, 'JAMILAH', 'Wanita', 'Banjarmasin', '1980-06-13', 'S1', 'Islam', 'Desa Sungai Nipah', 'Kelumpang Selatan', 'Kota baru', 'Kalimantan Selatan', 10),
(298, 'MUHAMMAD ISMAIL', 'Pria', 'Tanjung Pangga', '2000-06-13', 'SMA', 'Islam', 'Desa Tanjung Pangga', 'Kelumpang Selatan', 'kota baru', 'Kalimantan Selatan', 10),
(299, 'TAUPIK HIDAYAT', 'Pria', 'Tanjung Pangga', '2001-02-15', 'SMA', 'Islam', 'Desa Tanjung Pangga', 'Kelumpang Selatan', 'kota baru', 'Kalimantan Selatan', 10),
(300, 'RAPIAH', 'Wanita', 'Tanjung Pangga', '1985-01-08', 'SMP', 'Islam', 'Desa Tanjung Pangga', 'Kelumpang Selatan', 'Kota baru', 'Kalimantan Selatan', 10),
(301, 'MUHRIANOR', 'Pria', 'pantai', '1980-11-05', 'SMA', 'Islam', 'Desa Pulau Panci', 'Kelumpang Hilir', 'kota baru', 'Kalimantan Selatan', 10),
(302, 'ANUR RAMADHANI', 'Pria', 'kota baru', '1997-01-10', 'SMK', 'Islam', 'Desa Pulau Panci', 'Kelumpang Hilir', 'Kota baru', 'Kalimantan Selatan', 10),
(303, 'DICKY AULIA PRATAMA', 'Pria', 'Pulau Panci', '2001-09-22', 'SMA', 'Islam', 'Desa Pulau Panci', 'Kelumpang Hilir', 'Kota baru', 'Kalimantan Selatan', 10),
(304, 'AYU LESTARI', 'Wanita', 'Dadahup', '1993-04-20', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(305, 'TAUFIK ANGGARA', 'Pria', 'Banjarmasin', '1985-05-05', 'SMA', 'Islam', 'Desa Menteng', 'Jekan Raya ', 'Kota Palangkaraya', 'Kalimantan Tengah', 11),
(306, 'SURIANI', 'Wanita', 'Palingkau Baru', '1978-06-29', 'SLTP', 'Islam', 'Desa Palingkau Baru', 'Kapuas Murung', 'Kapuas', 'Kalimantan Tengah', 11),
(307, 'SANDRIANTO', 'Wanita', 'Dadahup', '1986-05-24', 'S1', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(308, 'ELVIRA PRAYOGI', 'Pria', 'Kapuas', '2001-01-26', 'SMP', 'Islam', 'Desa Warga Mulya', 'Mentangai', 'Kapuas', 'Kalimantan Tengah', 11),
(309, 'AHMAD AYANI', 'Pria', 'Mantangai', '1999-02-21', 'SLTP', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(310, 'ELNI', 'Wanita', 'Dadahup', '1976-04-23', 'SMA', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(311, 'SOLIHIN', 'Pria', 'Dadahup', '1977-03-20', '-', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(312, 'DUDIN', 'Pria', 'Dadahup', '1979-02-03', '-', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(313, 'AMROLAH', 'Pria', 'Dadahup', '1994-09-15', '-', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(314, 'HERMANTO T.R', 'Pria', 'Dadahup', '1982-01-28', '-', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(315, 'SUKARMANTO', 'Pria', 'Anjir Pulang Pisau', '1982-08-28', '-', 'Kristen', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(316, 'M PAY FITRIANSYAH', 'Pria', 'Dadahup', '1996-02-10', 'SMA', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(317, 'NGETRIANTO', 'Pria', 'Dadahup', '1984-06-24', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(318, 'ALEX AL BARU', 'Pria', 'Dadahup', '1984-01-01', '-', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(319, 'UTUK', 'Pria', 'Mantangai Hilir', '1886-04-07', 'SD', 'Islam', 'Desa Mantangai', 'Mantangai', 'Kapuas', 'Kalimantan Tengah', 11),
(320, 'RENDI M DANI', 'Pria', 'Dadahup', '1999-10-20', 'SMA', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(321, 'HENDRI SAPUTRA', 'Pria', 'Tabukan', '1997-08-02', 'SMA', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(322, 'DEDY IRAWAN', 'Pria', 'Dadahup', '1992-08-01', '-', 'Islam', 'Desa Harapan Baru', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(323, 'TRIEDI ANDRIA', 'Pria', 'Palangkaraya', '1995-02-17', 'SMP', 'Islam', 'Desa Langkai', 'Pahandut', 'Kapuas', 'Kalimantan Tengah', 11),
(324, 'DANTI', 'Pria', 'Dadahup', '1975-10-10', 'SD', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(325, 'PENGKI', 'Pria', 'Dadahup', '1994-04-10', 'SMA', 'Islam', 'Desa Dadahup', 'Dadahup', 'Kapuas', 'Kalimantan Tengah', 11),
(326, 'MUHAMMAD AUNI', 'Pria', 'Bancing ', '1984-07-01', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Paramasan Bawah', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 12),
(327, 'MUHAMMAD AINI', 'Pria', 'Martapura', '1975-04-17', 'SLTA', 'Islam', 'Desa Pesayangan Barat', 'Martapura', 'Banjar', 'Kalimantan Selatan', 12),
(328, 'REFKY RAMADHANI', 'Pria', 'Banjarmasin', '1985-06-03', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Pesayangan Barat', 'Martapura', 'Banjar', 'Kalimantan Selatan', 12),
(329, 'M. SYAFIE ABDI NORYASIN', 'Pria', 'Banjar', '1997-04-11', 'MA', 'Islam', 'Desa Pesayangan Barat', 'Martapura', 'Banjar', 'Kalimantan Selatan', 12),
(330, 'RUSDI', 'Pria', 'Martapura', '1997-06-02', 'Paket C', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 12),
(331, 'SARBANI', 'Pria', 'Martapura', '1979-11-04', 'MA', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Barat', 'Kalimantan Selatan', 12);
INSERT INTO `alumni` (`id`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `pendidikan`, `agama`, `alamat`, `kecamatan`, `kabupaten`, `provinsi`, `kegiatan_id`) VALUES
(332, 'DEDI ANWARI', 'Pria', 'Banjarbaru', '1999-05-23', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 12),
(333, 'HILMAH', 'Wanita', 'Martapura', '1978-06-01', 'SMK', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 12),
(334, 'HERY', 'Pria', 'Teluk Selong Ulu', '1979-04-06', 'S1', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 12),
(335, 'GUSTI ERNAWATI', 'Wanita', 'Bambangin', '1987-08-31', 'S1', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 12),
(336, 'KHAIRONI', 'Pria', 'Martapura', '1988-03-03', 'Paket C', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 12),
(337, 'H. ABDUL QADIR', 'Pria', 'Martapura', '1965-10-04', 'SLTA', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 12),
(338, 'MUHAMMAD HANAFI', 'Pria', 'Teluk Selong Ulu', '2000-07-31', 'MA', 'Islam', 'Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 12),
(339, 'AHMAD FAISAL', 'Pria', 'Martapura', '1995-05-27', 'MA', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 12),
(340, 'MUHAMMAD NAJIR SIDDIQ', 'Pria', 'Panjaratan', '1994-08-10', 'SMK', 'Islam', 'Desa Panjaratan', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 13),
(341, 'MUHAMMAD RAJI IKHSAN, S.Pd', 'Pria', 'Tanah Laut', '1995-12-31', 'S1', 'Islam', 'Desa Panjaratan', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 13),
(342, 'ASMANI', 'Pria', 'Panjaratan', '1985-05-03', 'SD', 'Islam', 'Desa Panjaratan', 'Pelaihari', 'Tanah Bumbu', 'Kalimantan Selatan', 13),
(343, 'HALIS MURTADA', 'Pria', 'Panjaratan', '1992-07-01', 'SD', 'Islam', 'Desa Panjaratan', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 13),
(344, 'BAHRUDINNOR', 'Pria', 'Kurau', '1976-07-25', 'SLTA/Sederajat', 'Islam', 'Desa Sungai Bakar', 'Bajuin', 'Tanah Laut', 'Kalimantan Selatan', 13),
(345, 'HANAFI RATMI, A.Md', 'Wanita', 'Sungai Bakar', '1996-09-21', 'D3', 'Islam', 'Desa Sungai Bakar', 'Bajuin', 'Tanah Laut', 'Kalimantan Selatan', 13),
(346, 'HALILURRAHMAN', 'Pria', 'Kandangan Lama', '1977-03-10', 'SLTP', 'Islam', 'Desa Kandangan Lama', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(347, 'H. ROSMANI', 'Pria', 'Kandangan Lama', '1982-07-03', 'SMA', 'Islam', 'Desa Kandangan Lama', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(348, 'ISMAIL MARZUKI, S.Pd.SD', 'Pria', 'Kandangan Lama', '1988-07-01', 'S1', 'Islam', 'Kandangan Lama', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(349, 'MAULANA', 'Pria', 'Kandangan Lama', '1987-09-15', 'SNAKMA', 'Islam', 'Desa Kandangan Lama', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(351, 'JAMUNI', 'Pria', 'Tanjung Dewa', '1972-09-03', 'SLTA', 'Islam', 'Desa Tanjung Dewa', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(352, 'HARIS RIFANI', 'Pria', 'Banjarmasin', '1991-08-27', 'SLTA', 'Islam', 'Desa Tanjung Dewa', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(353, 'JUBAIDI', 'Pria', 'Tanjung Dewa', '1995-01-05', 'SMK', 'Islam', 'Desa Tanjung Dewa', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(354, 'MUHAMMAD PADLAN', 'Pria', 'Batakan', '1988-06-23', 'MAN', 'Islam', 'Desa Batakan', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(355, 'RAHMADI', 'Pria', 'Batakan', '1988-07-01', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Batakan', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(356, 'MANA, S.Pd', 'Pria', 'Batakan', '1991-07-02', 'S1', 'Islam', 'Desa Batakan', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 13),
(357, 'ISNA, S.Pd', 'Wanita', 'Wake', '1984-12-16', 'S1', 'Islam', 'Desa Haliau', 'Batu Benawa', 'Hulu Sungai', 'Kalimantan Selatan', 13),
(358, 'M. HASBI', 'Pria', 'Haliau', '1982-07-29', 'SMP', 'Islam', 'Desa Haliau', 'Batu Benawa', 'Hulu Sungai', 'Kalimantan Selatan', 13),
(359, 'RAHMADI', 'Pria', 'Murung A', '1983-03-17', 'SMA', 'Islam', 'Desa Murung A', 'Batu Benawa', 'Hulu Sungai', 'Kalimantan Selatan', 13),
(360, 'MUHAMMAD ARSYAD', 'Pria', 'Murung A', '1980-02-07', 'SMK', 'Islam', 'Desa Murung A', 'Batu Benawa', 'Hulu Sungai', 'Kalimantan Selatan', 13),
(361, 'MUHAMMAD ARSYAD', 'Pria', 'Baru', '1972-04-13', 'SMEA', 'Islam', 'Desa Baru', 'Batu Benawa', 'Hulu Sungai', 'Kalimantan Selatan', 13),
(362, 'HADIJAH, SI.Pust', 'Wanita', 'Baru', '1990-03-17', 'S1', 'Islam', 'Desa Baru', 'Batu Benawa', 'Hulu Sungai', 'Kalimantan Selatan', 13),
(363, 'HIJRIANUR,S.Pd', 'Pria', 'Barabai', '1986-03-06', 'S1', 'Islam', 'Desa Alat', 'Hantakan', 'Hulu Sungai', 'Kalimantan Selatan', 13),
(364, 'SYAIFUL RAHMAN', 'Pria', 'Alat', '1976-11-16', 'Paket C', 'Islam', 'Desa Alat', 'Hantakan', 'Hulu Sungai', 'Kalimantan Selatan', 13),
(365, 'FIQRIANSYAH', 'Pria', 'Alat', '1999-12-07', 'SMA', 'Islam', 'Desa Alat', 'Hantakan', 'Hulu Sungai', 'Kalimantan Selatan', 13),
(371, 'NURIN SYAWALIYAH', 'Wanita', 'Handil Barabai', '1997-03-23', 'SMA', 'Islam', 'Desa Handil Barabai', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(372, 'NORSIPA', 'Wanita', 'Batola', '1999-10-27', 'SMA', 'Islam', 'Desa Handil Barabai', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(373, 'SITI ARBAYAH', 'Wanita', 'Handil Barabai', '1996-05-30', 'SMA', 'Islam', 'Desa Handil Barabai', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(374, 'FARIDAH', 'Wanita', 'Barambai', '1976-02-20', 'SLTA', 'Islam', 'Desa Karya Baru', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(375, 'MARNI', 'Wanita', 'Sungai Kali', '1997-05-05', 'SLTP', 'Islam', 'Desa Karya Baru', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(376, 'SITI HARTINAH', 'Wanita', 'Karya Tani', '1996-06-06', 'SMA', 'Islam', 'Desa Karya Tani', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(377, 'MUHAMMAD FAHRUL RAJI', 'Pria', 'Pendang', '1986-07-09', 'SMA', 'Islam', 'Desa Karya Tani', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(378, 'KHAIRATANUR, S.Pd', 'Wanita', 'Karya Tani', '1987-02-15', 'S1', 'Islam', 'Desa Karya Tani', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(379, 'MAHMUDAH', 'Wanita', 'Talaran', '1997-01-16', 'SMA', 'Islam', 'Desa Karya Tani', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(380, 'AINI', 'Pria', 'Barambai', '2000-12-22', 'MAN', 'Islam', 'Desa Pendalaman', 'Barambai', 'Barito Kuala', 'Kalimantan Selatan', 14),
(381, 'SYAHRUNI', 'Pria', 'Simpang Arja', '1995-05-09', 'S1', 'Islam', 'Desa Simpang Arja', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 14),
(382, 'ABDUL HAMID', 'Pria', 'Simpang Arja', '1994-05-16', 'S1', 'Islam', 'Desa Simpang Arja', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 14),
(383, 'MUHAMMAD JUNAIDI', 'Pria', 'Sungai Gampa Asahi', '1990-12-30', 'S1', 'Islam', 'Desa Sungai Gampa Asahi', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 14),
(384, 'ISHAK', 'Pria', 'Batola', '1970-04-11', 'SLTP', 'Islam', 'Desa Sungai Gampa Asahi', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 14),
(385, 'ALPUSALAM', 'Pria', 'Bahandang', '1990-05-01', 'SMA', 'Islam', 'Desa Bahandang', 'Jejangkit', 'Barito Kuala', 'Kalimantan Selatan', 14),
(386, 'AKHMAD FAUZI', 'Pria', 'Bahandang', '1998-06-21', 'SMP', 'Islam', 'Desa Bahandang', 'Jejangkit', 'Barito Kuala', 'Kalimantan Selatan', 14),
(387, 'SYAIFULLAH', 'Pria', 'Batola', '1987-08-02', 'SD', 'Islam', 'Desa Bahandang', 'Jejangkit', 'Barito Kuala', 'Kalimantan Barat', 14),
(388, 'FUJI RATNA', 'Wanita', 'Banjarmasin', '1977-02-22', 'SLTA', 'Islam', 'Desa Sungai Ramania', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 14),
(389, 'IKHSAN HABIBI', 'Pria', 'Sei Ramania', '1997-12-08', 'SMA', 'Islam', 'Desa Sei Ramania', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 14),
(390, 'SADDIKIN', 'Pria', 'Banjarmasin', '1983-04-09', 'SMK', 'Islam', 'Desa Lok Rawa', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 14),
(391, 'HAJIATNUR', 'Pria', 'Bajayau Lama', '1984-11-03', 'SLTA', 'Islam', 'Desa Bajayau Lama', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 15),
(392, 'SALAMAT', 'Pria', 'Tanjung Selor', '1999-02-27', 'S1', 'Islam', 'Desa Tanjung Selor', 'Daha Barat', 'Daha Barat', 'Kalimantan Selatan', 15),
(393, 'SRI HANDAYANI NINGSIH', 'Wanita', 'Tanjung Selor', '1998-11-10', 'SLTA', 'Islam', 'Desa Tanjung Selor', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 15),
(394, 'AHMAD MUZAKKIR', 'Pria', 'Siang Gantung', '1993-04-21', 'SLTA', 'Islam', 'Desa Siang Gantung', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 15),
(395, 'RAHMAN, S. Pd', 'Pria', 'Negara', '1993-04-16', 'S1', 'Islam', 'Desa Tambangan', 'Daha Selatan', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 15),
(396, 'VERAWATI', 'Wanita', 'Negara', '1998-09-16', 'SLTA', 'Islam', 'Desa Tambangan', 'Daha Selatan', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 15),
(397, 'JAMILAH', 'Wanita', 'Negara', '1993-10-10', 'SLTA', 'Islam', 'Desa Tambangan', 'Daha Selatan', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 15),
(398, 'MUHAMMAD ANDRI', 'Pria', 'Banua Hanyar', '1999-02-13', 'SLTA', 'Islam', 'Desa Banua Hanyar', 'Daha Selatan', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 15),
(399, 'MUZALIFAH, S. Pd', 'Wanita', 'Banua Hanyar', '1982-04-23', 'S1', 'Islam', 'Desa Banua Hanyar', 'Daha Selatan', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 15),
(400, 'KHAIRULLAH', 'Pria', 'Lok Batung', '1986-01-01', 'SD', 'Islam', 'Desa Lok Batung', 'Paringin', 'Balangan', 'Kalimantan Selatan', 15),
(401, 'PANSYAH', 'Pria', 'Lok Batung', '1983-07-02', 'SD', 'Islam', 'Desa Lok Batung', 'Paringin', 'Balangan', 'Kalimantan Selatan', 15),
(402, 'MUHAMMAD RIDAYATULLAH', 'Pria', 'Baru', '1997-12-07', 'SLTA', 'Islam', 'Desa Baru', 'Awayan', 'Balangan', 'Kalimantan Selatan', 15),
(403, 'AHMAD SAM\'ANI', 'Pria', 'Pematang', '1999-09-06', 'SLTA', 'Islam', 'Desa Baru', 'Awayan', 'Balangan', 'Kalimantan Selatan', 15),
(404, 'AHMAD RAMADANA', 'Pria', 'Awayan', '1997-01-23', 'SLTA', 'Islam', 'Desa Awayan Hilir', 'Awayan ', 'Balangan', 'Kalimantan Selatan', 15),
(405, 'AHMAD NUARI', 'Pria', 'Awayan', '1988-01-06', 'SLTA', 'Islam', 'Desa Awayan Hilir', 'Awayan ', 'Balangan', 'Kalimantan Selatan', 15),
(406, 'UMI LESTARI', 'Wanita', 'Badalungga', '1999-07-05', 'SLTA', 'Islam', 'Desa Badalungga', 'Awayan', 'Balangan', 'Kalimantan Selatan', 15),
(407, 'MUKLAH', 'Wanita', 'Badalungga', '1974-04-15', 'D1', 'Islam', 'Desa Badalungga', 'Awayan', 'Balangan', 'Kalimantan Selatan', 15),
(408, 'EKA RINA ROSIANTI', 'Wanita', 'Bayur', '1997-04-12', 'SLTA', 'Islam', 'Desa Badalungga', 'Awayan', 'Balangan', 'Kalimantan Selatan', 15),
(409, 'SALAMA', 'Pria', 'Paramasan', '1984-07-20', 'SMA/SLTA/MA/Sederajat', 'Hindu', 'Desa Paramasan Bawah', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(410, 'IPIN', 'Pria', 'Harakit', '1962-07-17', 'SLTA', 'Hindu', 'Desa Paramasan Bawah', 'Paramasan', 'Kabupaten', 'Kalimantan Selatan', 18),
(411, 'KUDIK', 'Pria', 'Paramasan', '1970-01-21', 'SMA/SLTA/MA/Sederajat', 'Hindu', 'Desa Paramasan Bawah', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(412, 'ULIANSYAH', 'Pria', 'Bancing', '1962-04-23', 'SLTA', 'Hindu', 'Desa Paramasan Bawah', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(413, 'MUHAMMAD AUNI', 'Pria', 'Bancing', '1984-07-01', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Paramasan Bawah', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(414, 'ARTA', 'Pria', 'Paramasan', '1997-10-27', 'SMK', 'Islam', 'Desa Paramasan Bawah', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(415, 'DUMAN', 'Pria', 'Banjar', '1969-01-05', 'SMA/SLTA/MA/Sederajat', 'Hindu', 'Desa Paramasan Bawah', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(416, 'ANDRI MULIANTO, S.Pd', 'Pria', 'Sei Gohong', '1983-04-23', 'S1', 'Islam', 'Desa Remo', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(417, 'YANI', 'Pria', 'Sungai Raya', '1978-04-06', 'SD', 'Islam', 'Desa Remo', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(418, 'JAMIL', 'Pria', 'Batu Batian', '1960-07-01', 'SD', 'Islam', 'Desa Remo', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(419, 'ANANG KUSASI', 'Pria', 'Batu Batian', '1957-07-29', 'SD', 'Islam', 'Desa Remo', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(420, 'HARLIANSYAH', 'Pria', 'Batu Batian', '1992-04-20', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Desa Remo', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(421, 'Pandi', 'Pria', 'Batu Batian', '1983-01-18', 'SD', 'Islam', 'Desa Remo', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(422, 'CUYANG', 'Pria', 'Paramasan Atas', '1939-07-01', 'SR', 'Hindu', 'Desa Paramasan Atas', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(423, 'ERA', 'Pria', 'Paramasan Atas', '1963-07-01', 'SD', 'Hindu', 'Desa Paramasan Atas', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(424, 'RATUL', 'Pria', 'Paramasan Atas', '2000-02-27', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Paramasan Atas', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(425, 'RANSAH', 'Pria', 'Paramasan Atas', '1972-07-01', 'SD', 'Islam', 'Desa Paramasan Atas', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(426, 'SYAMSUL BAHRI, S.Pd.I', 'Pria', 'Tumingki', '1993-12-09', 'S1', 'Islam', 'Desa Paramasan Atas', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(427, 'MUSTAR', 'Pria', 'Paramasan Atas', '1962-07-01', 'SD', 'Hindu', 'Desa Paramasan Atas', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(428, 'IHSAN', 'Pria', 'Paramasan Atas', '1974-03-19', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Paramasan Atas', 'Paramasan', 'Banjar', 'Kalimantan Selatan', 18),
(429, 'MUHAMMAD AINI', 'Pria', 'Martapura', '1975-04-17', 'SLTA', 'Islam', 'Desa Pesayangan Barat', 'Martapura', 'Banjar', 'Kalimantan Selatan', 18),
(430, 'REFKY RAMADHANI', 'Pria', 'Banjarmasin', '1985-06-03', 'SLTA', 'Islam', 'Desa Pesayangan Barat', 'Martapura', 'Banjar', 'Kalimantan Selatan', 18),
(431, 'MUHAMMAD MUKHTAR', 'Pria', 'Martapura', '1976-03-13', 'SLTA', 'Islam', 'Desa Pesayangan Barat ', 'Martapura', 'Banjar', 'Kalimantan Selatan', 18),
(432, 'M. SYAFIE ABDI NORYASIN', 'Pria', 'Banjar', '1997-04-11', 'MA', 'Islam', 'Desa Pesayangan Barat', 'Martapura', 'Banjar', 'Kalimantan Selatan', 18),
(433, 'HAFIZI', 'Pria', 'Martapura', '1990-10-10', 'SLTA', 'Islam', 'Desa Pesayangan Barat', 'Martapura', 'Banjar', 'Kalimantan Selatan', 18),
(434, 'SYAILILLAH HAIMI', 'Pria', 'Martapura', '1973-01-16', 'SLTA', 'Islam', 'Desa Pesayangan Barat', 'Martapura', 'Banjar', 'Kalimantan Selatan', 18),
(435, 'AHMAD SUPIAN', 'Pria', 'Martapura', '1987-01-31', 'SMP', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(436, 'RUSDI', 'Pria', 'Martapura', '1977-06-02', 'Paket C', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(437, 'SARBANI', 'Pria', 'Martapura', '1979-11-04', 'MA', 'Islam', 'Desa Teluk Selong', 'Martapura Barat ', 'Banjar', 'Kalimantan Selatan', 18),
(438, 'DEDI ANWARI', 'Pria', 'Banjarbaru', '1999-05-23', 'SMA', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(439, 'HASANUDDIN', 'Pria', 'Teluk Selong', '1988-12-02', 'MA', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(440, 'HARTINI', 'Wanita', 'Banjarmasin', '1972-10-09', 'SLTA', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(441, 'HILMAH', 'Wanita', 'Martapura', '1978-06-01', 'SMK', 'Islam', 'Desa Teluk Selong', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(442, 'HERY', 'Pria', 'Teluk Selong Ulu', '1979-04-06', 'S1', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(443, 'GUSTI ERNAWATI', 'Wanita', 'Bambangin', '1987-08-31', 'S1', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(444, 'KHAIRONI', 'Pria', 'Martapura', '1998-03-03', 'Paket C', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(445, 'ZAINUDDIN', 'Pria', 'Martapura', '1990-05-20', 'Paket C', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(446, 'H. ABDUL QADIR', 'Pria', 'Martapura', '1965-10-04', 'SLTA', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(447, 'MUHAMMAD HANAFI', 'Pria', 'Teluk Selong Ulu', '2000-07-31', 'MA', 'Islam', 'Desa Teluk Selong Ulu', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(448, 'AHMAD FAISAL', 'Pria', 'Martapura', '1995-05-27', 'MA', 'Islam', 'Desa Teluk Selong Ulu, RT. 003 ', 'Martapura Barat', 'Banjar', 'Kalimantan Selatan', 18),
(449, 'MUHAMMAD NAJIR SIDDIQ', 'Pria', 'Panjaratan', '1994-08-10', 'SMK', 'Islam', 'Desa Panjaratan', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 19),
(450, 'MUHAMMAD RAJI IKHSAN, S.Pd', 'Pria', 'Tanah Laut', '1995-12-31', 'S1', 'Islam', 'Desa Panjaratan', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 19),
(451, 'ASMANI', 'Pria', 'Panjaratan', '1985-05-03', 'SD', 'Islam', 'Desa Penjaratan', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 19),
(452, 'HALIS MURTADA', 'Pria', 'Panjaratan', '1992-07-01', 'SD', 'Islam', 'Desa Penjaratan', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 19),
(453, 'BAHRUDINNOR', 'Pria', 'Kurau', '1976-07-25', 'SLTA', 'Islam', 'Desa Sungai Bakar', 'Bajuin', 'Tanah Laut', 'Kalimantan Selatan', 19),
(454, 'ZULIANSYAH', 'Pria', 'Sungai Bakar', '1973-07-01', 'SD', 'Islam', 'Desa Sungai Bakar', 'Bajuin', 'Tanah Laut', 'Kalimantan Selatan', 19),
(455, 'MISRAN', 'Pria', 'Sungai Bakar', '1979-02-02', 'SD', 'Islam', 'Desa Sungai Bakar', 'Bajuin', 'Tanah Laut', 'Kalimantan Selatan', 19),
(456, 'HANAFI RATMI, A.Md', 'Wanita', 'Sungai Bakar', '1996-09-21', 'D3', 'Islam', 'Desa Sungai Bakar', 'Bajuin', 'Tanah Laut', 'Kalimantan Selatan', 19),
(457, 'HALILURRAHMAN', 'Pria', 'Kandangan Lama', '1977-03-10', 'SLTP', 'Islam', 'Desa Kandangan Lama', 'Penyipatan', 'Tanah Laut ', 'Kalimantan Selatan', 19),
(458, 'H. ROSMANI', 'Pria', 'Kandangan Lama', '1982-07-03', 'SMA', 'Islam', 'Desa kandangan Lama', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(459, 'ISMAIL MARZUKI, S.Pd.SD', 'Pria', 'Kandangan Lama', '1988-07-01', 'S1', 'Islam', 'Desa Kandangan Lama', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(460, 'MAULANA', 'Pria', 'Kandangan Lama', '1987-09-15', 'SNAKMA', 'Islam', 'Desa kandangan Lama', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(461, 'JAMUNI', 'Pria', 'Tanjung Dewa', '1972-09-03', 'SLTA', 'Islam', 'Desa Tanjung Dewa', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(462, 'HARIS RIFANI', 'Pria', 'Banjarmasin', '1991-08-27', 'SLTA', 'Islam', 'Desa Tanjung Dewa', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(463, 'FAHRURROJI MA\'RIF', 'Pria', 'Tanjung Dewa', '1981-11-04', 'SD', 'Islam', 'Desa Tanjung Dewa', 'panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(464, 'JUBAIDI', 'Pria', 'Tanjung Dewa', '1995-01-05', 'SMK', 'Islam', 'Desa Tanjung Dewa', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(465, 'MUHAMMAD PADLAN', 'Pria', 'Batakan', '1988-06-23', 'MAN', 'Islam', 'Desa Batakan', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(466, 'RAHMADI', 'Pria', 'Batakan', '1988-07-01', 'SMA', 'Islam', 'Desa Batakan', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(467, 'RAHMADI', 'Pria', 'Pelaihari', '1991-11-24', 'SMA', 'Islam', 'Desa batakan', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(468, 'MANA, S.Pd', 'Pria', 'Batakan', '1991-07-02', 'S1', 'Islam', 'Desa Batakan', 'Panyipatan', 'Tanah Laut', 'Kalimantan Selatan', 19),
(471, 'ISNA, S.Pd', 'Wanita', 'Wake', '1984-12-16', 'S1', 'Islam', 'Desa Haliau', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(472, 'ARBAIYAH, S.Pd', 'Wanita', 'Haliau', '1992-10-22', 'S1', 'Islam', 'Desa Haliau', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(473, 'M. HASBI', 'Pria', 'Haliau', '1982-07-29', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Desa Haliau', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(474, 'ARBAIN, S.Pd', 'Pria', 'Pagat', '1969-01-05', 'D3', 'Islam', 'Desa Haliau', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(475, 'RAHMADI', 'Pria', 'Murung A', '1983-03-17', 'SMA', 'Islam', 'Desa Murung A', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(476, 'MUHAMMAD FITRIADI', 'Pria', 'Karatau', '1993-03-10', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Murung A', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(477, 'ABDURRAHMAN', 'Pria', 'Bandang', '1988-08-13', 'SMA', 'Islam', 'Desa Murung A', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(478, 'MUHAMMAD ARSYAD', 'Pria', 'Murung A', '1980-02-07', 'SMK', 'Islam', 'Desa Murung A', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(479, 'MUHAMMAD ARSYAD', 'Pria', 'Baru', '1972-04-13', 'SMEA', 'Islam', 'Desa Baru', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(480, 'ADI NOROL HUDA', 'Pria', 'Baru', '1988-02-05', 'SD', 'Islam', 'Desa Baru', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(481, 'DIYAN', 'Pria', 'Palantau', '1965-11-04', 'SMP', 'Islam', 'Desa Baru', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(482, 'HADIJAH, SI.Pust', 'Wanita', 'Baru', '1990-03-17', 'S1', 'Islam', 'Desa Baru', 'Batu Benawa', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(483, 'HIJRIANUR,S.Pd', 'Pria', 'Barabai', '1986-03-06', 'S1', 'Islam', 'Desa Alat', 'Hantakan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(484, 'SYAIFUL RAHMAN', 'Pria', 'Alat', '1976-11-16', 'PAKET C', 'Islam', 'Desa Alat', 'Hantakan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(485, 'MUHAMMAD ZAINI', 'Pria', 'Alat', '2000-01-03', 'SMA', 'Islam', 'Desa Alat', 'Hantakan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(486, 'FIQRIANSYAH', 'Pria', 'Alat', '1999-12-07', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Alat', 'Hantakan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(487, 'MUHAMMAD NAFARIN, S.Pd', 'Pria', 'Rangas', '1994-10-23', 'S1', 'Islam', 'Desa Nateh', 'Batang Alai Timur', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(488, 'YAYAN HERMANSYAH', 'Pria', 'HST', '1996-06-11', 'SMA', 'Islam', 'Desa Nateh', 'Batang Alai Timur', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(489, 'MULIADI', 'Pria', 'Nateh', '1985-06-08', 'SMP', 'Islam', 'Desa Nateh', 'Batang Alai Timur', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(490, 'ABDUL SAHID', 'Pria', 'Nateh', '1988-02-03', 'SMP', 'Islam', 'Desa Nateh', 'Batang Alai Timur', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 20),
(491, 'RAMADAN', 'Pria', 'Patih Muhur Baru', '2000-12-17', 'SLTA', 'Islam', 'Desa Patih Muhur Baru', 'Anjir Muara', 'Barito Kuala', 'Kalimantan Selatan', 21),
(492, 'ANITA', 'Wanita', 'Amuntai', '1995-12-16', 'SLTA', 'Islam', 'Desa Patih Muhur Baru', 'Anjir Muara', 'Barito Kuala', 'Kalimantan Selatan', 21),
(493, 'ALFASIH', 'Pria', 'Barito kuala', '1999-01-01', 'SMP', 'Islam', 'Desa Patih Muhur Baru', 'Anjir Muara', 'Barito Kuala', 'Kalimantan Selatan', 21),
(494, 'HELDA SARI', 'Wanita', 'Jaya Baya', '2000-11-04', 'SLTA', 'Islam', 'Desa Patih Muhur Baru', 'Anjir Muara', 'Barito Kuala', 'Kalimantan Selatan', 21),
(495, 'NURIN SYAWALIYAH', 'Wanita', 'Handil Berabai', '1997-03-23', 'SMA', 'Islam', 'Desa Handil Barabai', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(496, 'NORSIPA', 'Wanita', 'Batola ', '1999-10-27', 'SMA', 'Islam', 'Desa Handil Barabai', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(497, 'SITI ARBAYAH', 'Wanita', 'Handil Barabai', '1996-09-12', 'SMA', 'Islam', 'Desa Handil Barabai', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(498, 'UMI DATI', 'Wanita', 'Handil Barabai', '1986-09-12', 'DII', 'Islam', 'Desa Handil Barabai', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(499, 'FARIDAH', 'Wanita', 'Barabai', '1976-02-20', 'SLTA', 'Islam', 'Barabai', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(500, 'HAIRIYAH', 'Wanita', 'Karya Baru', '1982-02-11', 'SMA', 'Islam', 'Desa karya Baru', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(501, 'RAMLI', 'Pria', 'Karya Baru', '1997-03-03', 'SLTA', 'Islam', 'Desa Karya Baru', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(502, 'MARNI', 'Wanita', 'Sungai Kali', '1977-05-05', 'SLTP', 'Islam', 'Desa Karya Bakti', 'Barabai', 'Barito Kuala ', 'Kalimantan Selatan', 21),
(503, 'SITI HARTINAH', 'Wanita', 'Karya Tani', '1996-06-06', 'SMA', 'Islam', 'Desa Karya Tani', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(504, 'MUHAMMAD FAHRUL RAJI', 'Pria', 'Pendang', '1986-07-09', 'SMA', 'Islam', 'Desa Karya Tani', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(505, 'KHAIRATANUR, S.Pd', 'Wanita', 'Karya Tani', '1987-02-15', 'S1', 'Islam', 'Desa Karya Tani', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(506, 'MAHMUDAH', 'Wanita', 'Talaran', '1997-01-16', 'SMA', 'Islam', 'Desa Karya Tani', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(507, 'JAINI', 'Pria', 'Barabai', '1970-09-13', 'MAN', 'Islam', 'Desa pendalaman', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(508, 'AINI', 'Wanita', 'Barabai', '2000-12-22', 'MAN', 'Islam', 'Desa Pendalaman', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(509, 'SRI KARTINI', 'Wanita', 'Barabai', '1984-06-08', 'SMA', 'Islam', 'Desa Pendalaman', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(510, 'ARKANI', 'Pria', 'Barabai', '1977-02-28', 'MTS', 'Islam', 'Desa Pendalaman', 'Barabai', 'Barito Kuala', 'Kalimantan Selatan', 21),
(511, 'HALBI KARYAMA', 'Wanita', 'Simpang Arja', '1984-10-04', 'S1 PAI', 'Islam', 'Desa Simpang Arja', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 21),
(512, 'SYAHRUNI', 'Pria', 'Simpang Arja', '1995-05-09', 'S1', 'Islam', 'Desa Simpang Arja', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 21),
(513, 'ABDUL HAMID', 'Pria', 'Simpang Arja', '1994-05-16', 'S1', 'Islam', 'Desa Simpang Arja', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 21),
(514, 'ERIYANTI', 'Wanita', 'Pendalaman', '1985-04-15', 'Paket C', 'Islam', 'Desa Simpang Arja', 'Rantau badauh', 'Barito Kuala', 'Kalimantan Selatan', 21),
(515, 'ABDULLAH', 'Pria', 'Marabahan', '1992-11-04', 'S1', 'Islam', 'Desa Sungai Gampa Asahi', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 21),
(516, 'MUHAMMAD JUNAIDI', 'Pria', 'Sungai Gampa Asahi', '1990-12-30', 'S1', 'Islam', 'Desa Sungai Gampa Asahi', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 21),
(517, 'ISHAK', 'Pria', 'Batola', '1970-04-11', 'SLTP', 'Islam', 'Desa Sungai Gampa Asahi', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 21),
(518, 'SITI RUSMUTAMMIMAH', 'Wanita', 'Barito Kuala', '1993-10-10', 'D3', 'Islam', 'Desa Sungai Gampa Asahi', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 21),
(519, 'ALPUSALAM', 'Pria', 'Bahandang', '1999-05-01', 'SMA', 'Islam', 'Desa Bahandang', 'Jejangkit', 'Barito Kuala', 'Kalimantan Selatan', 21),
(520, 'SYAHRUDIN', 'Pria', 'Bahadang', '1974-01-03', 'SD', 'Islam', 'Desa Bahadang', 'Jejangkit', 'Barito Kuala', 'Kalimantan Selatan', 21),
(521, 'AKHMAD FAUZI', 'Pria', 'Bahandang', '1988-06-21', 'SMP', 'Islam', 'Desa Bahandang', 'Jejangkit ', 'Barito Kuala', 'Kalimantan Selatan', 21),
(522, 'SYAIFULLAH', 'Pria', 'Batola', '1987-08-02', 'SD', 'Islam', 'Desa Bahandang', 'Jejangkit', 'Barito Kuala', 'Kalimantan Selatan', 21),
(523, 'RAHMAWATI', 'Wanita', 'Sei Ramania', '1984-12-07', 'SMA', 'Islam', 'Desa Sungai Ramania', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 21),
(524, 'FUJI RATNA', 'Wanita', 'Banjarmasin', '1977-02-22', 'SLTA', 'Islam', 'Desa Sungai Ramania', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 21),
(525, 'SITI MUTMAINAH', 'Wanita', 'Maduratna', '1978-07-28', 'SLTA', 'Islam', 'Desa Sungai Ramania', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 21),
(526, 'IKHSAN HABIBI', 'Pria', 'Sei Ramania', '1997-12-08', 'SMA', 'Islam', 'Desa Sungai Ramania', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 21),
(527, 'NURUL LATIFAH', 'Wanita', 'Banjarmasin', '1980-02-02', 'SMA', 'Islam', 'Desa Lok Rawa', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 21),
(528, 'RINA', 'Wanita', 'Anjir Pasar', '1985-09-29', 'SMA', 'Islam', 'Desa Lok Rawa', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 21),
(529, 'MASNAH', 'Wanita', 'Lok Rawa', '1978-07-01', 'SD', 'Islam', 'Desa Lok Rawa', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 21),
(530, 'SADDIKIN', 'Pria', 'Banjarmasin', '1983-04-09', 'SMK', 'Islam', 'Desa Lok Rawa', 'Mandastana', 'Barito Kuala', 'Kalimantan Selatan', 21),
(532, 'SYAMSUDDIN\r\n', 'Pria', 'Negara', '1976-06-26', 'SD', 'Islam', 'Desa Bajayau Lama ', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(533, 'HARMOKO', 'Pria', 'Bajayau Lama', '1985-01-01', 'SD', 'Islam', 'Desa Bajayau Lama ', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(534, 'HAJIATNUR', 'Pria', 'Bajayau Lama', '1984-11-03', 'SLTA', 'Islam', 'Desa Bajayau Lama ', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(535, 'KURNI', 'Pria', 'Bajayau Lama', '1975-05-03', 'SD', 'Islam', 'Desa Bajayau Lama', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(536, 'SALAMAT', 'Pria', 'Tanjung Selor', '1983-04-09', 'S1', 'Islam', 'Desa Tanjung Selor', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(537, 'SRI HANDAYANI NINGSIH', 'Wanita', 'Tanjung Selor', '1998-11-10', 'SLTA', 'Islam', 'Desa Tanjung Selor', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(538, 'NORIANI', 'Pria', 'Tanjung Selor', '1990-11-19', 'SLTA', 'Islam', 'Desa Tanjung Selor', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(539, 'ABDULLAH', 'Pria', 'Tanjung Selor', '1980-04-23', '-', 'Islam', 'Desa Tanjung Selor', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(540, 'MUHAMMAD ALWI', 'Pria', 'Hulu Sungai Selatan', '2000-04-05', 'SD', 'Islam', 'Desa Siang Gantung', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(541, 'HAMSAN', 'Pria', 'Siang Gantung', '1979-01-04', 'SLTA', 'Islam', 'Desa Siang Gantung', 'Daha Barat', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(542, 'AHMAD MUZAKKIR', 'Pria', 'Desa Siang Gantung', '1993-04-21', 'SLTA', 'Islam', 'Desa Siang Gantung', 'Daha Barat', 'Hulu Sungai Selatan\r\n', 'Kalimantan Selatan', 22),
(543, 'NORHASANAH', 'Wanita', 'Siang Gantung', '1986-02-06', 'SLTA', 'Islam', 'Desa Siang Gantung', 'Daha Barat\r\n', 'Hulu Sungai Selatan\r\n', 'Kalimantan Selatan', 22),
(544, 'RAHMAN, S. Pd', 'Pria', 'Negara\r\n', '1993-04-16', 'S1', 'Islam', 'Desa Tambangan, RT. 006\r\n', 'Daha Selatan\r\n', 'Hulu Sungai Selatan\r\n', 'Kalimantan Selatan', 22),
(545, 'MUHAMMAD AINI', 'Pria', 'Negara\r\n', '1971-10-24', 'SLTA', 'Islam', 'Desa Tambangan\r\n', 'Daha Selatan', 'Hulu Sungai Selatan\r\n', 'Kalimantan Selatan', 22),
(546, 'VERAWATI', 'Wanita', 'Negara\r\n', '1998-09-16', 'SLTA', 'Islam', 'Desa Tambangan', 'Daha Selatan\r\n', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 22),
(547, 'JAMILAH\r\n', 'Wanita', 'Negara\r\n', '1993-10-10', 'SLTA', 'Islam', 'Desa Tambangan\r\n', 'Daha Selatan\r\n', 'Hulu Sungai Selatan\r\n', 'Kalimantan Selatan', 22),
(548, 'MUHAMMAD ANDRI\r\n', 'Pria', 'Banua Hanyar\r\n', '1999-02-13', 'SLTA', 'Islam', 'Desa Banua Hanyar', 'Daha Selatan\r\n', 'Hulu Sungai Selatan\r\n', 'Kalimantan Selatan', 22),
(549, 'SARLAN', 'Pria', 'Negara\r\n', '1985-09-05', 'SLTA', 'Islam', 'Desa Banua Hanyar\r\n', 'Daha Selatan\r\n', 'Hulu Sungai Selatan\r\n', 'Kalimantan Selatan', 22),
(550, 'SITI MADIHA\r\n', 'Wanita', 'Banua Hanyar\r\n', '1999-10-06', 'SLTA', 'Islam', 'Desa Banua Hanyar', 'Daha Selatan\r\n\r\n', 'Hulu Sungai Selatan\r\n', 'Kalimantan Selatan', 22),
(551, 'MUZALIFAH, S. Pd\r\n', 'Wanita', 'Banua Hanyar\r\n', '1982-10-06', 'S1', 'Islam', 'Desa Banua Hanyar, RT. 001\r\n', 'Daha Selatan\r\n', 'Hulu Sungai Selatan\r\n', 'Kalimantan Selatan', 22),
(552, 'PATHURRAHMAN', 'Pria', 'Paran', '1983-01-21', 'SLTA', 'Islam', 'Desa Lok Batung', 'Paringin', 'Balangan', 'Kalimantan Selatan', 22),
(553, 'KHAIRULLAH', 'Pria', 'Lok Batung', '1986-01-01', 'SD', 'Islam', 'Desa Lok Batung', 'Paringin', 'Balangan', 'Kalimantan Selatan', 22),
(554, 'PANSYAH', 'Pria', 'Lok Batung', '1983-07-02', 'SD', 'Islam', 'Desa Lok Batung', 'Paringin', 'Balangan', 'Kalimantan Selatan', 22),
(555, 'ABDUL WAHAB', 'Pria', 'Banjarmasin', '1981-09-21', 'SD', 'Islam', 'Desa Lok Batung', 'Paringin', 'Balangan', 'Kalimantan Selatan', 22),
(556, 'AHMAD SHAFWAN', 'Pria', 'Awayan', '2001-11-23', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Baru', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(557, 'MUHAMMAD RIDAYATULLAH', 'Pria', 'Baru', '1997-12-07', 'SLTA', 'Islam', 'Desa Baru', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(558, 'AHMAD SAM\'ANI', 'Pria', 'Pematang', '1999-09-06', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Baru', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(559, 'M. NAWAWI', 'Pria', 'Banua Hanyar', '1999-05-01', 'SLTA', 'Islam', 'Desa Baru', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(560, 'MUHAMMAD ZAINI HANIN', 'Pria', 'Awayan', '1999-07-22', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Awayan Hilir', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(561, 'AHMAD RAMADANA', 'Pria', 'Awayan', '1997-01-23', 'SLTA', 'Islam', 'Desa Awayan Hilir', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(562, 'M. YUSUP', 'Pria', 'Pauh', '1976-07-16', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Awayan Hilir', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(563, 'AHMAD NUARI', 'Pria', 'Awayan', '1988-01-06', 'SLTA', 'Islam', 'Desa Awayan Hilir', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(564, 'ALFIAN ANWARI', 'Pria', 'Baruh Bahinu Dalam', '1993-09-26', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Murung Abuin', 'Paringin Selatan', 'Balangan', 'Kalimantan Selatan', 22),
(565, 'RAHMAD HIDAYAT', 'Pria', 'Murung Abuin', '1998-11-08', 'SLTA', 'Islam', 'Desa Murung Abuin', 'Paringin Selatan', 'Balangan', 'Kalimantan Selatan', 22),
(566, 'MUHAMMAD YASIR', 'Pria', 'Murung Abuin', '1999-09-03', 'SD', 'Islam', 'Desa Murung Abuin', 'Paringin Selatan', 'Balangan', 'Kalimantan Selatan', 22),
(567, 'SANIAH', 'Wanita', 'Murung Abuin', '1998-08-03', 'SD', 'Islam', 'Desa Murung Abuin', 'Paringin Selatan', 'Balangan', 'Kalimantan Selatan', 22),
(568, 'UMI LESTARI', 'Wanita', 'Badalungga', '1999-07-05', 'SMA/SLTA/MA/Sederajat', 'Islam', 'Desa Badalungga', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(569, 'MUKLAH', 'Wanita', 'Badalungga', '1974-04-15', 'D1', 'Islam', 'Desa Badalungga', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(570, 'ARPIAH', 'Wanita', 'Badalungga', '1973-06-05', 'SMP/SLTP/MTs/Sederajat', 'Islam', 'Desa Badalungga', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(571, 'EKA RINA ROSIANTI', 'Wanita', 'Bayur', '1997-04-12', 'SLTA', 'Islam', 'Desa Badalungga', 'Awayan', 'Balangan', 'Kalimantan Selatan', 22),
(572, 'LILIK HERLINA', 'Wanita', 'Telaga', '1995-01-20', 'SMA', 'Islam', 'Desa Telaga', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 23),
(573, 'SUGIANTI', 'Wanita', 'Yogyakarta', '1981-11-19', 'SMA', 'Islam', 'Desa Telaga', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 23),
(574, 'SURATNO', 'Pria', 'Gunung Makmur', '1996-06-19', 'SMA', 'Islam', 'Desa sumber makmur', 'Takisung', 'Tanah Laut', 'Kalimantan Selatan', 23),
(575, 'UMIWATI', 'Wanita', 'Kintap', '1985-11-07', 'D1', 'Islam', 'Desa Kintapura', 'Kintap', 'Tanah Laut', 'Kalimantan Selatan', 23),
(576, 'SARPINAH', 'Wanita', 'Sungai Bakar', '1987-10-10', 'SMA', 'Islam', 'Desa Ketapang', 'Bajuin', 'Tanah Laut', 'Kalimantan Selatan', 23),
(577, 'RIZKE AULIA', 'Wanita', 'Tabat Padang', '1993-10-20', 'S1', 'Islam', 'Desa Tabat Padang', 'Haruyan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 23),
(578, 'RIZKIANOR', 'Pria', 'Tabat Padang', '1988-08-14', 'SMA', 'Islam', 'Desa Tabat Padang', 'Haruyan', 'Hulu Sungai Tengah', 'Kalimantan Selatan', 23),
(579, 'M. IRSYADI', 'Pria', 'Sampit', '1986-02-11', 'SMA', 'Islam', 'Desa Palimbang Sari', 'Haur Gading', 'Hulu Sungai Utara', 'Kalimantan Selatan', 23),
(580, 'MUHAMMAD RAJIDINNOR', 'Pria', 'Amuntai', '1995-08-11', 'SMA', 'Islam', 'Desa Palimbang sari', 'Haur Gading', 'Hulu Sungai Utara', 'Kalimantan Selatan', 23),
(581, 'HANAILA ANANDA', 'Wanita', 'Cintapuri', '1999-11-22', 'SMA', 'Islam', 'Desa Bitahan Baru', 'Lokpaikat', 'Tapin', 'Kalimantan Selatan', 23),
(582, 'IKE RIANA DEWI', 'Wanita', 'Miawa', '1997-06-19', 'SMA', 'Islam', 'Desa Miawa', 'Piani', 'Tapin', 'Kalimantan Selatan', 23),
(583, 'TRIANI', 'Wanita', 'Bongkang', '1977-05-25', 'SLTA', 'Islam', 'Desa Padang Panjang', 'Tanta', 'Tabalong', 'Kalimantan Selatan', 23),
(584, 'SITI KHOMARIAH', 'Wanita', 'Tabalong', '1995-09-28', 'S1', 'Islam', 'Desa Burum', 'Bintang Ara', 'Tabalong', 'Kalimantan Selatan', 23),
(585, 'ENY PURWANINGSIH', 'Wanita', 'Sungai Pangkalan', '1989-04-24', 'S1', 'Islam', 'Desa Wajok Hilir', 'Siantan', 'Mempawah', 'Kalimantan Barat', 24),
(586, 'SULASTRI', 'Wanita', 'Semudun', '1978-05-10', 'S1', 'Islam', 'Desa Wajok Hilir', 'Siantan', 'Mempawah', 'Kalimantan Barat', 24),
(587, 'ILANG', 'Pria', 'Manduing Lama', '1966-01-08', 'SMA', 'Islam', 'Desa Luwuk Kanan', 'Tasik Payawan', 'Katingan', 'Kalimantan Tengah', 25),
(588, 'RIZALDI RAHMADANI ', 'Pria', 'Batuil', '1991-12-10', 'S1', 'Islam', 'Desa Samba Danum', 'Katingan Tengah ', 'Katingan', 'Kalimantan Tengah', 25),
(589, 'HARIANTI', 'Wanita', 'Teppo', '1983-11-13', 'S1', 'Islam', 'Desa BINALAWAN', 'Sebatik Barat', 'Nunukan', 'Kalimantan Utara', 26),
(590, 'SYAMSUL ALANG', 'Pria', 'Sabah', '1992-02-10', 'S1', 'Islam', 'Desa Bambangan', 'Sebatik Barat', 'Nunukan', 'Kalimantan Utara', 26),
(591, 'SADAM HUSIN', 'Pria', 'Nunukan', '1990-01-26', 'SMA', 'Islam', 'Desa Binusan', 'Nunukan', 'Nunukan', 'Kalimantan Utara', 26),
(592, 'ADITYA SAPUTRA', 'Pria', 'Pelaihari', '1997-04-11', 'S1', 'Islam', 'Desa Ambungan', 'Pelaihari', 'Tanah Laut', 'Kalimantan Selatan', 27),
(593, 'ADI WIJAYA', 'Pria', 'Asam-Asam', '1991-01-10', 'SMA', 'Islam', 'Desa Simpang Empat Sungai Baru', 'Jorong', 'Tanah Laut', 'Kalimantan Selatan', 27),
(594, 'MUHAMMAD YARKANI', 'Pria', 'Kandangan Lama', '1982-08-17', 'SMA', 'Islam', 'Desa Karang Rejo Dusun Banjarsari', 'Jorong', 'Tanah Laut', 'Kalimantan Selatan', 27),
(595, 'AYI PATARHAPIDIN', 'Pria', 'Cidaun', '1985-04-08', 'SMA', 'Islam', 'Desa Angsana', 'Angsana', 'Tanah Bumbu', 'Kalimantan Selatan', 27),
(596, 'M. EDDY MULIADI', 'Pria', 'Rantau', '1990-09-29', 'S1', 'Islam', 'Desa Perintis Raya', 'Tapin Utara', 'Tapin', 'Kalimantan Selatan', 27),
(597, 'FAKHRUJIANNOR', 'Pria', 'Paharangan', '1992-03-29', 'S1', 'Islam', 'Desa Paharangan', 'Daha Utara', 'Hulu Sungai Selatan', 'Kalimantan Selatan', 27),
(598, 'SANDRIE MAHYUDI', 'Pria', 'Tabing Rimbah', '1988-08-02', 'SMA', 'Islam', 'Desa Cahaya Baru', 'Jejangkit', 'Barito Kuala', 'Kalimantan Selatan', 27),
(599, 'FATIMAH', 'Wanita', 'Anjir Pasar', '1994-12-14', 'SMA', 'Islam', 'Desa Anjir Pasar Kota II', 'Anjir Pasar', 'Barito Kuala', 'Kalimantan Selatan', 27),
(600, 'AMAT', 'Pria', 'Pindahan Baru', '1980-08-10', 'SMA', 'Islam', 'Desa Pindahan Baru', 'Rantau Badauh', 'Barito Kuala', 'Kalimantan Selatan', 27),
(601, 'ELITA ROSDINI', 'Wanita', 'Andaman II', '1981-11-28', 'S1', 'Islam', 'Desa Andaman II', 'Anjir Pasar', 'Barito Kuala', 'Kalimantan Selatan', 27),
(602, 'SAPTO NOVIANTORO', 'Pria', 'Kediri', '1978-11-27', 'S1', 'Islam', 'Desa Kumai Hulu', 'Kumai', 'Kotawaringin Barat', 'Kalimantan Tengah', 28),
(603, 'TOHHARI', 'Pria', 'Tanjung Terantang', '1991-04-20', 'SMA', 'Islam', 'Desa Sabuai', 'Kumai', 'Kotawaringin Barat', 'Kalimantan Tengah', 28),
(604, 'HERWIN BUDIYANTO', 'Pria', 'Pulang Pisau', '1980-09-24', 'S1', 'Islam', 'Desa Jaya Kelapa', 'Mentaya Hilir Selatan', 'Kotawaringin Timur', 'Kalimantan Tengah', 28),
(605, 'RIZALDI RAHMADANI', 'Pria', 'Batuil', '1991-12-10', 'S1', 'Islam', 'Desa Samba Danum', 'Katingan Tengah', 'Katingan', 'Kalimantan Tengah', 28),
(606, 'ADI SURIPTO KUSWADI', 'Pria', 'Kendal', '1973-12-13', 'SMA', 'Islam', 'Desa Garantung', 'Maliku', 'Pulang Pisau', 'Kalimantan Tengah', 28),
(607, 'RENI ALPIONITA', 'Wanita', 'Ketapang', '1995-09-15', 'SMA', 'Islam', 'Desa Tanjung Pura', 'Muara Pawan', 'Ketapang', 'Kalimantan Tengah', 29),
(608, 'YUSPIANDI', 'Pria', 'Perigi Parit', '1980-06-06', 'S1', 'Islam', 'Desa Sijang', 'Galing', 'Sambas', 'Kalimantan Tengah', 29),
(609, 'JAMIAT', 'Pria', 'Pancur', '1984-06-15', 'S1', 'Islam', 'Desa Pancur', 'Tangaran', 'Sambas', 'Kalimantan Tengah', 29),
(610, 'HANDRI', 'Pria', 'Kota Bangun', '1995-09-24', 'SMA', 'Islam', 'Desa Pela', 'Kota Bangun', 'Kutai Kartanegara', 'Kalimantan Timur', 30),
(611, 'HARIANTI', 'Wanita', 'Teppo', '1983-11-13', 'S1', 'Islam', 'Desa Binalawan', 'Sebatik Barat', 'Nunukan', 'Kalimantan Utara', 31),
(612, 'Mahmuda', 'Pria', 'Buntok', '1999-09-03', 'S1', 'Islam', 'Jalan Padat Karya', 'Dusun Selatan', 'Barito Selatan', 'Kalimantan Tengah', 32),
(613, 'MAHMUDA', 'Pria', 'Buntok', '1999-09-03', 'S1', 'Islam', 'Jalan Padat Karya', 'Dusun Selatan', 'Barito Selatan', 'Kalimantan Tengah', 33),
(614, 'udi', 'Pria', 'buntok', '1999-01-20', 'smk', 'Hindu', 'jalan  jelapat', 'dusun selatan', 'barito selatan', 'Kalimantan Tengah', 34),
(615, 'udi', 'Pria', 'buntok', '1991-03-20', 'smk', 'Hindu', 'jl jelapat', 'dusun selatan', 'Barito Selatan', 'Kalimantan Tengah', 35);

-- --------------------------------------------------------

--
-- Table structure for table `alumni_pelatihan`
--

CREATE TABLE `alumni_pelatihan` (
  `id` int(11) NOT NULL,
  `pelatihan` varchar(255) NOT NULL,
  `angkatan` varchar(20) NOT NULL,
  `provinsi` enum('Kalimantan Barat','Kalimantan Selatan','Kalimantan Utara','Kalimantan Timur','Kalimantan Tengah') NOT NULL,
  `kabupaten` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `tahun` enum('2016','2017','2018','2019','2020','2021','2022','2023','2024','2025','2026') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alumni_pelatihan`
--

INSERT INTO `alumni_pelatihan` (`id`, `pelatihan`, `angkatan`, `provinsi`, `kabupaten`, `lokasi`, `tahun`) VALUES
(1, 'Pengelolaan BUMDES Tematik Penyusunan Laporan Keuangan', 'XIII', 'Kalimantan Selatan', 'Hulu Sungai Tengah', 'BPPMDDTT Banjarmasin', '2023'),
(2, 'Pengelolaan BUMDES Banjarmasin Tematik Strategi Pemasaran Produk', 'V', 'Kalimantan Selatan', 'Tanah Bumbu', 'BPPMDDTT Banjarmasin', '2023'),
(3, 'Penyusunan Perencanaan Bisnis BUMDES Berdasarkan PP No.11 Tahun 2021', 'VI', 'Kalimantan Utara', 'Bulungan', 'Balai Pertemuan Dinas PMD Kab.Bulungan Prov.Kalimantan Utara', '2022'),
(4, 'Penyusunan Perencanaan BUMDES Berdasarkan PP No.11 Tahun 2021', 'XV', 'Kalimantan Tengah', 'Pulang Pisau', 'BPPPMDDTT Banjarmasin', '2022'),
(5, 'KADER PEMBERDAYAAN MASYARAKAT DESA ', 'I', 'Kalimantan Tengah', 'Gunung Mas', 'DI KECAMATAN KURUN KAB.GUNUNG MAS PROV.KALTENG', '2021'),
(6, 'Penyusunan Perencanaan Bisnis BUMDES', 'XXII', 'Kalimantan Tengah', 'Kutai Kartanegara', 'Desa Jembayan Kec.Loa Kulu Kab.Kutai Kartanegara Prov.Kaltim', '2021'),
(7, 'Strategi Pemasaran Produk Unggulan dikawasan Perdesaan', 'I', 'Kalimantan Timur', 'Penajam Paser Utara', 'Di desa gunung Mulia Kec.Babulu Kab.Penajam Paser Utara', '2021'),
(8, 'BUMDES', 'XXVII', 'Kalimantan Timur', 'Kutai Barat', 'Kampung Sumber sari', '2021'),
(9, 'PRUKADES', 'I', 'Kalimantan Timur', 'Panajam Paser Utara', 'Desa Gunung Mulia Kec.Babulu Kab.Penajam Paser Utara Prov.Kaltim', '2021'),
(10, 'KPMD', 'XIII', 'Kalimantan Selatan', 'Kota baru', 'KEC.KELUMPANG SELATAN', '2021'),
(11, 'CATRANS', 'IV', 'Kalimantan Tengah', 'Kapuas', 'DESA DADAHUP KEC.DADAHUP KAB.KAPUAS PROV.KALTENG', '2021'),
(12, 'Pemberdayaan Masyarakat Hukum Adat', 'PMHA', 'Kalimantan Selatan', 'Banjar', 'BALATMAS', '2020'),
(13, 'Pembangunan Desa Wisata', 'PDW', 'Kalimantan Selatan', 'Barito Kuala', 'BALATMAS', '2020'),
(14, 'Kader Pemberdayaan Masyarakat Desa', 'I', 'Kalimantan Selatan', 'Barito Kuala', 'BALATMAS', '2020'),
(15, 'Kader Pemberdayaan Masyarakat Desa', 'II', 'Kalimantan Selatan', 'Hulu Sungai', 'BALATMAS', '2020'),
(18, 'PEMBERDAYAAN MASYARAKAT HUKUM ADAT', 'PMHA1', 'Kalimantan Selatan', 'Banjar', 'BALATMAS', '2020'),
(19, 'PEMBANGUNAN DESA WISATA', 'PDW1', 'Kalimantan Selatan', 'Tanah Laut', 'BALATMAS', '2020'),
(20, 'PEMBANGUNAN DESA WISATA', 'PDW I', 'Kalimantan Selatan', 'Hulu Sungai Tengah', 'BALATMAS', '2020'),
(21, 'KADER PEMBERDAYAAN MASYARAKAT DESA ', 'I', 'Kalimantan Selatan', 'Barito Kuala', 'BALATMAS', '2020'),
(22, 'KADER PEMBERDAYAAN MASYARAKAT DESA', 'II', 'Kalimantan Selatan', 'Hulu Sungai Selatan', 'BALATMAS', '2020'),
(23, 'PELATIHAN ONLINE PENYUSUNAN LAPORAN KEUANGAN', 'I', 'Kalimantan Selatan', 'Tanah Laut', 'BALATMAS', '2020'),
(24, 'PELATIHAN ONLINE PENYESUAIAN LAPORAN KEUANGAN', 'I', 'Kalimantan Barat', 'Mempawah', 'BALATMAS', '2020'),
(25, 'PELATIHAN ONLINE PENYUSUNAN LAPORAN KEUANGAN', 'I', 'Kalimantan Tengah', 'Katingan', 'BALATMAS', '2020'),
(26, 'PELATIHAN ONLINE PENYUSUNAN LAPORAN KEUANGAN', 'I', 'Kalimantan Utara', 'Nunukan', 'BALATMAS', '2020'),
(27, 'PELATIHAN ONLINE STRATEGI PEMASARAN PRODUK', 'I', 'Kalimantan Selatan', 'Tanah laut', 'BALATMAS', '2020'),
(28, 'PELATIHAN ONLINE STRATEGI PEMASARAN PRODUK', 'I', 'Kalimantan Tengah', 'Kotawaringin Barat', 'BALATMAS', '2020'),
(29, 'PELATIHAN ONLINE STRATEGI PEMASARAN PRODUK', 'I', 'Kalimantan Barat', 'Ketapang', 'BALATMAS', '2020'),
(30, 'PELATIHAN ONLINE STRATEGI PEMASARAN PRODUK', 'I', 'Kalimantan Timur', 'Kutai Kartanegara', 'BALATMAS', '2020'),
(31, 'PELATIHAN ONLINE STRATEGI PEMASARAN PRODUK', 'I', 'Kalimantan Utara', 'Nunukan', 'BALATMAS', '2020'),
(32, 'Pengelolaan BUMDes', 'I', 'Kalimantan Tengah', 'Barito Selatan', 'Balai Pelatihan Masyarakat Banjarmasin', '2024'),
(33, 'Pertanian Lahan Gambut', 'I', 'Kalimantan Tengah', 'Barito Selatan', 'Balai Pelatihan Masyarakat Banjarmasin', '2024'),
(34, 'TES 123', 'v', 'Kalimantan Tengah', 'Barito Selatan', 'hotel permai', '2024'),
(35, 'pemanfaatan rotan', 'v', 'Kalimantan Tengah', 'barito selatan', 'hotel permai', '2024');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama_lengkap`, `username`, `password`) VALUES
(1, 'admin', 'admin', 'bppmddttbjm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kegiatan_id` (`kegiatan_id`);

--
-- Indexes for table `alumni_pelatihan`
--
ALTER TABLE `alumni_pelatihan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumni`
--
ALTER TABLE `alumni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=616;

--
-- AUTO_INCREMENT for table `alumni_pelatihan`
--
ALTER TABLE `alumni_pelatihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`kegiatan_id`) REFERENCES `alumni_pelatihan` (`id`);
--
-- Database: `cuti_db`
--
CREATE DATABASE IF NOT EXISTS `cuti_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cuti_db`;

-- --------------------------------------------------------

--
-- Table structure for table `cuti`
--

CREATE TABLE `cuti` (
  `id_cuti` varchar(22) NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `tanggal_pengajuan` date DEFAULT NULL,
  `jenis_cuti` varchar(20) DEFAULT NULL,
  `tempat_cuti` varchar(20) DEFAULT NULL,
  `alamat_nohp` text DEFAULT NULL,
  `keperluan` text DEFAULT NULL,
  `lama_cuti` int(11) DEFAULT NULL,
  `id_pegawai` varchar(50) DEFAULT NULL,
  `id_atasan` varchar(50) DEFAULT NULL,
  `status_cuti` int(11) DEFAULT NULL,
  `dokumen_cuti` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuti`
--

INSERT INTO `cuti` (`id_cuti`, `tanggal_mulai`, `tanggal_selesai`, `tanggal_pengajuan`, `jenis_cuti`, `tempat_cuti`, `alamat_nohp`, `keperluan`, `lama_cuti`, `id_pegawai`, `id_atasan`, `status_cuti`, `dokumen_cuti`) VALUES
('C-00000000000000000001', '2019-05-24', '2019-05-28', '2019-05-23', 'Cuti Tahunan', 'Dalam Negeri', 'banjar', 'jalan jalan', 4, '198204042008012035', '197602201998031001', 2, 'sdsadsdasd'),
('C-00000000000000000002', '2019-12-30', '2020-01-03', '2019-07-25', 'Cuti Tahunan', 'Dalam Negeri', 'aasdasd', 'asdasdasd', 5, '198204042008012035', '197602201998031001', 2, 'sqaasd'),
('C-00000000000000000003', '2018-12-30', '2019-01-02', '2018-11-22', 'Cuti Tahunan', 'Dalam Negeri', 'dasdasdas', 'asdasdasd', 3, '198204042008012035', '197602201998031001', 3, 'sdasdsdasd'),
('C-00000000000000000004', '2019-05-24', '2019-05-28', '2019-05-23', 'Cuti Tahunan', 'Dalam Negeri', 'i', 'j', 3, '198204042008012035', '197602201998031001', 1, 'Screenshot_from_2019-05-05_01-37-19.png'),
('C-00000000000000000005', '2019-05-24', '2019-05-24', '2019-05-24', 'Cuti Tahunan', 'Dalam Negeri', 'hgfdsa', 'ghhgfd', 1, '198204042008012035', '197602201998031001', 2, 'Screenshot_from_2019-04-25_05-50-04.png');

-- --------------------------------------------------------

--
-- Stand-in structure for view `cuti_setuju`
-- (See below for the actual view)
--
CREATE TABLE `cuti_setuju` (
`id_cuti` varchar(22)
,`tanggal_mulai` date
,`tanggal_selesai` date
,`tanggal_pengajuan` date
,`jenis_cuti` varchar(20)
,`tempat_cuti` varchar(20)
,`alamat_nohp` text
,`keperluan` text
,`lama_cuti` int(11)
,`id_pegawai` varchar(50)
,`id_atasan` varchar(50)
,`status_cuti` int(11)
,`dokumen_cuti` text
);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(50) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(200) DEFAULT NULL,
  `golongan` varchar(50) DEFAULT NULL,
  `unit_kerja` varchar(200) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama`, `jabatan`, `golongan`, `unit_kerja`, `status`, `password`) VALUES
('197602201998031001', 'HENDRO NUGROHO, ST, M.Si', 'Kepala Bagian Sumber Daya Manusia', '(IV/a) Pembina', 'Bagian Sumber Daya Manusia', 'atasan', 'hendro'),
('198204042008012035', 'AJENG INDRIA SARI, S.Psi', 'Kepala Sub Bagian Perencanaan dan Pengembangan SDM', 'III/d', 'Sub Bagian Perencanaan dan Pengembangan SDM', 'pegawai', 'ajeng');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pegawai_cuti`
-- (See below for the actual view)
--
CREATE TABLE `pegawai_cuti` (
`nip` varchar(50)
,`nama` varchar(100)
,`jabatan` varchar(200)
,`golongan` varchar(50)
,`unit_kerja` varchar(200)
,`status` varchar(50)
,`password` varchar(50)
,`id_cuti` varchar(22)
,`tanggal_mulai` date
,`tanggal_selesai` date
,`tanggal_pengajuan` date
,`jenis_cuti` varchar(20)
,`tempat_cuti` varchar(20)
,`alamat_nohp` text
,`keperluan` text
,`lama_cuti` int(11)
,`id_pegawai` varchar(50)
,`id_atasan` varchar(50)
,`status_cuti` int(11)
,`dokumen_cuti` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pegawai_cuti2`
-- (See below for the actual view)
--
CREATE TABLE `pegawai_cuti2` (
`id_cuti` varchar(22)
,`nip` varchar(50)
,`nama` varchar(100)
,`jabatan` varchar(200)
,`tanggal_mulai` date
,`tanggal_selesai` date
,`tanggal_pengajuan` date
,`lama_cuti` int(11)
,`tempat_cuti` varchar(20)
,`jenis_cuti` varchar(20)
,`status_cuti` varchar(16)
,`id_atasan` varchar(50)
,`id_pegawai` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `perhitungan_cuti`
-- (See below for the actual view)
--
CREATE TABLE `perhitungan_cuti` (
`id_pegawai` varchar(50)
,`j_tahun_mulai` double
,`j_tahun_selesai` double
,`tahun_mulai` int(4)
,`tahun_selesai` int(4)
);

-- --------------------------------------------------------

--
-- Structure for view `cuti_setuju`
--
DROP TABLE IF EXISTS `cuti_setuju`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cuti_setuju`  AS SELECT `cuti`.`id_cuti` AS `id_cuti`, `cuti`.`tanggal_mulai` AS `tanggal_mulai`, `cuti`.`tanggal_selesai` AS `tanggal_selesai`, `cuti`.`tanggal_pengajuan` AS `tanggal_pengajuan`, `cuti`.`jenis_cuti` AS `jenis_cuti`, `cuti`.`tempat_cuti` AS `tempat_cuti`, `cuti`.`alamat_nohp` AS `alamat_nohp`, `cuti`.`keperluan` AS `keperluan`, `cuti`.`lama_cuti` AS `lama_cuti`, `cuti`.`id_pegawai` AS `id_pegawai`, `cuti`.`id_atasan` AS `id_atasan`, `cuti`.`status_cuti` AS `status_cuti`, `cuti`.`dokumen_cuti` AS `dokumen_cuti` FROM `cuti` WHERE `cuti`.`status_cuti` = '2' ;

-- --------------------------------------------------------

--
-- Structure for view `pegawai_cuti`
--
DROP TABLE IF EXISTS `pegawai_cuti`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pegawai_cuti`  AS SELECT `p`.`nip` AS `nip`, `p`.`nama` AS `nama`, `p`.`jabatan` AS `jabatan`, `p`.`golongan` AS `golongan`, `p`.`unit_kerja` AS `unit_kerja`, `p`.`status` AS `status`, `p`.`password` AS `password`, `c`.`id_cuti` AS `id_cuti`, `c`.`tanggal_mulai` AS `tanggal_mulai`, `c`.`tanggal_selesai` AS `tanggal_selesai`, `c`.`tanggal_pengajuan` AS `tanggal_pengajuan`, `c`.`jenis_cuti` AS `jenis_cuti`, `c`.`tempat_cuti` AS `tempat_cuti`, `c`.`alamat_nohp` AS `alamat_nohp`, `c`.`keperluan` AS `keperluan`, `c`.`lama_cuti` AS `lama_cuti`, `c`.`id_pegawai` AS `id_pegawai`, `c`.`id_atasan` AS `id_atasan`, `c`.`status_cuti` AS `status_cuti`, `c`.`dokumen_cuti` AS `dokumen_cuti` FROM (`pegawai` `p` join `cuti` `c` on(`p`.`nip` = `c`.`id_pegawai`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pegawai_cuti2`
--
DROP TABLE IF EXISTS `pegawai_cuti2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pegawai_cuti2`  AS SELECT `pegawai_cuti`.`id_cuti` AS `id_cuti`, `pegawai_cuti`.`nip` AS `nip`, `pegawai_cuti`.`nama` AS `nama`, `pegawai_cuti`.`jabatan` AS `jabatan`, `pegawai_cuti`.`tanggal_mulai` AS `tanggal_mulai`, `pegawai_cuti`.`tanggal_selesai` AS `tanggal_selesai`, `pegawai_cuti`.`tanggal_pengajuan` AS `tanggal_pengajuan`, `pegawai_cuti`.`lama_cuti` AS `lama_cuti`, `pegawai_cuti`.`tempat_cuti` AS `tempat_cuti`, `pegawai_cuti`.`jenis_cuti` AS `jenis_cuti`, CASE WHEN `pegawai_cuti`.`status_cuti` = '1' THEN 'Usulan Baru' WHEN `pegawai_cuti`.`status_cuti` = '2' THEN 'Disetujui Atasan' ELSE 'Ditolak Atasan' END AS `status_cuti`, `pegawai_cuti`.`id_atasan` AS `id_atasan`, `pegawai_cuti`.`id_pegawai` AS `id_pegawai` FROM `pegawai_cuti` ;

-- --------------------------------------------------------

--
-- Structure for view `perhitungan_cuti`
--
DROP TABLE IF EXISTS `perhitungan_cuti`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `perhitungan_cuti`  AS SELECT `cuti_setuju`.`id_pegawai` AS `id_pegawai`, CASE WHEN extract(year from `cuti_setuju`.`tanggal_mulai`) < extract(year from `cuti_setuju`.`tanggal_selesai`) THEN sum(`cuti_setuju`.`lama_cuti`) - (5 * ((to_days(`cuti_setuju`.`tanggal_selesai`) - to_days(concat(extract(year from `cuti_setuju`.`tanggal_mulai`),'-12-31'))) DIV 7) + substr('0123444401233334012222340111123400012345001234550',7 * weekday(concat(extract(year from `cuti_setuju`.`tanggal_mulai`),'-12-31')) + weekday(`cuti_setuju`.`tanggal_selesai`) + 1,1)) ELSE sum(`cuti_setuju`.`lama_cuti`) / 2 END AS `j_tahun_mulai`, CASE WHEN extract(year from `cuti_setuju`.`tanggal_mulai`) < extract(year from `cuti_setuju`.`tanggal_selesai`) THEN 5 * ((to_days(`cuti_setuju`.`tanggal_selesai`) - to_days(concat(extract(year from `cuti_setuju`.`tanggal_mulai`),'-12-31'))) DIV 7) + substr('0123444401233334012222340111123400012345001234550',7 * weekday(concat(extract(year from `cuti_setuju`.`tanggal_mulai`),'-12-31')) + weekday(`cuti_setuju`.`tanggal_selesai`) + 1,1) ELSE sum(`cuti_setuju`.`lama_cuti`) / 2 END AS `j_tahun_selesai`, extract(year from `cuti_setuju`.`tanggal_mulai`) AS `tahun_mulai`, extract(year from `cuti_setuju`.`tanggal_selesai`) AS `tahun_selesai` FROM `cuti_setuju` GROUP BY `cuti_setuju`.`id_pegawai`, extract(year from `cuti_setuju`.`tanggal_mulai`), extract(year from `cuti_setuju`.`tanggal_selesai`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id_cuti`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_atasan` (`id_atasan`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cuti`
--
ALTER TABLE `cuti`
  ADD CONSTRAINT `cuti_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`nip`),
  ADD CONSTRAINT `cuti_ibfk_2` FOREIGN KEY (`id_atasan`) REFERENCES `pegawai` (`nip`);
--
-- Database: `db-alumni`
--
CREATE DATABASE IF NOT EXISTS `db-alumni` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db-alumni`;

-- --------------------------------------------------------

--
-- Table structure for table `anggaran`
--

CREATE TABLE `anggaran` (
  `id_anggaran` int(11) NOT NULL,
  `jumlah_anggaran` decimal(10,2) NOT NULL,
  `tahun_anggaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `angkatan`
--

CREATE TABLE `angkatan` (
  `id_angkatan` int(11) NOT NULL,
  `nama_angkatan` varchar(255) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `jumlah_peserta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dana`
--

CREATE TABLE `dana` (
  `id_dana` int(11) NOT NULL,
  `jumlah_dana` varchar(255) NOT NULL,
  `tanggal_penerimaan` date NOT NULL,
  `sumber_dana` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pelatih`
--

CREATE TABLE `pelatih` (
  `id_pelatih` int(11) NOT NULL,
  `nama_pelatih` varchar(255) NOT NULL,
  `kontak_pelatih` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `temapelatihan`
--

CREATE TABLE `temapelatihan` (
  `id_tema` int(11) NOT NULL,
  `nama_pelatihan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `kata_sandi` varchar(255) NOT NULL,
  `peran_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggaran`
--
ALTER TABLE `anggaran`
  ADD PRIMARY KEY (`id_anggaran`);

--
-- Indexes for table `angkatan`
--
ALTER TABLE `angkatan`
  ADD PRIMARY KEY (`id_angkatan`);

--
-- Indexes for table `dana`
--
ALTER TABLE `dana`
  ADD PRIMARY KEY (`id_dana`);

--
-- Indexes for table `pelatih`
--
ALTER TABLE `pelatih`
  ADD PRIMARY KEY (`id_pelatih`);

--
-- Indexes for table `temapelatihan`
--
ALTER TABLE `temapelatihan`
  ADD PRIMARY KEY (`id_tema`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);
--
-- Database: `db_appmhs`
--
CREATE DATABASE IF NOT EXISTS `db_appmhs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_appmhs`;
--
-- Database: `db_cuti`
--
CREATE DATABASE IF NOT EXISTS `db_cuti` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_cuti`;

-- --------------------------------------------------------

--
-- Table structure for table `cuti`
--

CREATE TABLE `cuti` (
  `id_cuti` varchar(30) NOT NULL,
  `id_user` varchar(256) NOT NULL,
  `alasan` text NOT NULL,
  `tgl_diajukan` date NOT NULL,
  `mulai` date NOT NULL,
  `berakhir` date NOT NULL,
  `id_status_cuti` int(12) NOT NULL,
  `perihal_cuti` varchar(100) NOT NULL,
  `alasan_verifikasi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cuti`
--

INSERT INTO `cuti` (`id_cuti`, `id_user`, `alasan`, `tgl_diajukan`, `mulai`, `berakhir`, `id_status_cuti`, `perihal_cuti`, `alasan_verifikasi`) VALUES
('cuti-060ae', 'c551fc8847d29dc25a23db5d2cdb941b', 'Cuti Sakit SAkit', '2022-08-06', '2022-08-04', '2022-08-17', 2, 'Cuti Sakit', 'YEs'),
('cuti-06a5f', '40bae2603ae22725d35def9e7c48b0d6', 'Menghadiri Rapat Orang Tua Siswa di Sekolahan', '2022-08-11', '2022-08-22', '2022-08-23', 1, 'Rapat Orang Tua Siswa', NULL),
('cuti-203c6', '1fcaef592c1b8f4b733b04e19be58f99', 'Menemani study tour anak di Bali', '2022-08-11', '2022-09-04', '2022-09-16', 3, 'study tour', 'Ada rapat penting'),
('cuti-285ed', '8ac5e3b30c2f0091eef898158122d131', 'Liburan muncak di Gunug Lawu', '2022-08-11', '2022-08-27', '2022-08-29', 1, 'Muncak', NULL),
('cuti-36d9b', '0000f879df9b442107cc359168ce33a6', 'jkhakaKJ', '2023-12-06', '2023-12-08', '2023-12-21', 2, 'ildas', 'bolehhh'),
('cuti-3d2a7', '263a76c22eb8acf8c3e08edd55c1421d', 'Menghadiri acara wisuda anak di sekolahan', '2022-08-11', '2022-08-22', '2022-08-23', 1, 'Anak Wisuda', NULL),
('cuti-5ae57', '66d0de4b6aab1f34ed9d8779f375a2ea', 'Karena Sakit Demam', '2022-08-11', '2022-08-13', '2022-08-15', 2, 'Sakit', 'sakit'),
('cuti-714f0', '592d06bdc0ee778dab4e01d55ba8b14c', 'Karena ibu saya sakit', '2022-06-15', '2022-06-12', '2022-06-30', 1, 'Cuti Libur', NULL),
('cuti-7d81b', 'beecc6bfae05c7fba5a19f27f41a27ec', 'Muncak di Gunug Lawu sama Alvian', '2022-08-11', '2022-08-27', '2022-08-29', 1, 'Muncak', NULL),
('cuti-89c0c', '2fbb953bcaf76ff9d669197a6d9b6733', 'Membantu panen kebun orang tua', '2022-08-11', '2022-08-12', '2022-08-13', 1, 'Panen', NULL),
('cuti-99215', 'ebeeaf891bcf293ec607f50475648ddc', 'menemani ibu saya yang sakit, sekarang beliau masih berada dirumah sakit dan butuh saya temani selama seminggu.', '2022-06-06', '2022-06-06', '2022-06-15', 2, 'berobat', NULL),
('cuti-a2f13', '39332f054c98c54e4eda83e1274566ed', 'melahirkan anak pertama', '2022-08-11', '2022-08-13', '2022-11-01', 2, 'Cuti Melahirkan', 'melahirkan'),
('cuti-ede81', 'dce802a5e29e9ccabc144dfb6a37abbb', 'Liburan ke lampung', '2022-06-21', '2022-06-21', '2022-06-21', 2, 'Cuti Libur', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id_jenis_kelamin` int(11) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_kelamin`
--

INSERT INTO `jenis_kelamin` (`id_jenis_kelamin`, `jenis_kelamin`) VALUES
(1, 'Laki-Laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `status_cuti`
--

CREATE TABLE `status_cuti` (
  `id_status_cuti` int(11) NOT NULL,
  `status_cuti` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_cuti`
--

INSERT INTO `status_cuti` (`id_status_cuti`, `status_cuti`) VALUES
(1, 'Menunggu Konfirmasi'),
(2, 'Izin Cuti Diterima'),
(3, 'Izin Cuti Ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(256) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `id_user_detail` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`, `id_user_level`, `id_user_detail`) VALUES
('0000f879df9b442107cc359168ce33a6', 'intan', 'intan', 'intan@gmail.com', 1, '0000f879df9b442107cc359168ce33a6'),
('134e349e4f50a051d8ca3687d6a7de1a', 'admin', 'admin', 'admin@admin.com', 2, '134e349e4f50a051d8ca3687d6a7de1a'),
('1fcaef592c1b8f4b733b04e19be58f99', 'fajar', 'fajar', 'fajar@gmail.com', 1, '1fcaef592c1b8f4b733b04e19be58f99'),
('263a76c22eb8acf8c3e08edd55c1421d', 'ali', 'ali', 'ali@gmail.com', 1, '263a76c22eb8acf8c3e08edd55c1421d'),
('2d0323357f989f5f37f7ad36472987d5', 'zaki', 'zaki', 'zaki@gmail.com', 1, '2d0323357f989f5f37f7ad36472987d5'),
('2fbb953bcaf76ff9d669197a6d9b6733', 'dedi', 'dedi', 'dedi@gmail.com', 1, '2fbb953bcaf76ff9d669197a6d9b6733'),
('39332f054c98c54e4eda83e1274566ed', 'putri', 'putri', 'putri@gmail.com', 1, '39332f054c98c54e4eda83e1274566ed'),
('394125b4dd6a990d44234aacb50d131a', 'abdul', 'adbul', 'abdul@gmail.com', 1, '394125b4dd6a990d44234aacb50d131a'),
('40bae2603ae22725d35def9e7c48b0d6', 'zahra', 'zahra', 'zahra@gmail.com', 1, '40bae2603ae22725d35def9e7c48b0d6'),
('44dabb248ea11b849e01b8daf96afcd1', 'violita', 'violita', 'violita@gmail.com', 1, '44dabb248ea11b849e01b8daf96afcd1'),
('57b4255e4a7980a1ddabce0ab0e506d6', 'hamdan', 'hamdan', 'Hamdan@gmail.com', 1, '57b4255e4a7980a1ddabce0ab0e506d6'),
('5a481cabb876061353a43db9b6f2e1bd', 'ikhwan', 'ikhwan', 'ikhwan@gmail.com', 1, '5a481cabb876061353a43db9b6f2e1bd'),
('66d0de4b6aab1f34ed9d8779f375a2ea', 'ahmad', 'ahmad', 'ahmad@gmail.com', 1, '66d0de4b6aab1f34ed9d8779f375a2ea'),
('8ac5e3b30c2f0091eef898158122d131', 'alvian', 'alvian', 'alvian@gmail.com', 1, '8ac5e3b30c2f0091eef898158122d131'),
('93f012d5ead1feed5512ad71e28ad6e5', 'marita', 'marita', 'marita@gmail.com', 1, '93f012d5ead1feed5512ad71e28ad6e5'),
('98eb4077470a60a0fe0f7b9d01755557', 'admin2', 'admin2@admin.com', 'ika@gmail.com', 2, '98eb4077470a60a0fe0f7b9d01755557'),
('a83fbd96f2b40a72ac3eb0d96f457222', 'sisca', 'sisca', 'sisca@gmail.com', 1, 'a83fbd96f2b40a72ac3eb0d96f457222'),
('beecc6bfae05c7fba5a19f27f41a27ec', 'elga', 'elga', 'elga@gmail.com', 1, 'beecc6bfae05c7fba5a19f27f41a27ec'),
('c5ebbfc46694606d675519cc31666e0d', 'firman', 'firman', 'firman@gmail.com', 1, 'c5ebbfc46694606d675519cc31666e0d'),
('d43114b75460d274e82f6cc8b6f93b5f', 'sindy', 'sindy', 'sindy@gmail.com', 1, 'd43114b75460d274e82f6cc8b6f93b5f'),
('dbedcc1be9d89cbb3eda751309eb77b0', 'bagus', 'bagus', 'bagus@gamil.com', 1, 'dbedcc1be9d89cbb3eda751309eb77b0'),
('f5972fbf4ef53843c1e12c3ae99e5005', 'super_admin', 'super_admin', 'kresna123@gmail.com', 3, 'f5972fbf4ef53843c1e12c3ae99e5005'),
('f8ed2321348b78239fb493bc55eed7b2', 'malik', 'malik', 'maik@gmail.com', 1, 'f8ed2321348b78239fb493bc55eed7b2');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id_user_detail` varchar(256) NOT NULL,
  `nama_lengkap` varchar(30) DEFAULT NULL,
  `id_jenis_kelamin` int(12) DEFAULT NULL,
  `no_telp` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `pangkat` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id_user_detail`, `nama_lengkap`, `id_jenis_kelamin`, `no_telp`, `alamat`, `nip`, `pangkat`, `jabatan`) VALUES
('0000f879df9b442107cc359168ce33a6', 'Ratna Intan', 2, '089878675654', 'Jl. Kendangsari', NULL, NULL, NULL),
('134e349e4f50a051d8ca3687d6a7de1a', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1fcaef592c1b8f4b733b04e19be58f99', 'Fajar Alfansyah', 1, '081221334561', 'Jl. Ngagel Rejo', NULL, NULL, NULL),
('263a76c22eb8acf8c3e08edd55c1421d', 'Ali Makruf', 1, '087667898112', 'Jl. Sumberan', NULL, NULL, NULL),
('2d0323357f989f5f37f7ad36472987d5', 'Zaki Agus Saputra', 1, '089876765672', 'Jl. Klampis Jaya', NULL, NULL, NULL),
('2fbb953bcaf76ff9d669197a6d9b6733', 'Dadi Gusriyanto', 1, '087888879765', 'Jl. Dukuh Kupang', NULL, NULL, NULL),
('39332f054c98c54e4eda83e1274566ed', 'Putri Yulia Sari', 2, '087676765654', 'Jl. Sukosemolo', NULL, NULL, NULL),
('394125b4dd6a990d44234aacb50d131a', 'Abdul Haris', 1, '081234567890', 'Jl. Ahmad Yani', NULL, NULL, NULL),
('40bae2603ae22725d35def9e7c48b0d6', 'Zahra Amelia Fauzzi', 2, '085656456212', 'Jl. Kenjeran', NULL, NULL, NULL),
('44dabb248ea11b849e01b8daf96afcd1', 'Silvani Violita', 2, '089789876654', 'Jl. Sukosemolo', NULL, NULL, NULL),
('57b4255e4a7980a1ddabce0ab0e506d6', 'Hamdan Fajeril', 1, '087675641321', 'Jl. Walisongo', NULL, NULL, NULL),
('5a481cabb876061353a43db9b6f2e1bd', 'Ikhwan Saputra', 1, '085665453421', 'Jl. Bratang Gede', NULL, NULL, NULL),
('66d0de4b6aab1f34ed9d8779f375a2ea', 'Ahmad Burhanuddin', 1, '081654432342', 'Jl. Pejuang', NULL, NULL, NULL),
('8ac5e3b30c2f0091eef898158122d131', 'Alvian Andhi', 1, '089777666562', 'Jl. Ngagel Rejo', NULL, NULL, NULL),
('93f012d5ead1feed5512ad71e28ad6e5', 'Dwi Marita', 2, '081432415678', 'Jl. Manyar', NULL, NULL, NULL),
('98eb4077470a60a0fe0f7b9d01755557', NULL, 1, NULL, NULL, NULL, NULL, NULL),
('a83fbd96f2b40a72ac3eb0d96f457222', 'Sisca Verbriyanti', 2, '082341445678', 'Jl. Klampis Jaya', NULL, NULL, NULL),
('beecc6bfae05c7fba5a19f27f41a27ec', 'Elga Yuan Saputra', 1, '081224567122', 'Jl. Ngagel Rejo', NULL, NULL, NULL),
('c5ebbfc46694606d675519cc31666e0d', 'Firman Saputra', 1, '081234567890', 'Jl. Kaliurang', NULL, NULL, NULL),
('d43114b75460d274e82f6cc8b6f93b5f', 'Sindy Safara', 2, '081654432342', 'Jl. Bung Tomo', NULL, NULL, NULL),
('dbedcc1be9d89cbb3eda751309eb77b0', 'Bagus Saputra', 1, '0811122341432', 'Jl. Klampis Jaya', NULL, NULL, NULL),
('f5972fbf4ef53843c1e12c3ae99e5005', NULL, 1, NULL, NULL, NULL, NULL, NULL),
('f8ed2321348b78239fb493bc55eed7b2', 'Malik Indra Kusuma', 1, '081656765431', 'Jl. Diponegoro', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `id_user_level` int(11) NOT NULL,
  `user_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id_user_level`, `user_level`) VALUES
(1, 'pegawai'),
(2, 'admin'),
(3, 'super admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id_cuti`);

--
-- Indexes for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  ADD PRIMARY KEY (`id_jenis_kelamin`);

--
-- Indexes for table `status_cuti`
--
ALTER TABLE `status_cuti`
  ADD PRIMARY KEY (`id_status_cuti`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id_user_detail`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_user_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  MODIFY `id_jenis_kelamin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_cuti`
--
ALTER TABLE `status_cuti`
  MODIFY `id_status_cuti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_user_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `elms`
--
CREATE DATABASE IF NOT EXISTS `elms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `elms`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', 'admin', '2023-12-06 02:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `DepartmentCode` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `DepartmentCode`, `CreationDate`) VALUES
(1, 'Human Resource', 'HR', 'HR001', '2017-11-01 07:16:25'),
(2, 'Information Technology', 'IT', 'IT001', '2017-11-01 07:19:37'),
(3, 'Operations', 'OP', 'OP1', '2017-12-02 21:28:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `id` int(11) NOT NULL,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`id`, `EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `City`, `Country`, `Phonenumber`, `Status`, `RegDate`) VALUES
(1, 'EMP10806121', 'Johnny', 'doe', 'johnny@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 'Male', '3 February, 1990', 'Human Resource', 'N NEPO', 'NEPO', 'IRE', '9857555555', 1, '2017-11-10 11:29:59'),
(2, 'DEMP2132', 'James', 'doe', 'james@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 'Male', '3 February, 1990', 'Information Technology', 'N NEPO', 'NEPO', 'IRE', '8587944255', 1, '2017-11-10 13:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`) VALUES
(7, 'Casual Leave', '30/11/2017', '29/10/2017', 'test description test descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest description', '2017-11-19 13:11:21', 'Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.\r\n', '2017-12-02 23:26:27 ', 2, 1, 1),
(8, 'Medical Leave test', '21/10/2017', '25/10/2017', 'test description test descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest description', '2017-11-20 11:14:14', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2017-12-02 23:24:39 ', 1, 1, 1),
(9, 'Medical Leave test', '08/12/2017', '12/12/2017', 'Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.\r\n', '2017-12-02 18:26:01', NULL, NULL, 0, 1, 2),
(10, 'Restricted Holiday(RH)', '25/12/2017', '25/12/2017', 'Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.', '2017-12-03 08:29:07', 'Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.', '2017-12-03 14:06:12 ', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleavetype`
--

INSERT INTO `tblleavetype` (`id`, `LeaveType`, `Description`, `CreationDate`) VALUES
(1, 'Casual Leave', 'Casual Leave ', '2017-11-01 12:07:56'),
(2, 'Medical Leave test', 'Medical Leave  test', '2017-11-06 13:16:09'),
(3, 'Restricted Holiday(RH)', 'Restricted Holiday(RH)', '2017-11-06 13:16:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"appalumni\",\"table\":\"tbl_user\"},{\"db\":\"appalumni\",\"table\":\"tbl_user_level\"},{\"db\":\"appalumni\",\"table\":\"tbl_hak_akses\"},{\"db\":\"appalumni\",\"table\":\"tbl_setting\"},{\"db\":\"appalumni\",\"table\":\"tbl_transmigrasi\"},{\"db\":\"appalumni\",\"table\":\"tbl_anggota\"},{\"db\":\"db-alumni\",\"table\":\"user\"},{\"db\":\"db-alumni\",\"table\":\"temapelatihan\"},{\"db\":\"db-alumni\",\"table\":\"pelatih\"},{\"db\":\"db-alumni\",\"table\":\"dana\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-02-13 07:45:42', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
