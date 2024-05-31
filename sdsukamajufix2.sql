-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2021 pada 11.09
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdsukamaju`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `NoStruk` varchar(7) NOT NULL,
  `Golongan` varchar(5) NOT NULL,
  `Gaji` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gaji`
--

INSERT INTO `gaji` (`NoStruk`, `Golongan`, `Gaji`) VALUES
('NOSTA1', 'G01A', '2500000'),
('NOSTB2', 'G01B', '2400000'),
('NOSTC3', 'G01C', '2300000'),
('NOSTD4', 'G01D', '2200000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `NoPegawai` varchar(11) NOT NULL,
  `NamaGuru` varchar(50) NOT NULL,
  `Jabatan` varchar(5) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `NoHP` decimal(13,0) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Gaji` varchar(7) DEFAULT NULL,
  `WaliKelas` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`NoPegawai`, `NamaGuru`, `Jabatan`, `Password`, `NoHP`, `Alamat`, `Gaji`, `WaliKelas`) VALUES
('AA01', 'Ayu Andriyani', 'Guru', '123', '23422443212', 'Krangkungan', 'NOSTB2', '4B'),
('AD02', 'Alfina Damayanti', 'Guru', '123', '82414242551', 'Jogja', 'NOSTC3', '4A'),
('AM03', 'Aida Mohammad', 'Guru', '123', '82414242551', 'kedri', 'NOSTA1', '1B'),
('HS04', 'Hani Samuddin', 'Guru', '123', '31443245323', 'Sleman', 'NOSTB2', '2B'),
('IK05', 'Ikhsan Kurniawan', 'Guru', '123', '23476354242', 'Solo', 'NOSTC3', '6A'),
('NA06', 'Nyoman Aditama', 'Guru', '123', '82330681142', 'KulonProgo', 'NOSTA1', '6B'),
('PG07', 'Putu Gede ', 'Guru', '123', '22432243628', 'Jogja', 'NOSTB2', '5B'),
('RA08', 'Rizal Aditya ', 'Guru', '123', '82413125515', 'GunungKidul', 'NOSTA1', '3B'),
('SU09', 'Supram', 'Guru', '123', '98765678543', 'Sleman', 'NOSTA1', '1A'),
('TN10', 'Tri Nurdianto', 'Guru', '123', '82414421551', 'Jombang', 'NOSTC3', '2A'),
('YA11', 'Yusuf Abdullah', 'Guru', '123', '23812423219', 'Serang', 'NOSTA1', '5A'),
('ZI12', 'Zaida Isna', 'Guru', '123', '23812443213', 'Pasuruan', 'NOSTD4', '3A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matapelajaran`
--

CREATE TABLE `matapelajaran` (
  `id` int(11) NOT NULL,
  `KodeMapel` varchar(15) NOT NULL,
  `MataPelajaran` varchar(50) NOT NULL,
  `NamaGuru` varchar(50) NOT NULL,
  `Kelas` varchar(15) DEFAULT NULL,
  `Hari` varchar(7) NOT NULL,
  `Jam` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `matapelajaran`
--

INSERT INTO `matapelajaran` (`id`, `KodeMapel`, `MataPelajaran`, `NamaGuru`, `Kelas`, `Hari`, `Jam`) VALUES
(1, 'BIND19', 'Bahasa Indonesia', 'SU09', '1A', 'Senin', '07:00-08'),
(2, 'BINGGRIS', 'Bahasa Inggris', 'SU09', '1A', 'RABU', '11.00-14.00'),
(3, 'IPS-19', 'Ilmu Pengetahuan Sosial', 'AA01', '1B', 'Senin', '07:35-07:50'),
(4, 'IPA-19', 'Ilmu Pengetahuan Alam', 'AD02', '2A', 'Senin', '08:00-08:30'),
(5, 'MTK-19', 'Matematika', 'AM03', '2B', 'selasa', '07:30-07:50'),
(7, 'PAK-19', 'Pendidikan Agama', 'IK05', '3B', 'Rabu', '08:00-08:30'),
(8, 'PKN-19', 'Pendidikan Kewarganegaraan', 'NA06', '4A', 'kamis', '09:00-09:30'),
(9, 'SENBUD-19', 'Seni Budaya', 'PG07', '4B', 'Kamis', '09:30-10:00'),
(10, 'PJOK-19', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'RA08', '5A', 'Jumat', '08:00-09:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `murid`
--

CREATE TABLE `murid` (
  `NIS` int(4) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Kelas` varchar(15) DEFAULT NULL,
  `Jabatan` varchar(5) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `No_HPWali` decimal(13,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `murid`
--

INSERT INTO `murid` (`NIS`, `Nama`, `Kelas`, `Jabatan`, `Password`, `Alamat`, `No_HPWali`) VALUES
(100, 'Alvin Akbar', '1A', 'Murid', '123', 'Semarang', '893847637483'),
(101, 'Dimas Aji', '1A', 'Murid', '123', 'Jombang', '85761331'),
(102, 'Rini Fatma', '1A', 'Murid', '123', 'Jombang', '857613121'),
(103, 'Difa Sofi', '1A', 'Murid', '123', 'GunungKidul', '813242223232'),
(104, 'Nur Anisa', '1A', 'Murid', '123', 'Sleman', '818762223424'),
(105, 'Faiz Anwar', '1A', 'Murid', '123', '', '835357834242'),
(106, 'Yoga Putra', '1A', 'Murid', '123', 'Jogja', '887234383423'),
(107, 'Sandra Evi', '1A', 'Murid', '123', '', '887234383424'),
(109, 'Paijo Suhendra', '1A', 'Murid', '123', 'kediri', '812414345122'),
(110, 'Faza Ridha', '1A', 'Murid', '123', 'GunungKidul', '876213432553'),
(201, 'Wahyu Nugraha', '1B', 'Murid', '123', 'Sleman', '826313432453'),
(202, 'Wahyu Nugraha', '1B', 'Murid', '123', 'Sleman', '823242343242'),
(203, 'Annisa Aini', '1B', 'Murid', '123', 'Bantul', '823674243533'),
(204, 'Aulia Putri', '1B', 'Murid', '123', '', '842442234253'),
(205, 'Muh. Ikhsan', '1B', 'Murid', '123', 'Yogyakarta', '824242567554'),
(206, 'Yuda Wardhana', '1B', 'Murid', '123', 'Sleman', '842343252242'),
(207, 'Putri Nur', '1B', 'Murid', '123', 'Kulon Progo', '823423253242'),
(208, 'Bayu Samodra', '1B', 'Murid', '123', 'Sleman', '842432423423'),
(209, 'Wahyu Nugraha', '1B', 'Murid', '123', 'Sleman', '831242342343'),
(210, 'Diva Putri', '1B', 'Murid', '123', 'Sleman', '842144232342'),
(301, 'Maulana Bayu', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(302, 'Maulana Bayu', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(303, 'Dimas Permana', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(304, 'Rahma Anisa', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(305, 'Anisa Noer', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(306, 'Rini Setyowati', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(307, 'Wahyu Adji', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(308, 'Fitri Ayu', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(309, 'Fina Anggraini', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(310, 'Latifah Aini', '2A', 'Murid', '123', 'Jogja', '876213231225');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `NIS` int(4) NOT NULL,
  `id` int(11) NOT NULL,
  `Mapel` int(11) NOT NULL,
  `Nilai` int(11) NOT NULL,
  `kelas` varchar(15) DEFAULT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`NIS`, `id`, `Mapel`, `Nilai`, `kelas`, `semester`) VALUES
(109, 22, 2, 0, '5a', 3),
(100, 25, 1, 30, '1A', 12),
(100, 33, 1, 100, '1A', 5),
(109, 34, 1, 10, '1A', 3),
(100, 35, 1, 99, '1A', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `Ruangan` varchar(15) NOT NULL,
  `Kapasitas` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`Ruangan`, `Kapasitas`) VALUES
('1A', 10),
('1B', 10),
('2A', 10),
('2B', 10),
('3A', 10),
('3B', 10),
('4A', 10),
('4B', 10),
('5A', 10),
('5B', 10),
('6A', 10),
('6B', 10);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tb_guru`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tb_guru` (
`NoPegawai` varchar(11)
,`NamaGuru` varchar(50)
,`NoHP` decimal(13,0)
,`Alamat` varchar(50)
,`WaliKelas` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tb_hapussiswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tb_hapussiswa` (
`idhapus` int(11)
,`NIS` int(4)
,`MataPelajaran` varchar(50)
,`kelas` varchar(15)
,`Nilai` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tb_inputsiswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tb_inputsiswa` (
`id` int(11)
,`NIS` int(4)
,`MataPelajaran` varchar(50)
,`kelas` varchar(15)
,`Nilai` int(11)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `tb_guru`
--
DROP TABLE IF EXISTS `tb_guru`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tb_guru`  AS SELECT `guru`.`NoPegawai` AS `NoPegawai`, `guru`.`NamaGuru` AS `NamaGuru`, `guru`.`NoHP` AS `NoHP`, `guru`.`Alamat` AS `Alamat`, `guru`.`WaliKelas` AS `WaliKelas` FROM `guru` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `tb_hapussiswa`
--
DROP TABLE IF EXISTS `tb_hapussiswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tb_hapussiswa`  AS SELECT `nilai`.`id` AS `idhapus`, `nilai`.`NIS` AS `NIS`, `matapelajaran`.`MataPelajaran` AS `MataPelajaran`, `nilai`.`kelas` AS `kelas`, `nilai`.`Nilai` AS `Nilai` FROM (`matapelajaran` left join `nilai` on(`matapelajaran`.`id` = `nilai`.`Mapel`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `tb_inputsiswa`
--
DROP TABLE IF EXISTS `tb_inputsiswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tb_inputsiswa`  AS SELECT `nilai`.`id` AS `id`, `nilai`.`NIS` AS `NIS`, `matapelajaran`.`MataPelajaran` AS `MataPelajaran`, `nilai`.`kelas` AS `kelas`, `nilai`.`Nilai` AS `Nilai` FROM (`matapelajaran` left join `nilai` on(`matapelajaran`.`id` = `nilai`.`Mapel`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`NoStruk`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`NoPegawai`),
  ADD KEY `FK-Gaji` (`Gaji`),
  ADD KEY `fk-WaliKelas` (`WaliKelas`);

--
-- Indeks untuk tabel `matapelajaran`
--
ALTER TABLE `matapelajaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK-KelasMapel` (`Kelas`),
  ADD KEY `FK-GUruMapel` (`NamaGuru`);

--
-- Indeks untuk tabel `murid`
--
ALTER TABLE `murid`
  ADD PRIMARY KEY (`NIS`),
  ADD KEY `FK-Kelas` (`Kelas`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK-NISMurid` (`NIS`),
  ADD KEY `FK-MapelNilaai` (`Mapel`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`Ruangan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `matapelajaran`
--
ALTER TABLE `matapelajaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `FK-Gaji` FOREIGN KEY (`Gaji`) REFERENCES `gaji` (`NoStruk`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-WaliKelas` FOREIGN KEY (`WaliKelas`) REFERENCES `ruangan` (`Ruangan`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `matapelajaran`
--
ALTER TABLE `matapelajaran`
  ADD CONSTRAINT `FK-GUruMapel` FOREIGN KEY (`NamaGuru`) REFERENCES `guru` (`NoPegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK-KelasMapel` FOREIGN KEY (`Kelas`) REFERENCES `ruangan` (`Ruangan`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `murid`
--
ALTER TABLE `murid`
  ADD CONSTRAINT `FK-Kelas` FOREIGN KEY (`Kelas`) REFERENCES `ruangan` (`Ruangan`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `FK-MapelNilaai` FOREIGN KEY (`Mapel`) REFERENCES `matapelajaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK-NISMurid` FOREIGN KEY (`NIS`) REFERENCES `murid` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
