-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2020 at 05:08 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `stok` int(5) NOT NULL,
  `harga_beli` int(12) NOT NULL,
  `harga_jual` int(12) NOT NULL,
  `profit` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok`, `harga_beli`, `harga_jual`, `profit`) VALUES
('A1', 'Kaos ', 30, 30000, 50000, 20000),
('A2', 'Tas bag', 9, 60000, 70000, 10000),
('A3', 'Kaus Tangan', 31, 40000, 70000, 30000),
('A4', 'Kaus Kaki', 30, 10000, 15000, 5000),
('A5', 'Baju Batik', 40, 70000, 100000, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `laporan_pembelian`
--

CREATE TABLE `laporan_pembelian` (
  `tanggal` date NOT NULL DEFAULT current_timestamp(),
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_barang` int(12) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `total` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_pembelian`
--

INSERT INTO `laporan_pembelian` (`tanggal`, `id_barang`, `nama_barang`, `harga_barang`, `jumlah`, `total`) VALUES
('2020-01-02', 'A1', 'Kaos Distro', 100000, 4, 400000),
('2020-01-02', 'A3', 'BH', 40000, 7, 280000),
('2020-01-02', 'A1', 'Kaos Distro', 30000, 10, 300000),
('2020-01-02', 'A3', 'BH', 40000, 7, 280000),
('2020-01-02', 'A1', 'Kaos Distro', 30000, 10, 300000),
('2020-01-02', 'A2', 'Tas bag', 60000, 45, 2700000),
('2020-01-05', 'A3', 'BH', 40000, 7, 280000),
('2020-01-05', 'A1', 'Kaos Distro', 30000, 10, 300000),
('2020-01-05', 'A2', 'Tas bag', 60000, 45, 2700000),
('2020-01-03', 'A3', 'BH', 40000, 7, 280000),
('2020-01-03', 'A1', 'Kaos Distro', 30000, 10, 300000),
('2020-01-03', 'A2', 'Tas bag', 60000, 5, 300000),
('2020-01-03', 'A3', 'Kaus Tangan', 40000, 30, 1200000);

--
-- Triggers `laporan_pembelian`
--
DELIMITER $$
CREATE TRIGGER `tambah_stok` AFTER INSERT ON `laporan_pembelian` FOR EACH ROW BEGIN
UPDATE barang SET stok = stok + NEW.jumlah WHERE id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_penjualan`
--

CREATE TABLE `laporan_penjualan` (
  `tanggal` date NOT NULL DEFAULT current_timestamp(),
  `id_barang` varchar(12) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_barang` int(12) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `total` int(12) NOT NULL,
  `profit` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_penjualan`
--

INSERT INTO `laporan_penjualan` (`tanggal`, `id_barang`, `nama_barang`, `harga_barang`, `jumlah`, `total`, `profit`) VALUES
('2020-01-03', 'A3', 'BH', 70000, 12, 840000, 360000),
('2020-01-03', 'A3', 'BH', 70000, 12, 840000, 360000),
('2020-01-03', 'A3', 'BH', 70000, 12, 840000, 360000),
('2020-01-03', 'A3', 'BH', 70000, 12, 840000, 360000),
('2020-01-03', 'A1', 'Kaos Distro', 50000, 7, 350000, 140000),
('2020-01-03', 'A2', 'Tas bag', 70000, 6, 420000, 60000);

--
-- Triggers `laporan_penjualan`
--
DELIMITER $$
CREATE TRIGGER `krang_stok` AFTER INSERT ON `laporan_penjualan` FOR EACH ROW BEGIN
UPDATE barang SET stok = stok - NEW.jumlah WHERE id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_beli` int(12) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `total` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_barang`, `nama_barang`, `harga_beli`, `jumlah`, `total`) VALUES
('A3', 'Kaus Tangan', 40000, 20, 800000),
('A2', 'Tas bag', 60000, 10, 600000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(12) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `total` int(12) NOT NULL,
  `profit` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_barang`, `nama_barang`, `harga`, `jumlah`, `total`, `profit`) VALUES
('A5', 'Baju Batik', 100000, 2, 200000, 60000),
('A2', 'Tas bag', 70000, 4, 280000, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` enum('admin','kasir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `nama`, `email`, `password`, `level`) VALUES
(1, 'admin', 'admin', 'admin@rund.com', 'admin', 'admin'),
(3, 'user', 'user', 'user@rund.com', 'user', 'kasir'),
(4, 'yasir', 'Muhammad Yasir', 'yasir@rund.com', '1234', 'admin'),
(7, 'madek', 'Rusmadi N H', 'rush@rund.com', 'rush', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `laporan_pembelian`
--
ALTER TABLE `laporan_pembelian`
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `laporan_penjualan`
--
ALTER TABLE `laporan_penjualan`
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD UNIQUE KEY `nama_barang` (`nama_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD UNIQUE KEY `nama_barang` (`nama_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan_pembelian`
--
ALTER TABLE `laporan_pembelian`
  ADD CONSTRAINT `laporan_pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `laporan_penjualan`
--
ALTER TABLE `laporan_penjualan`
  ADD CONSTRAINT `laporan_penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
