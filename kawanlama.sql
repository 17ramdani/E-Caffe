-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Bulan Mei 2022 pada 18.01
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resto`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_level`
--

CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_level`
--

INSERT INTO `tb_level` (`id_level`, `nama_level`) VALUES
(1, 'Administrator'),
(2, 'Waiter'),
(3, 'Kasir'),
(4, 'Owner'),
(5, 'Pelanggan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_masakan`
--

CREATE TABLE `tb_masakan` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(150) NOT NULL,
  `harga` varchar(150) NOT NULL,
  `stok` int(11) NOT NULL,
  `status_masakan` varchar(150) NOT NULL,
  `gambar_masakan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_masakan`
--

INSERT INTO `tb_masakan` (`id_masakan`, `nama_masakan`, `harga`, `stok`, `status_masakan`, `gambar_masakan`) VALUES
(27, 'coffbro', '15000', 49, 'tersedia', 'coffbro.jpg'),
(28, 'coffmilk', '13000', 47, 'tersedia', 'coffmilk.jpg'),
(29, 'Yakult Leci', '10000', 41, 'tersedia', 'Yakult Leci.jpg'),
(30, 'Coklat grasjel', '8000', 42, 'tersedia', 'Coklat grasjel.jpg'),
(33, 'Vanistra', '9000', 46, 'tersedia', 'Vanistra.jpg'),
(34, 'Sweet Cavendish', '15000', 19, 'tersedia', 'Sweet Cavendish.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_pengunjung` int(11) NOT NULL,
  `waktu_pesan` datetime NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_harga` varchar(150) NOT NULL,
  `uang_bayar` varchar(150) DEFAULT NULL,
  `uang_kembali` varchar(150) DEFAULT NULL,
  `status_order` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `id_admin`, `id_pengunjung`, `waktu_pesan`, `no_meja`, `total_harga`, `uang_bayar`, `uang_kembali`, `status_order`) VALUES
(32, 1, 6, '2022-04-13 20:39:21', 1, '25000', '30000', '5000', 'sudah bayar'),
(35, 1, 1, '2022-04-14 00:39:06', 1, '67000', '100000', '33000', 'sudah bayar'),
(36, 1, 1, '2022-04-14 01:14:36', 18, '17000', '25000', '8000', 'sudah bayar'),
(37, 1, 15, '2022-04-14 01:41:52', 3, '10000', '50000', '40000', 'sudah bayar'),
(38, 1, 15, '2022-04-14 11:17:30', 14, '26000', '50000', '24000', 'sudah bayar'),
(39, 1, 15, '2022-04-14 11:35:52', 9, '33000', '50000', '17000', 'sudah bayar'),
(40, 1, 1, '2022-05-12 09:19:50', 10, '16000', '50000', '34000', 'sudah bayar'),
(41, 1, 1, '2022-05-18 17:37:53', 12, '17000', '20000', '3000', 'sudah bayar'),
(42, 1, 1, '2022-05-19 09:03:16', 0, '34000', '50000', '16000', 'sudah bayar'),
(43, 1, 6, '2022-05-19 09:26:50', 12, '17000', '20000', '3000', 'sudah bayar'),
(44, 1, 1, '2022-05-19 09:30:09', 2, '34000', '50000', '16000', 'sudah bayar'),
(45, 0, 6, '2022-05-19 09:37:21', 12, '', '', '', 'belum bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_masakan` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status_pesan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pesan`
--

INSERT INTO `tb_pesan` (`id_pesan`, `id_user`, `id_order`, `id_masakan`, `jumlah`, `status_pesan`) VALUES
(51, 1, 0, 19, 0, 'sudah'),
(52, 1, 0, 18, 0, 'sudah'),
(61, 6, 0, 25, 0, 'sudah'),
(62, 6, 0, 23, 0, 'sudah'),
(63, 1, 0, 25, 0, 'sudah'),
(64, 1, 0, 23, 0, 'sudah'),
(65, 1, 0, 22, 0, 'sudah'),
(66, 1, 0, 21, 0, 'sudah'),
(78, 6, 0, 22, 0, 'sudah'),
(79, 6, 0, 21, 0, 'sudah'),
(85, 1, 35, 30, 4, 'sudah'),
(86, 1, 35, 29, 2, 'sudah'),
(87, 1, 35, 27, 1, 'sudah'),
(88, 1, 36, 33, 1, 'sudah'),
(89, 1, 36, 30, 1, 'sudah'),
(90, 15, 37, 29, 1, 'sudah'),
(91, 15, 38, 33, 2, 'sudah'),
(92, 15, 38, 30, 1, 'sudah'),
(93, 15, 39, 34, 1, 'sudah'),
(94, 15, 39, 33, 2, 'sudah'),
(97, 1, 40, 30, 2, 'sudah'),
(98, 1, 41, 33, 1, 'sudah'),
(99, 1, 41, 30, 1, 'sudah'),
(100, 1, 42, 33, 2, 'sudah'),
(101, 1, 42, 30, 2, 'sudah'),
(102, 6, 43, 33, 1, 'sudah'),
(103, 6, 43, 30, 1, 'sudah'),
(104, 1, 44, 30, 1, 'sudah'),
(105, 1, 44, 28, 2, 'sudah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_stok` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `jumlah_terjual` int(11) DEFAULT NULL,
  `status_cetak` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_stok`
--

INSERT INTO `tb_stok` (`id_stok`, `id_pesan`, `jumlah_terjual`, `status_cetak`) VALUES
(1, 46, 1, 'belum cetak'),
(2, 47, 2, 'belum cetak'),
(3, 48, 2, 'belum cetak'),
(4, 49, 1, 'belum cetak'),
(5, 50, 2, 'belum cetak'),
(6, 51, 0, 'belum cetak'),
(7, 52, 0, 'belum cetak'),
(8, 53, 0, 'belum cetak'),
(9, 54, 0, 'belum cetak'),
(10, 55, 0, 'belum cetak'),
(11, 56, 2, 'belum cetak'),
(12, 57, 1, 'belum cetak'),
(13, 58, 6, 'belum cetak'),
(14, 59, 1, 'belum cetak'),
(15, 60, 1, 'belum cetak'),
(16, 61, 0, 'belum cetak'),
(17, 62, 0, 'belum cetak'),
(18, 63, 0, 'belum cetak'),
(19, 64, 0, 'belum cetak'),
(20, 65, 0, 'belum cetak'),
(21, 66, 0, 'belum cetak'),
(22, 67, 3, 'belum cetak'),
(23, 68, 1, 'belum cetak'),
(24, 69, 2, 'belum cetak'),
(25, 70, 3, 'belum cetak'),
(26, 71, 1, 'belum cetak'),
(27, 72, 0, 'belum cetak'),
(28, 73, 5, 'belum cetak'),
(29, 74, 5, 'belum cetak'),
(30, 75, 1, 'belum cetak'),
(31, 76, 2, 'belum cetak'),
(32, 77, 3, 'belum cetak'),
(33, 78, 0, 'belum cetak'),
(34, 79, 0, 'belum cetak'),
(35, 80, 0, 'belum cetak'),
(36, 81, 0, 'belum cetak'),
(37, 82, 3, 'belum cetak'),
(38, 83, 3, 'belum cetak'),
(39, 84, 3, 'belum cetak'),
(40, 85, 4, 'belum cetak'),
(41, 86, 2, 'belum cetak'),
(42, 87, 1, 'belum cetak'),
(43, 88, 1, 'belum cetak'),
(44, 89, 1, 'belum cetak'),
(45, 90, 1, 'belum cetak'),
(46, 91, 2, 'belum cetak'),
(47, 92, 1, 'belum cetak'),
(48, 93, 1, 'belum cetak'),
(49, 94, 2, 'belum cetak'),
(50, 95, 0, 'belum cetak'),
(51, 96, 0, 'belum cetak'),
(52, 97, 2, 'belum cetak'),
(53, 98, 1, 'belum cetak'),
(54, 99, 1, 'belum cetak'),
(55, 100, 2, 'belum cetak'),
(56, 101, 2, 'belum cetak'),
(57, 102, 1, 'belum cetak'),
(58, 103, 1, 'belum cetak'),
(59, 104, 1, 'belum cetak'),
(60, 105, 2, 'belum cetak'),
(61, 106, 0, 'belum cetak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `id_level` int(11) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama_user`, `id_level`, `status`) VALUES
(1, 'admin', '123', 'San San', 1, 'aktif'),
(6, 'obi', '123', 'Robby Gunawan', 2, 'aktif'),
(7, 'aliyah', '123', 'Aliyah Milati Wahyu Ningsih', 3, 'aktif'),
(8, 'ramdani', '123', 'Ramdani', 4, 'aktif'),
(9, 'azli', '123', 'Ahmad Azli Selang', 4, 'aktif'),
(15, 'fakhri', '123', 'Muhammad Fakhri Hermawan', 5, 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `tb_masakan`
--
ALTER TABLE `tb_masakan`
  ADD PRIMARY KEY (`id_masakan`);

--
-- Indeks untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_pengunjung` (`id_pengunjung`);

--
-- Indeks untuk tabel `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_stok`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_masakan`
--
ALTER TABLE `tb_masakan`
  MODIFY `id_masakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `tb_pesan`
--
ALTER TABLE `tb_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
