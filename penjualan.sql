-- phpMyAdmin SQL Dump
-- version 3.1.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 15, 2016 at 01:11 PM
-- Server version: 5.1.35
-- PHP Version: 5.2.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telp` varchar(12) NOT NULL,
  `level` varchar(10) NOT NULL,
  `blokir` varchar(2) NOT NULL,
  `id_session` varchar(100) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `nama_lengkap`, `email`, `telp`, `level`, `blokir`, `id_session`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'administrator@gmail.com', '081267771344', 'Admin', 'N', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `costumer`
--

CREATE TABLE IF NOT EXISTS `costumer` (
  `id_costumer` int(5) NOT NULL AUTO_INCREMENT,
  `nama_costumer` varchar(30) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `alamat_lengkap` text NOT NULL,
  PRIMARY KEY (`id_costumer`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `costumer`
--

INSERT INTO `costumer` (`id_costumer`, `nama_costumer`, `no_telpon`, `alamat_lengkap`) VALUES
(7, 'Utari', '089610889464', 'Natar, Lampung Selatan'),
(6, 'Ummi Elviani Gumai', '087899113864', 'Branti, Natar'),
(3, 'Udin Sedunia', '081267771355', 'Ulak Karang, Padang, Sumatera Barat'),
(4, 'Anike Soumokill', '0894355763', 'Pagar Alam, Bandar Lampung'),
(5, 'Qurota Anggun Nikmah', '085768194950', 'Poncowarno,Pringsewu'),
(8, 'Puput Indrayani', '085841354077', 'Rajabasa Permai, Bandar Lampung'),
(9, 'Susilowati', '085783333873', 'Banyuwangi,Jawa Tengah'),
(10, 'Yuli Ariyani', '085768497262', 'Rajabasa Permai, Bandar Lampung'),
(11, 'Windia Bagus', '085736453858', 'Bandar Jaya'),
(13, 'Septa Latif', '09878653643', 'Rajabasa Permai, Bandar Lampung'),
(14, 'Dian Fajar', '08767343483', 'Kampung Baru, Unila'),
(15, 'Dean Satya P', '08966576385', 'Bandar Lampung'),
(16, 'Redho Algifaro', '08795436438', 'Rajabasa Permai, Bandar Lampung'),
(17, 'Siti Fatimah', '085767437922', 'Kali Rejo, Pringsewu'),
(18, 'Pita Sari', '085356388392', 'Palembang'),
(19, 'Thiana Indar Putri', '08973536463', 'Desa Mekar, Kota Bumi'),
(20, 'M. FAHMI HAFIDZ', '089691561660', 'TABEK INDAH, NATAR');

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE IF NOT EXISTS `faktur` (
  `id_faktur` int(5) NOT NULL AUTO_INCREMENT,
  `no_faktur` varchar(20) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id_faktur`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`id_faktur`, `no_faktur`, `tanggal`) VALUES
(1, 'FA1234', '2016-09-13 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_produk`
--

CREATE TABLE IF NOT EXISTS `kategori_produk` (
  `id_kategori` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `kategori_produk`
--

INSERT INTO `kategori_produk` (`id_kategori`, `nama_kategori`) VALUES
(27, 'Ballpoint'),
(28, 'Binder'),
(29, 'Amplop');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id_orders` int(5) NOT NULL AUTO_INCREMENT,
  `no_orders` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `id_costumer` int(5) NOT NULL,
  `nama_kasir` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `bayar` int(10) NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id_orders`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_orders`, `no_orders`, `id_costumer`, `nama_kasir`, `tgl_order`, `jam_order`, `bayar`, `status`) VALUES
(7, 'S160914-0002', 4, 'Ferri Achmad Effindri', '2016-09-14', '22:15:11', 5000, 1),
(6, 'S160914-0001', 3, 'Ferri Achmad Effindri', '2016-09-14', '22:13:26', 5000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id_orders`, `id_produk`, `jumlah`) VALUES
(7, 104, 1),
(6, 105, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE IF NOT EXISTS `orders_temp` (
  `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  PRIMARY KEY (`id_orders_temp`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=422 ;

--
-- Dumping data for table `orders_temp`
--


-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int(5) NOT NULL AUTO_INCREMENT,
  `kode_produk` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `deskripsi` text COLLATE latin1_general_ci NOT NULL,
  `harga` int(20) NOT NULL,
  `harga_grosir` int(20) NOT NULL,
  `harga_pokok` int(20) NOT NULL,
  `satuan` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `berat` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `diskon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tgl_masuk` date NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=106 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `kode_produk`, `id_kategori`, `nama_produk`, `deskripsi`, `harga`, `harga_grosir`, `harga_pokok`, `satuan`, `berat`, `diskon`, `tgl_masuk`) VALUES
(105, 'B0001', 27, 'Ballpoint Faster', '-', 2500, 2500, 2500, 'Pak', '0', '0', '2016-09-14'),
(104, 'A0002', 29, 'Amplop Coklat A3', '-', 1000, 1000, 1000, 'Pak', '0', '0', '2016-09-14'),
(103, 'A0001', 29, 'Amplop Jaya 90 Polos', '-', 1000, 1000, 1000, 'Pak', '0', '0', '2016-09-14');

-- --------------------------------------------------------

--
-- Table structure for table `produk_pembelian`
--

CREATE TABLE IF NOT EXISTS `produk_pembelian` (
  `id_produk_pembelian` int(5) NOT NULL AUTO_INCREMENT,
  `id_faktur` varchar(20) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `id_supplier` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tanggal_masuk` datetime NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id_produk_pembelian`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `produk_pembelian`
--

INSERT INTO `produk_pembelian` (`id_produk_pembelian`, `id_faktur`, `id_produk`, `id_supplier`, `jumlah`, `tanggal_masuk`, `username`) VALUES
(15, '1', 104, 3, 100, '2016-09-14 22:07:21', 'admin'),
(16, '1', 105, 2, 200, '2016-09-14 22:11:49', 'admin'),
(14, '1', 103, 3, 100, '2016-09-14 22:06:38', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `return_produk`
--

CREATE TABLE IF NOT EXISTS `return_produk` (
  `id_return` int(5) NOT NULL AUTO_INCREMENT,
  `id_produk` int(5) NOT NULL,
  `id_supplier` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `waktu_return` datetime NOT NULL,
  PRIMARY KEY (`id_return`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `return_produk`
--


-- --------------------------------------------------------

--
-- Table structure for table `statis`
--

CREATE TABLE IF NOT EXISTS `statis` (
  `judul` varchar(255) NOT NULL,
  `halaman` varchar(20) NOT NULL,
  `detail` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statis`
--

INSERT INTO `statis` (`judul`, `halaman`, `detail`) VALUES
('Selamat datang di sistem informasi Penjualan', 'home', '<p>System aplikasi point of sale adalah software yang di rancang, untuk mempermudah user / kasir dalam melakukan transaksi penjulan dan pembelian barang, software point of sale sudah bisa menghitung stock barang secara otomatis. software ini bisa digunakan di toko, minimarket dll. Selain itu keunggulan software ini sudah mencakup, pembayaran hutang, pembayaran piutang dan retur pembelian, retur penjualan barang , penjualan jasa dan software ini sudah dilengkapi dengan beberapa laporan-laporan yang bertujuan untuk mempermudah user dalam mengontrol data barang data â€“ data transaksi penjualan dan pembelian maupun retur barang secara baik. </p>\r\n\r\n<p>Adapun laporan point of sale adalah laporan master barang, laporan transaksi penjualan dan pembelian barang, laporan stock, laporan mutasi stock, laporan daftar customer, laporan piutang , laporan rekap umur piutang, laporan rugi laba dll. Software ini sudah dilengkapi dengan user password level sehingga hak akses user dalam mengoperasikan software bisa di control atau dibatasi yang bertujuan untuk menjaga kerahasiaan data yang semuanya sudah teritegrasi yang dikumpulkan dalam satu modul poin of sale.</p>\r\n\r\n<p>Selain itu keunggulan software ini sudah mencakup, pembayaran hutang, pembayaran piutang dan retur pembelian, retur penjualan barang , penjualan jasa dan software ini sudah dilengkapi dengan beberapa laporan-laporan yang bertujuan untuk mempermudah user dalam mengontrol data barang data â€“ data transaksi penjualan dan pembelian maupun retur barang secara baik. </p>');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `id_supplier` int(5) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `no_rekening` varchar(255) NOT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `bank`, `no_rekening`) VALUES
(1, 'Pt Persada Nusantara tbk', 'Bank BCA', '112 56 7879 23'),
(2, 'Pt Makmur cahaya baru melati', 'Bank Danamon', '3511887071'),
(3, 'Pt Damai Sentosa Sejahtera ', 'Bank Mandiri', '123 1 90897 453');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'customer',
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat_lengkap` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `aktif`, `id_session`, `alamat_lengkap`) VALUES
('robby', '827ccb0eea8a706c4c34a16891f84e7b', 'Robby Prihandaya', 'robby.prihandaya@gmail.com', '081267771344', 'customer', 'Y', '8d05dd2f03981f86b56c23951f3f34d7', 'Tunggul Hitam, Padang'),
('yolanda', '21aee6fc8b73e6db0e9a31699652cb9d', 'Putu Yolanda', 'putu.yolanda@gmail.com', '085263000122', 'customer', 'Y', '21aee6fc8b73e6db0e9a31699652cb9d', ''),
('ferri', '827ccb0eea8a706c4c34a16891f84e7b', 'Ferri Achmad Effindri', 'vendry7@gmail.com', '082170214495', 'customer', 'Y', '827ccb0eea8a706c4c34a16891f84e7b', '');
