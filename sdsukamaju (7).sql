-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2021 pada 15.49
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
(1, 'BI-1A', 'Bahasa Indonesia', 'SU09', '1A', 'Senin', '07:30-08:30'),
(2, 'BIG-1A', 'Bahasa Inggris', 'SU09', '1A', 'RABU', '11.00-14.00'),
(3, 'IPS-1B', 'Ilmu Pengetahuan Sosial', 'AA01', '1B', 'Senin', '07:35-07:50'),
(4, 'IPA-2A', 'Ilmu Pengetahuan Alam', 'AD02', '2A', 'Senin', '08:00-08:30'),
(5, 'MTK-2B', 'Matematika', 'AM03', '2B', 'selasa', '07:30-07:50'),
(7, 'PAK-3B', 'Pendidikan Agama', 'IK05', '3B', 'Rabu', '08:00-08:30'),
(8, 'PKN-4A', 'Pendidikan Kewarganegaraan', 'NA06', '4A', 'kamis', '09:00-09:30'),
(9, 'SENBUD-4B', 'Seni Budaya', 'PG07', '4B', 'Kamis', '09:30-10:00'),
(10, 'PJK-5A', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'RA08', '5A', 'Jumat', '08:00-09:00'),
(11, 'IPS', 'Ilmu Pengetahuan Sosial', 'SU09', '1A', 'SELASA', '07:35-08:50'),
(12, 'IPS-1A', 'Ilmu Pengetahuan Alam', 'SU09', '1A', 'SELASA', '09:00-10:30'),
(13, 'MTK-1A', 'Matematika', 'SU09', '1A', 'RABU', '07:35-08:50'),
(14, 'PAK-1A', 'Pendidikan Agama', 'SU09', '1A', 'RABU', '09:00-10:30'),
(15, 'PKN-1A', 'Pendidikan Kewarganegaraan', 'SU09', '1A', 'RABU', '10:50-12:00'),
(16, 'SBD-1A', 'Seni Budaya', 'SU09', '1A', 'KAMIS', '07:35-08:50'),
(17, 'PJK-1A', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'SU09', '1A', 'KAMIS', '09:00-10:30'),
(18, 'IPS-1A', 'Ilmu Pengetahuan Sosial', 'SU09', '1A', 'SELASA', '10:50-12:00'),
(19, 'IPS-1B', 'Ilmu Pengetahuan Alam', 'SU09', '1B', 'SELASA', '09:00-10:30'),
(20, 'MTK-1B', 'Matematika', 'SU09', '1B', 'RABU', '07:35-08:50'),
(21, 'PAK-1B', 'Pendidikan Agama', 'SU09', '1B', 'RABU', '09:00-10:30'),
(22, 'PKN-1B', 'Pendidikan Kewarganegaraan', 'SU09', '1B', 'RABU', '10:50-12:00'),
(23, 'SBD-1B', 'Seni Budaya', 'SU09', '1B', 'KAMIS', '07:35-08:50'),
(24, 'PJK-1B', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'SU09', '1B', 'KAMIS', '09:00-10:30'),
(25, 'IPS-1B', 'Ilmu Pengetahuan Sosial', 'SU09', '1B', 'SELASA', '10:50-12:00'),
(26, 'IPS-1B', 'Ilmu Pengetahuan Alam', 'AM03', '1B', 'SELASA', '09:00-10:30'),
(27, 'MTK-1B', 'Matematika', 'AM03', '1B', 'RABU', '07:35-08:50'),
(28, 'PAK-1B', 'Pendidikan Agama', 'AM03', '1B', 'RABU', '09:00-10:30'),
(29, 'PKN-1B', 'Pendidikan Kewarganegaraan', 'AM03', '1B', 'RABU', '10:50-12:00'),
(30, 'SBD-1B', 'Seni Budaya', 'AM03', '1B', 'KAMIS', '07:35-08:50'),
(31, 'PJK-1B', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'AM03', '1B', 'KAMIS', '09:00-10:30'),
(32, 'IPS-1B', 'Ilmu Pengetahuan Sosial', 'AM03', '1B', 'SELASA', '10:50-12:00'),
(33, 'IPS-2A', 'Ilmu Pengetahuan Alam', 'TN10', '2A', 'SELASA', '09:00-10:30'),
(34, 'MTK-2A', 'Matematika', 'TN10', '2A', 'RABU', '07:35-08:50'),
(35, 'PAK-2A', 'Pendidikan Agama', 'TN10', '2A', 'RABU', '09:00-10:30'),
(36, 'PKN-2A', 'Pendidikan Kewarganegaraan', 'TN10', '2A', 'RABU', '10:50-12:00'),
(37, 'SBD-2A', 'Seni Budaya', 'TN10', '2A', 'KAMIS', '07:35-08:50'),
(38, 'PJK-2A', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'TN10', '2A', 'KAMIS', '09:00-10:30'),
(39, 'IPS-2A', 'Ilmu Pengetahuan Sosial', 'TN10', '2A', 'SELASA', '10:50-12:00'),
(40, 'IPS-2B', 'Ilmu Pengetahuan Alam', 'HS04', '2B', 'SELASA', '09:00-10:30'),
(41, 'MTK-2B', 'Matematika', 'HS04', '2B', 'RABU', '07:35-08:50'),
(42, 'PAK-2B', 'Pendidikan Agama', 'HS04', '2B', 'RABU', '09:00-10:30'),
(43, 'PKN-2B', 'Pendidikan Kewarganegaraan', 'HS04', '2B', 'RABU', '10:50-12:00'),
(44, 'SBD-2B', 'Seni Budaya', 'HS04', '2B', 'KAMIS', '07:35-08:50'),
(45, 'PJK-2B', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'HS04', '2B', 'KAMIS', '09:00-10:30'),
(46, 'IPS-2B', 'Ilmu Pengetahuan Sosial', 'HS04', '2B', 'SELASA', '10:50-12:00'),
(47, 'IPS-3A', 'Ilmu Pengetahuan Alam', 'ZI12', '3A', 'SELASA', '09:00-10:30'),
(48, 'MTK-3A', 'Matematika', 'ZI12', '3A', 'RABU', '07:35-08:50'),
(49, 'PAK-3A', 'Pendidikan Agama', 'ZI12', '3A', 'RABU', '09:00-10:30'),
(50, 'PKN-3A', 'Pendidikan Kewarganegaraan', 'ZI12', '3A', 'RABU', '10:50-12:00'),
(51, 'SBD-3A', 'Seni Budaya', 'ZI12', '3A', 'KAMIS', '07:35-08:50'),
(52, 'PJK-3A', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'ZI12', '3A', 'KAMIS', '09:00-10:30'),
(53, 'IPS-3A', 'Ilmu Pengetahuan Sosial', 'ZI12', '3A', 'SELASA', '10:50-12:00'),
(54, 'IPS-3B', 'Ilmu Pengetahuan Alam', 'RA08', '3B', 'SELASA', '09:00-10:30'),
(55, 'MTK-3B', 'Matematika', 'RA08', '3B', 'RABU', '07:35-08:50'),
(56, 'PAK-3B', 'Pendidikan Agama', 'RA08', '3B', 'RABU', '09:00-10:30'),
(57, 'PKN-3B', 'Pendidikan Kewarganegaraan', 'RA08', '3B', 'RABU', '10:50-12:00'),
(58, 'SBD-3B', 'Seni Budaya', 'RA08', '3B', 'KAMIS', '07:35-08:50'),
(59, 'PJK-3B', 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'RA08', '3B', 'KAMIS', '09:00-10:30'),
(60, 'IPS-3B', 'Ilmu Pengetahuan Sosial', 'RA08', '3B', 'SELASA', '10:50-12:00');

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
(101, 'Dimas Aji', '1A', 'Murid', '123', 'Jombang', '857613314202'),
(102, 'Rini Fatma', '1A', 'Murid', '123', 'Jombang', '857613121323'),
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
(310, 'Latifah Aini', '2A', 'Murid', '123', 'Jogja', '876213231225'),
(401, 'Desinta Dwi', '2B', 'Murid', '123', 'Gunung Kidul', '98736564876'),
(402, 'Ihsan Maulana', '2B', 'Murid', '123', 'Bantul', '98376487656'),
(403, 'Yufa Sekar', '2B', 'Murid', '123', '', '83143231424'),
(404, 'Mawar Ayu', '2B', 'Murid', '123', 'Sleman', '98736564876'),
(405, 'Fajar Wahyu', '2B', 'Murid', '123', 'Yogyakarta', '98736564876'),
(406, 'Desinta Dwi', '2B', 'Murid', '123', 'Gunung Kidul', '98736564876'),
(501, 'Wulan Setya', '3A', 'Murid', '123', 'Yogyakarta', '98736564876'),
(502, 'Candrika', '3A', 'Murid', '123', 'Bantul', '98736564876'),
(503, 'Tiara Sasongko', '3A', 'Murid', '123', '', '0'),
(504, 'Yani', '3A', 'Murid', '123', 'Sleman', '98763564876'),
(505, 'Aprilia Putri', '3A', 'Murid', '123', 'Yogyakarta', '9873652321'),
(506, 'Nadia Nuri', '3A', 'Murid', '123', '', '98737622256'),
(601, 'Ikhsan Wardhana', '3B', 'Murid', '123', 'Yogyakarta', '98733364876'),
(602, 'Bayu Pamungkas', '3B', 'Murid', '123', 'Bantul', '98722264876'),
(603, 'Dimas Satyo', '3B', 'Murid', '123', '', '0'),
(604, 'Evita Anisia', '3B', 'Murid', '123', 'Sleman', '98733354676'),
(605, 'Naufal Darman', '3B', 'Murid', '123', 'Yogyakarta', '9873444876'),
(701, 'Herdi Narendra', '4A', 'Murid', '123', 'Yogyakarta', '98736324876'),
(702, 'Tahlia Muitara', '4A', 'Murid', '123', 'Bantul', '94256324876'),
(703, 'Angger Prakoso', '4A', 'Murid', '123', '', '0'),
(704, 'Guritno Surya', '4A', 'Murid', '123', 'Sleman', '96876324876'),
(705, 'Danang Graha', '4A', 'Murid', '123', 'Yogyakarta', '94256354676'),
(801, 'Rahmat Ardiyanto', '4B', 'Murid', '123', 'Bantul', '96546324876'),
(802, 'Intan Mei', '4B', 'Murid', '123', 'Bantul', '96546355576'),
(803, 'Aldiansyah', '4B', 'Murid', '123', '', '0'),
(804, 'Intan Hera', '4B', 'Murid', '123', 'Sleman', '96546324545'),
(805, 'Rizal Firmansyah', '4B', 'Murid', '123', 'Yogyakarta', '96546324555'),
(901, 'Alexander Bimo', '5A', 'Murid', '123', 'Yogyakarta', '96546324543'),
(902, 'Maya Novita', '5A', 'Murid', '123', 'Bantul', '96544424543'),
(903, 'Putri Hidayah', '5A', 'Murid', '123', '', '0'),
(904, 'Fadli Hasibuan', '5A', 'Murid', '123', 'Sleman', '96545554543'),
(905, 'Dian Kusuma', '5A', 'Murid', '123', 'Yogyakarta', '96546399943'),
(1001, 'Muhammad Nizam', '5B', 'Murid', '123', 'Yogyakarta', '96546324543'),
(1002, 'Rizky Ardiansyah', '5B', 'Murid', '123', 'Yogyakarta', '96546324543'),
(1003, 'Lisa Kartika Putri', '5B', 'Murid', '123', '', '0'),
(1004, 'Hendi Rahman', '5B', 'Murid', '123', 'Sleman', '96588824543'),
(1005, 'Muhammad Bagus', '5B', 'Murid', '123', 'Yogyakarta', '9654776543'),
(1101, 'Nur Halimah', '6A', 'Murid', '123', 'Yogyakarta', '96546324545'),
(1102, 'Akbar Arfian', '6A', 'Murid', '123', 'Bantul', '96546324645'),
(1103, 'Lingga Gautama', '6A', 'Murid', '123', '', '0'),
(1104, 'Ida Saraswati', '6A', 'Murid', '123', 'Sleman', '98976324545'),
(1105, 'Maulana Yusuf', '6A', 'Murid', '123', 'Yogyakarta', '96546334545'),
(1201, 'Dina Andini', '6B', 'Murid', '123', 'Yogyakarta', '98733364875'),
(1202, 'Aldila Tasya', '6B', 'Murid', '123', 'Bantul', '98744364875'),
(1203, 'Gilang Surya', '6B', 'Murid', '123', 'Bantul', '0'),
(1204, 'Rizky Pradana', '6B', 'Murid', '123', 'Sleman', '98736664875'),
(1205, 'Erfina Ramadani', '6B', 'Murid', '123', 'Yogyakarta', '98788364875');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
