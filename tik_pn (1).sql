-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2026 at 05:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tik_pn`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_barang`
--

CREATE TABLE `m_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `merk` varchar(50) DEFAULT NULL,
  `satuan` enum('buah','rim','pcs','box') DEFAULT 'buah',
  `stok_minimal` int(11) DEFAULT 5,
  `stok` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `m_barang`
--

INSERT INTO `m_barang` (`id_barang`, `nama_barang`, `merk`, `satuan`, `stok_minimal`, `stok`) VALUES
(10, 'HVS A4 80 Gram ', 'Sidu', 'rim', 0, 168),
(11, 'HVS F4 80 Gram ', 'Sidu', 'rim', 0, 64),
(12, 'Ballpoint V.5 Hitam', 'Snowman', 'pcs', 0, 0),
(13, 'Ballpoint Gel GP.265', 'Joyko', 'pcs', 0, 24),
(14, 'Tipex Roll', 'Joyko', 'pcs', 0, 33),
(15, 'Spidol Hitam Kecil', 'Joyko', 'pcs', 0, 37),
(16, 'Spidol Merah Kecil', 'Joyko', 'pcs', 0, 48),
(17, 'Double Tape Sedang', 'Joyko', '', 0, 49);

-- --------------------------------------------------------

--
-- Table structure for table `t_pembelian`
--

CREATE TABLE `t_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `no_nota` varchar(50) DEFAULT NULL,
  `tgl_nota` date DEFAULT NULL,
  `file_nota` varchar(255) DEFAULT NULL,
  `total_item` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_pembelian_detail`
--

CREATE TABLE `t_pembelian_detail` (
  `id_detail` int(11) NOT NULL,
  `id_pembelian` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_masuk` int(11) DEFAULT NULL,
  `harga_satuan` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_permohonan`
--

CREATE TABLE `t_permohonan` (
  `id_permohonan` int(11) NOT NULL,
  `no_permintaan` varchar(50) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `ruangan` varchar(100) DEFAULT NULL,
  `penanggung_jawab` varchar(255) DEFAULT NULL,
  `no_wa` varchar(20) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tgl_mohon` date DEFAULT NULL,
  `status` enum('pending','proses','selesai','ditolak') DEFAULT 'pending',
  `tgl_setuju` datetime DEFAULT NULL,
  `tanggal_pengajuan` datetime DEFAULT NULL,
  `keterangan_admin` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_permohonan`
--

INSERT INTO `t_permohonan` (`id_permohonan`, `no_permintaan`, `id_user`, `ruangan`, `penanggung_jawab`, `no_wa`, `id_barang`, `jumlah`, `satuan`, `catatan`, `tgl_mohon`, `status`, `tgl_setuju`, `tanggal_pengajuan`, `keterangan_admin`) VALUES
(29, 'REQ-20260427190601', 7, 'Pidana', NULL, '083827878301', 1, 10, 'rim', NULL, '2026-04-27', 'selesai', NULL, NULL, NULL),
(30, 'REQ-20260427190656', 7, 'Pidana', NULL, '083827878301', 4, 0, 'buah', NULL, '2026-04-27', 'ditolak', '2026-04-28 12:01:08', NULL, ''),
(31, 'REQ-20260427190727', 7, 'Pidana', NULL, '083827878301', 1, 100, 'buah', NULL, '2026-04-27', 'ditolak', NULL, NULL, NULL),
(33, 'REQ-20260427200949', 7, 'Pidana', NULL, '083827878301', 4, 10, 'buah', NULL, '2026-04-27', 'selesai', '2026-04-27 16:21:06', NULL, ''),
(34, 'REQ-20260427201014', 7, 'Pidana', NULL, '083827878301', 1, 50, 'rim', NULL, '2026-04-27', 'pending', NULL, NULL, NULL),
(35, 'REQ-20260427223414', 7, 'Pidana', NULL, '083827878301', 6, 50, 'rim', NULL, '2026-04-27', 'selesai', '2026-04-27 16:20:58', NULL, ''),
(36, 'REQ-20260427232157', 7, 'Pidana', NULL, '083827878301', 6, 10, 'rim', NULL, '2026-04-27', 'selesai', '2026-04-27 16:33:15', NULL, 'kosong'),
(38, 'REQ-20260427232256', NULL, 'Pidana', NULL, '083827878301', 6, 55, 'rim', NULL, '2026-04-27', 'selesai', '2026-04-27 16:32:57', NULL, 'ok'),
(39, 'REQ-20260427232256', NULL, 'Pidana', NULL, '083827878301', 4, 5, 'buah', NULL, '2026-04-27', 'selesai', '2026-04-27 16:32:57', NULL, ''),
(40, 'REQ-20260428110427', NULL, 'Perdata', NULL, '0895337741600', 4, 30, 'buah', NULL, '2026-04-28', 'selesai', '2026-04-28 04:07:35', NULL, ''),
(41, 'REQ-20260428110427', NULL, 'Perdata', NULL, '0895337741600', 6, 5, 'rim', NULL, '2026-04-28', 'selesai', '2026-04-28 04:07:35', NULL, ''),
(42, 'REQ-20260428110427', NULL, 'Perdata', NULL, '0895337741600', 7, 10, 'buah', NULL, '2026-04-28', 'selesai', '2026-04-28 04:07:35', NULL, ''),
(43, 'REQ-20260428110427', NULL, 'Perdata', NULL, '0895337741600', 8, 5, 'buah', NULL, '2026-04-28', 'selesai', '2026-04-28 04:07:35', NULL, ''),
(44, 'REQ-20260428110543', NULL, 'Perdata', NULL, '0895337741600', 4, 0, 'buah', NULL, '2026-04-28', 'ditolak', '2026-04-28 04:06:40', NULL, ''),
(45, 'REQ-20260428155900', NULL, 'Perdata', NULL, '0895337741600', 4, 0, 'buah', NULL, '2026-04-28', 'selesai', '2026-04-29 03:14:21', NULL, ''),
(46, 'REQ-20260428155900', NULL, 'Perdata', NULL, '0895337741600', 7, 2, 'buah', NULL, '2026-04-28', 'selesai', '2026-04-29 03:14:21', NULL, ''),
(47, 'REQ-20260428155900', NULL, 'Perdata', NULL, '0895337741600', 6, 5, 'rim', NULL, '2026-04-28', 'selesai', '2026-04-29 03:14:21', NULL, ''),
(48, 'REQ-20260429125706', NULL, 'Pidana', NULL, '0895337741600', 4, 10, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 05:58:19', NULL, ''),
(49, 'REQ-20260429125706', NULL, 'Pidana', NULL, '0895337741600', 6, 10, 'rim', NULL, '2026-04-29', 'selesai', '2026-04-29 05:58:19', NULL, ''),
(50, 'REQ-20260429130706', NULL, 'Pidana', NULL, '0895337741600', 6, 1, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 06:10:28', NULL, ''),
(51, 'REQ-20260429130706', NULL, 'Pidana', NULL, '0895337741600', 6, 1, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 06:10:28', NULL, ''),
(52, 'REQ-20260429131818', NULL, 'Pidana', NULL, '0895337741600', 6, 10, 'rim', NULL, '2026-04-29', 'selesai', '2026-04-29 06:27:31', NULL, ''),
(53, 'REQ-20260429131818', NULL, 'Pidana', NULL, '0895337741600', 4, 1, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 06:27:31', NULL, ''),
(54, 'REQ-20260429140748', NULL, 'Perdata', NULL, '089616426784', 11, 10, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 07:14:01', NULL, ''),
(55, 'REQ-20260429140748', NULL, 'Perdata', NULL, '089616426784', 15, 11, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 07:14:01', NULL, ''),
(56, 'REQ-20260429143722', NULL, 'Pidana', NULL, '085795280947', 10, 5, 'rim', NULL, '2026-04-29', 'selesai', '2026-04-29 08:12:50', NULL, ''),
(57, 'REQ-20260429143722', NULL, 'Pidana', NULL, '085795280947', 14, 5, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 08:12:50', NULL, ''),
(58, 'REQ-20260429143722', NULL, 'Pidana', NULL, '085795280947', 12, 10, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 08:12:50', NULL, ''),
(59, 'REQ-20260429152430', NULL, 'Pidana', NULL, '0895337741600', 12, 14, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 08:26:17', NULL, ''),
(60, 'REQ-20260429155342', NULL, 'Pidana', NULL, '083827878301', 10, 5, 'rim', NULL, '2026-04-29', 'selesai', '2026-04-29 08:55:51', NULL, 'stok kosong'),
(61, 'REQ-20260429155342', NULL, 'Pidana', NULL, '083827878301', 12, 0, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 08:55:51', NULL, 'stok kosong'),
(62, 'REQ-20260429155342', NULL, 'Pidana', NULL, '083827878301', 14, 10, 'buah', NULL, '2026-04-29', 'selesai', '2026-04-29 08:55:51', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_permohonan_detail`
--

CREATE TABLE `t_permohonan_detail` (
  `id_detail` int(11) NOT NULL,
  `id_permohonan` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `qty_diminta` int(11) DEFAULT NULL,
  `qty_acc` int(11) DEFAULT 0,
  `status_item` enum('pending','acc','ditolak') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_stok`
--

CREATE TABLE `t_stok` (
  `id_stok` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah_stok` int(11) DEFAULT 0,
  `update_terakhir` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_stok_opname`
--

CREATE TABLE `t_stok_opname` (
  `id_opname` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `stok_sistem` int(11) NOT NULL,
  `stok_fisik` int(11) NOT NULL,
  `selisih` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `tanggal_opname` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `role` enum('admin','admin_tik','admin_kepegawaian','user') DEFAULT 'user',
  `bagian` varchar(100) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_pegawai`, `role`, `bagian`, `no_hp`) VALUES
(2, 'admin', '$2y$10$8.uXN/A.W.uQ7B/p6.Uo3eI6m9y1zKx4pZp.yP/fR/X.8y.N.Q.i', 'Admin TIK PN BLB', 'admin_tik', NULL, '08123456789'),
(7, 'pidana', '$2y$10$pGZ5IVVFLtWJRXmYEcqQfOzB0sWs4LZ/dZgl3k6d1GXpnRnK8VmB.', 'Desi Ramadani', 'user', NULL, '085795280947'),
(8, 'perdata', '$2y$10$5ZhRbnTQiVVN.33xj6G7gu3lKkuI77BOx6HcIgTP.k5OWLc7EOExu', 'Amanda Aulia Nurani', 'user', NULL, '089616426784'),
(9, 'panitera', '$2y$10$4IIsaUSnoUHcrB8x94hpcOds1XMOKRqaF9W9y5BrT2AAQ4RJCWczG', 'Naufal Ahmad', 'user', NULL, '083116387596'),
(10, 'ptip', '$2y$10$X3YtSwStoVrQnpM2BPQZ1.sTGNoK4yEmB/zjSRhAwtROGkRMO0uP6', 'Rafli Nur Fadilah', 'user', NULL, '083827878301'),
(11, 'umum', '$2y$10$afq23BXBmdqFOo1FOKmPR.RI8sVfQi7uZCLuYW8sbr/Fxd9Z/126q', 'Sindi Ramadani', 'user', NULL, '0895337741600'),
(12, 'hukum', '$2y$10$uI0eVcZZoeWembG11FIQ5.oyDSfHMYI/IoJM6Z.RnnFIn4nnurdGu', 'Mulyadi ', 'user', NULL, '0844577678'),
(13, 'hakim', '$2y$10$90vcCkS2s/1zEp77GCKJEudIMq14.D096yPylQ2mY3eX0/29edrd6', 'Naufal Ahmad', 'user', NULL, '085795280947'),
(15, 'kepegawaian', '$2y$10$8g4yE1W8.Vz5HofM0bWhEu4XyD/8A9T1QGBygI/nJitZ8E0MhGg9i', 'Admin Kepegawaian', 'user', 'Kepegawaian', '081234567890');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `t_pembelian`
--
ALTER TABLE `t_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `t_pembelian_detail`
--
ALTER TABLE `t_pembelian_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `t_permohonan`
--
ALTER TABLE `t_permohonan`
  ADD PRIMARY KEY (`id_permohonan`);

--
-- Indexes for table `t_permohonan_detail`
--
ALTER TABLE `t_permohonan_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_permohonan` (`id_permohonan`);

--
-- Indexes for table `t_stok`
--
ALTER TABLE `t_stok`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `t_stok_opname`
--
ALTER TABLE `t_stok_opname`
  ADD PRIMARY KEY (`id_opname`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_barang`
--
ALTER TABLE `m_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_pembelian`
--
ALTER TABLE `t_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_pembelian_detail`
--
ALTER TABLE `t_pembelian_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `t_permohonan`
--
ALTER TABLE `t_permohonan`
  MODIFY `id_permohonan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `t_permohonan_detail`
--
ALTER TABLE `t_permohonan_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_stok`
--
ALTER TABLE `t_stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_stok_opname`
--
ALTER TABLE `t_stok_opname`
  MODIFY `id_opname` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_permohonan_detail`
--
ALTER TABLE `t_permohonan_detail`
  ADD CONSTRAINT `t_permohonan_detail_ibfk_1` FOREIGN KEY (`id_permohonan`) REFERENCES `t_permohonan` (`id_permohonan`);

--
-- Constraints for table `t_stok`
--
ALTER TABLE `t_stok`
  ADD CONSTRAINT `t_stok_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `m_barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
