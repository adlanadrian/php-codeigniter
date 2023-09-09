-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2022 at 03:54 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pustaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` varchar(12) NOT NULL,
  `tgl_booking` date NOT NULL,
  `batas_ambil` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `batas_ambil`, `id_user`) VALUES
('15052022001', '2022-05-15', '2022-05-17', 22);

-- --------------------------------------------------------

--
-- Table structure for table `booking_detail`
--

CREATE TABLE `booking_detail` (
  `id` int(11) NOT NULL,
  `id_booking` varchar(12) NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_detail`
--

INSERT INTO `booking_detail` (`id`, `id_booking`, `id_buku`) VALUES
(1, '15052022001', 1);

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul_buku` varchar(128) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `pengarang` varchar(64) NOT NULL,
  `penerbit` varchar(64) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `isbn` varchar(64) NOT NULL,
  `stok` int(11) NOT NULL,
  `dipinjam` int(11) NOT NULL,
  `dibooking` int(11) NOT NULL,
  `image` varchar(256) DEFAULT 'book-default-cover.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul_buku`, `id_kategori`, `pengarang`, `penerbit`, `tahun_terbit`, `isbn`, `stok`, `dipinjam`, `dibooking`, `image`) VALUES
(1, 'Statistika dengan Program Komputer', 1, 'Ahmad Kholiqul Amin', 'Deep Publish', 2014, '9786022809432', 2, 4, 1, 'img1557402455.jpg'),
(2, 'Mudah Belajar Komputer untuk Anak', 1, 'Bambang Agus Setiawan', 'Huta Media', 2014, '9786025118500', 4, 1, 3, 'img1557402397.jpg'),
(5, 'PHP Komplet', 1, 'Jubilee', 'Elex Media Komputindo', 2017, '8346753547', 11, 1, 1, 'img1555522493.jpg'),
(29, 'Detektif Conan Ep 200', 9, 'Okigawa Sasuke', 'Cultura', 2016, '874387583987', 5, 0, 0, 'book-default-cover.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `no_pinjam` varchar(12) CHARACTER SET utf8mb4 NOT NULL,
  `id_buku` int(11) NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pinjam`
--

INSERT INTO `detail_pinjam` (`no_pinjam`, `id_buku`, `denda`) VALUES
('01052022001', 1, 5000),
('02052022002', 5, 5000),
('13052022003', 5, 5000),
('16052022004', 5, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'Komputer'),
(2, 'Bahasa'),
(3, 'Sains'),
(4, 'Hobby'),
(5, 'Komunikasi'),
(6, 'Hukum'),
(7, 'Agama'),
(8, 'Populer'),
(9, 'Komik'),
(10, 'Dewasa'),
(12, 'Kids');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `no_pinjam` varchar(12) CHARACTER SET utf8mb4 NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `id_booking` varchar(12) CHARACTER SET utf8mb4 NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `status` enum('Pinjam','Kembali') CHARACTER SET utf8 NOT NULL DEFAULT 'Pinjam',
  `total_denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`no_pinjam`, `tgl_pinjam`, `id_booking`, `id_user`, `tgl_kembali`, `tgl_pengembalian`, `status`, `total_denda`) VALUES
('01052022001', '2022-05-01', '01052022001', 22, '2022-05-04', '2022-05-01', 'Kembali', 0),
('02052022002', '2022-05-02', '02052022001', 22, '2022-05-05', '2022-05-13', 'Kembali', 40000),
('13052022003', '2022-05-13', '13052022001', 22, '2022-05-14', '2022-05-16', 'Kembali', 10000),
('16052022004', '2022-05-16', '16052022002', 23, '2022-05-19', '2022-05-16', 'Kembali', 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'admministrator'),
(2, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `tgl_booking` datetime DEFAULT NULL,
  `id_user` varchar(12) DEFAULT NULL,
  `email_user` varchar(128) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `penulis` varchar(128) NOT NULL,
  `penerbit` varchar(128) NOT NULL,
  `tahun_terbit` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `tanggal_input` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `alamat`, `email`, `image`, `password`, `role_id`, `is_active`, `tanggal_input`) VALUES
(1, 'Imam Nawawi x', '', 'imam.imw@gmail.com', 'pro1605779080.jpg', '01469761fd58fc3309cbbbced8fa1f91', 1, 1, 1554218983),
(2, 'Maruloh, M.Kom', '', 'maruloh.mru@bsi.ac.id', 'pro1579684727.jpg', '$2y$10$beSdsua15A.A.tmiLIsmfuQCLWGdptUwjXlGI2u2kqxlpPXpXqZ72', 2, 1, 1554219788),
(3, 'Andriansah', '', 'andriansah.aiy@bsi.ac.id', 'pro1579677270.jpg', '$2y$10$Aa2soOYCyttqpIa1m8/79uc6Psz563XlTPcs0E4TuOji/UiKGox4i', 2, 1, 1579677270),
(4, 'Mochamad Nandi Susila', '', 'mochamad.mnl@bsi.ac.id', 'pro1579677559.jpg', '$2y$10$N6itMt2sWT1dPXwedtmhsOFC/2eYoQ9k.MI5t1jNwGPE06oVv5Oqm', 2, 1, 1579677559),
(5, 'Nandi', '', 'nandi@gmail.com', 'default.jpg', '$2y$10$3yF1EI7QF4vDYz4uM3oSfejUtrfzdTnFsUfl.kxAIByjPJ1X6tzD2', 2, 1, 1585627265),
(6, 'Elearning', '', 'Elearn@gmail.com', 'default.jpg', '$2y$10$fzy4O9SHjqFIhbfzro7kq.GVI2QBPM0ROH0qHmu8eo1714mzNs4aG', 2, 1, 1585672094),
(7, 'rio kusumah1', '', 'rio@gmail.com', 'pro1585674983.jpg', '$2y$10$jmppNsxyfdQ/XC/5fyGXVeqtDVcPwKG2bihfYjM.h6gkog1sCeWs2', 2, 1, 1585673039),
(9, 'BUDI', '', 'budi@gmail.com', 'default.jpg', '$2y$10$Hm/Y6HEB4l1B6otBxbXGze.BpdoB3YoLRFCE44ReLM9otU3GBBlSW', 2, 1, 1585699680),
(10, 'Rio Budiman OK', '', 'tesrio@gmail.com', 'pro1585723343.jpg', '$2y$10$XZV0MWZ6z4wQ6pjJU2N6HuHiHzHYxYw1EldKmzoKwugoQL9BNUFnq', 2, 1, 1585722652),
(11, 'BUDI', '', 'budi123@gmail.com', 'default.jpg', '$2y$10$M3nnoACBgh55s3Sges5/f.dEHyp/CeOaqmz1rauAEZqV0LpplfOd.', 2, 1, 1605778048),
(12, 'bsd123 OK', '', 'bsd123@gmail.com', 'pro1605796406.jpg', '$2y$10$qvSezpdFnCnmDfJSnBFXY.N.VNkt4G6DpZjxvrSilB8Tdzy5ULduC', 2, 1, 1605796003),
(17, 'qyubi', '', 'qyubi@gmail.com', 'default1.png', '$2y$10$5VbSwcR5lHuXRJoN3GbeUeOKXboD7QOSdrNbCyxN6bMivfPWL9JJu', 2, 1, 1643473199),
(18, 'woody', '', 'woody@gmail.com', '1472863724003.jpg', '$2y$10$CvaYxpBIqIHnyZYeidBTMeZYG99Gf9DndCHHIauteVzsSIeWw2NIi', 2, 1, 1644544667),
(19, 'Rio Dewantoro', 'Depok', 'riod@gmail.com', 'pro1650854828.jpg', '$2y$10$NP6YYrf0esgzTbafT4COKeZHfLkO3DsTnXyCJXxFq74yymV0RHS2O', 2, 1, 1650441192),
(20, 'kukuk', 'wakanda', 'kukuki@gmail.com', 'default.jpg', '$2y$10$WSvZCpvy8Zx7pEVYWxoSVuQSVIqBCAqrB5NB0gg6wc9T5SMxEYQ46', 2, 1, 1650855267),
(21, 'Kurama Naruto', '', 'kurama@gmail.com', 'default.jpg', '$2y$10$EcLVjhH5VSl/sK5Qqyn5LeUQGqUUnmsBwkbG6TKwfKq2Vo5NptH3S', 1, 1, 1650938626),
(22, 'Siapa', 'Lamaran', 'siapa@gmail.com', 'default.jpg', '$2y$10$23E1YR5OMY5Ru3jzlAy5H.ui5517zjq9iDi2CdGM5uG3oW8.LiXvq', 2, 1, 1651317878),
(23, 'Rif\'an Jalil', 'Citeureup Karawang', 'rifan1@gmail.com', 'default.jpg', '$2y$10$nJhHEhyqifts6ZxYNOBEX.myJzKqexCU8Z26iXvJCI31hDdWhAQBS', 2, 1, 1652707520),
(24, 'Rif\'an admin', '', 'rifanadmin@gmail.com', 'default.jpg', '$2y$10$i2c52wxgLNcCfg84.O96xOg8c0t7FUiSh/J6u0aP1UTGT0rCTBAni', 1, 1, 1652708110);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indexes for table `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`no_pinjam`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_detail`
--
ALTER TABLE `booking_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
