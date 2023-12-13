-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 01:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `elektro`
--

CREATE TABLE `elektro` (
  `id_elektro` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `nim` varchar(250) NOT NULL,
  `prodi` varchar(250) NOT NULL,
  `lama_penulisan` varchar(250) NOT NULL,
  `sks` varchar(250) NOT NULL,
  `ipk` varchar(250) NOT NULL,
  `toefl` varchar(250) NOT NULL,
  `class` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `industri`
--

CREATE TABLE `industri` (
  `id_ind` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `nim` varchar(250) NOT NULL,
  `prodi` varchar(250) NOT NULL,
  `lama_penulisan` varchar(250) NOT NULL,
  `sks` varchar(250) NOT NULL,
  `ipk` varchar(250) NOT NULL,
  `toefl` varchar(250) NOT NULL,
  `class` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `informatika`
--

CREATE TABLE `informatika` (
  `id_infor` int(11) NOT NULL,
  `nim` varchar(250) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `prodi` varchar(250) NOT NULL,
  `lama_penulisan` varchar(250) NOT NULL,
  `sks` varchar(250) NOT NULL,
  `ipk` varchar(250) NOT NULL,
  `toefl` varchar(250) NOT NULL,
  `class` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `informatika`
--

INSERT INTO `informatika` (`id_infor`, `nim`, `nama`, `prodi`, `lama_penulisan`, `sks`, `ipk`, `toefl`, `class`) VALUES
(1, '2000018020', 'Aulia Ahmad Husaini', 'Informatika', '8', '126', '2.84', '455', 'Tidak Tepat Waktu'),
(2, '2000018021', 'Muhamad Fadhlurrohman Hakim', 'Informatika', '8', '126', '3.21', '442', 'Tidak Tepat Waktu'),
(3, '2000018024', 'Maulana Farid Ma\'ruf', 'Informatika', '6', '130', '3.46', '464', 'Tepat Waktu'),
(4, '2000018026', 'Alfi Maulana Akbar', 'Informatika', '8', '127', '2.63', '457', 'Tidak Tepat Waktu'),
(5, '2000018027', 'Arya Prio Winoto', 'Informatika', '7', '125', '3.58', '510', 'Tepat Waktu'),
(6, '2000018031', 'Wahyu Saputri', 'Informatika', '7', '125', '3.58', '448', 'Tepat Waktu'),
(7, '2000018032', 'Naufal Ghaly Azhar', 'Informatika', '7', '130', '3.36', '498', 'Tepat Waktu'),
(8, '2000018033', 'Elinda', 'Informatika', '6', '126', '3.68', '485', 'Tepat Waktu'),
(9, '2000018037', 'Riandha Yasmin Habibah', 'Informatika', '7', '125', '3.47', '469', 'Tepat Waktu'),
(10, '2000018039', 'Hario Jati Pamungkas', 'Informatika', '5', '127', '3.79', '410', 'Tepat Waktu'),
(11, '2000018040', 'Dinda Putri Dwi Yanti', 'Informatika', '8', '127', '3.75', '420', 'Tidak Tepat Waktu'),
(12, '2000018041', 'Gladish Rizka Puspita', 'Informatika', '6', '127', '3.88', '443', 'Tepat Waktu'),
(13, '2000018042', 'Herfansya Adiyoce Atmaja', 'Informatika', '6', '127', '3.82', '414', 'Tepat Waktu'),
(14, '2000018043', 'Ramadhani Ari Putra', 'Informatika', '6', '128', '3.9', '440', 'Tepat Waktu'),
(15, '2000018044', 'Desi Laura Safitri', 'Informatika', '6', '130', '3.61', '450', 'Tepat Waktu'),
(16, '2000018045', 'Imam Ramadhan', 'Informatika', '7', '130', '3.95', '461', 'Tepat Waktu'),
(17, '2000018046', 'Raihan Ahmad Hafidz', 'Informatika', '8', '130', '3.77', '495', 'Tidak Tepat Waktu'),
(18, '2000018047', 'Anang Nur Prasetya', 'Informatika', '6', '130', '4', '480', 'Tepat Waktu'),
(19, '2000018049', 'Inas Luthfianti Shaliha', 'Informatika', '6', '130', '3.79', '523', 'Tepat Waktu'),
(20, '2000018051', 'Muhammad Rifqi Zakaria', 'Informatika', '6', '130', '3.6', '480', 'Tepat Waktu'),
(21, '2000018052', 'Wisnu Nur Arya Saputra', 'Informatika', '6', '131', '3.29', '430', 'Tepat Waktu'),
(22, '2000018053', 'Abdullah Gymnastiar', 'Informatika', '6', '130', '3.65', '401', 'Tepat Waktu'),
(23, '2000018054', 'Aditya Fery Ardiansyah', 'Informatika', '8', '128', '2.5', '417', 'Tidak Tepat Waktu'),
(24, '2000018057', 'Arkan Fathoni', 'Informatika', '8', '131', '2.64', '461', 'Tidak Tepat Waktu'),
(25, '2000018058', 'Yoga Pradana Budiyanto', 'Informatika', '8', '130', '3.42', '455', 'Tidak Tepat Waktu'),
(26, '2000018059', 'Dyah Ayu Rosi Arsida Wardani', 'Informatika', '6', '131', '4', '442', 'Tepat Waktu'),
(27, '2000018060', 'Faza Husain Muhammad Zaen', 'Informatika', '6', '131', '3.76', '464', 'Tepat Waktu'),
(28, '2000018065', 'Muhamad Mulyana', 'Informatika', '6', '140', '3.56', '457', 'Tepat Waktu'),
(29, '2000018066', 'Anggun Fitriyanti', 'Informatika', '6', '130', '3.96', '510', 'Tepat Waktu'),
(30, '2000018070', 'Afina Cinta Putri Amanda', 'Informatika', '8', '130', '4', '498', 'Tidak Tepat Waktu'),
(31, '2000018071', 'Alfan Faviannaqii Zulfikar Mi', 'Informatika', '8', '125', '2.5', '442', 'Tidak Tepat Waktu'),
(32, '2000018072', 'M. Hasanuddin', 'Informatika', '8', '130', '2.58', '464', 'Tidak Tepat Waktu'),
(33, '2000018073', 'Andrew Ikhtisar Afiq', 'Informatika', '7', '126', '3.37', '457', 'Tepat Waktu'),
(34, '2000018074', 'Rexsi Dwi Yulianto', 'Informatika', '7', '125', '2.24', '510', 'Tepat Waktu'),
(35, '2000018075', 'Agis Satria Mandala', 'Informatika', '7', '127', '3.47', '448', 'Tepat Waktu'),
(36, '2000018079', 'M. Arfasekti Gustiano Avicenna', 'Informatika', '8', '127', '2.92', '498', 'Tidak Tepat Waktu'),
(37, '2000018081', 'Alifviro Wahyu Dwisamudra', 'Informatika', '7', '127', '3.33', '485', 'Tepat Waktu'),
(38, '2000018083', 'Alliya Intan Az Zahra Wibowo', 'Informatika', '7', '127', '3.91', '469', 'Tepat Waktu'),
(39, '2000018084', 'Elsty Awalia Septiani', 'Informatika', '8', '128', '3.58', '410', 'Tidak Tepat Waktu'),
(40, '2000018085', 'Herdian Shahzarandy', 'Informatika', '8', '130', '2.86', '420', 'Tidak Tepat Waktu'),
(41, '2000018088', 'Elsan Febrian', 'Informatika', '7', '130', '3.58', '443', 'Tepat Waktu'),
(42, '2000018089', 'Sahda Salsabil', 'Informatika', '7', '130', '3.95', '414', 'Tepat Waktu'),
(43, '2000018090', 'Muhammad Nafiz Aminuddin', 'Informatika', '8', '130', '3.12', '442', 'Tidak Tepat Waktu'),
(44, '2000018091', 'Fikri Faisal Fadillah', 'Informatika', '7', '130', '2.43', '464', 'Tepat Waktu'),
(45, '2000018093', 'Zahra Putri Zanuarti', 'Informatika', '7', '130', '4', '457', 'Tepat Waktu'),
(46, '2000018094', 'Rizdho Fattah Putra', 'Informatika', '7', '131', '2.97', '510', 'Tepat Waktu'),
(47, '2000018095', 'Indah Rafni Yuni Pratiwi', 'Informatika', '6', '127', '3.7', '448', 'Tepat Waktu'),
(48, '2000018096', 'Muhammad Fikrizza', 'Informatika', '8', '128', '3.58', '498', 'Tidak Tepat Waktu'),
(49, '2000018101', 'Iqbal Rilcardo', 'Informatika', '8', '130', '3', '485', 'Tidak Tepat Waktu'),
(50, '2000018103', 'Firdaus Diba Fahrezi', 'Informatika', '7', '130', '3.96', '469', 'Tepat Waktu'),
(51, '2000018104', 'Rifqi Abdillah Wicaksana', 'Informatika', '7', '130', '4', '410', 'Tepat Waktu'),
(52, '2000018105', 'Aldinna Wulan Anggraini', 'Informatika', '7', '130', '3.94', '420', 'Tepat Waktu'),
(53, '2000018106', 'Muhammad Nur Alfi Syahrin', 'Informatika', '8', '130', '3.81', '443', 'Tidak Tepat Waktu'),
(54, '2000018107', 'Muhammad Fahd Afghani Aridloi', 'Informatika', '8', '130', '2.1', '414', 'Tidak Tepat Waktu'),
(55, '2000018108', 'Reza Adiyat Dwi Kurniawan', 'Informatika', '7', '130', '3.95', '440', 'Tepat Waktu'),
(56, '2000018112', 'Khoiron Mahrus Sutrisno', 'Informatika', '8', '130', '2.24', '450', 'Tidak Tepat Waktu'),
(57, '2000018113', 'Atik Nur Karimah', 'Informatika', '7', '130', '3.7', '461', 'Tepat Waktu'),
(58, '2000018114', 'Rosyamdani', 'Informatika', '8', '131', '2.61', '495', 'Tidak Tepat Waktu'),
(59, '2000018115', 'Mayasari', 'Informatika', '7', '127', '3.76', '480', 'Tepat Waktu'),
(60, '2000018117', 'Aldi Haryanto', 'Informatika', '7', '128', '3.75', '464', 'Tepat Waktu'),
(61, '2000018118', 'Zahra Auliya Putri Diani', 'Informatika', '7', '130', '3.17', '457', 'Tepat Waktu'),
(62, '2000018121', 'Ardiansyah Latif', 'Informatika', '7', '130', '4', '510', 'Tepat Waktu'),
(63, '2000018122', 'Allisa Fadya Chairani', 'Informatika', '7', '125', '3.95', '448', 'Tepat Waktu'),
(64, '2000018124', 'Muhammad Mirza Alfaridzi', 'Informatika', '8', '130', '2.55', '498', 'Tidak Tepat Waktu'),
(65, '2000018125', 'Ansory', 'Informatika', '7', '126', '3.22', '485', 'Tepat Waktu'),
(66, '2000018126', 'Muhammad Arifin Hakim', 'Informatika', '7', '125', '3.38', '469', 'Tepat Waktu'),
(67, '2000018127', 'M. Bobbyzal Cendana. Ze', 'Informatika', '7', '127', '3.24', '410', 'Tepat Waktu'),
(68, '2000018129', 'Rayinda Ananda Pamungkas', 'Informatika', '7', '127', '3.53', '414', 'Tepat Waktu'),
(69, '2000018130', 'Wahyu', 'Informatika', '6', '127', '3.75', '440', 'Tepat Waktu'),
(70, '2000018131', 'Afif Nurwidianto', 'Informatika', '6', '127', '3.52', '450', 'Tepat Waktu'),
(71, '2000018132', 'Akmal Hafif Alkafi', 'Informatika', '7', '128', '3.7', '461', 'Tepat Waktu'),
(72, '2000018133', 'Fauziyah Zahrotul Ummah', 'Informatika', '7', '130', '3.57', '495', 'Tepat Waktu'),
(73, '2000018134', 'Akbar Taufik Ramadhan', 'Informatika', '7', '130', '3.51', '480', 'Tepat Waktu'),
(74, '2000018135', 'Rinday Zildjiani Salji', 'Informatika', '7', '126', '4', '464', 'Tepat Waktu'),
(75, '2000018137', 'Muhamad Khairon Riskullah', 'Informatika', '6', '125', '3.28', '457', 'Tepat Waktu'),
(76, '2000018138', 'Deni Alfian Khaulany', 'Informatika', '8', '127', '2.9', '510', 'Tidak Tepat Waktu'),
(77, '2000018139', 'Fachri Ahmad Fauzi', 'Informatika', '7', '128', '3.37', '498', 'Tepat Waktu'),
(78, '2000018141', 'Silfa', 'Informatika', '7', '130', '3.42', '485', 'Tepat Waktu'),
(79, '2000018142', 'Lazuardi Imam Santosa', 'Informatika', '7', '130', '3.93', '469', 'Tepat Waktu'),
(80, '2000018143', 'Fandhika Azhar', 'Informatika', '8', '126', '2.15', '410', 'Tidak Tepat Waktu'),
(81, '2000018145', 'Irfannullah', 'Informatika', '8', '125', '2.89', '414', 'Tidak Tepat Waktu'),
(82, '2000018146', 'Muhammad Avila Landry', 'Informatika', '7', '126', '3.58', '440', 'Tepat Waktu'),
(83, '2000018147', 'Ilhamsyah Osmar', 'Informatika', '7', '126', '3.5', '450', 'Tepat Waktu'),
(84, '2000018148', 'Alfi Syahri', 'Informatika', '7', '130', '2.61', '461', 'Tepat Waktu'),
(85, '2000018149', 'Maulana Asyrafil Anam', 'Informatika', '7', '127', '3.74', '495', 'Tepat Waktu'),
(86, '2000018150', 'Imam Rifa\'ah', 'Informatika', '8', '125', '2.9', '457', 'Tidak Tepat Waktu'),
(87, '2000018151', 'Muhammad Ghazi Ahnafi', 'Informatika', '8', '125', '2.77', '510', 'Tidak Tepat Waktu'),
(88, '2000018153', 'Farras Husain', 'Informatika', '6', '130', '3.72', '498', 'Tepat Waktu'),
(89, '2000018154', 'Widiyanto Firmansyah', 'Informatika', '6', '126', '2.89', '485', 'Tepat Waktu'),
(90, '2000018156', 'Sindi Rella', 'Informatika', '6', '125', '3.93', '469', 'Tepat Waktu'),
(91, '2000018157', 'Bagas Saputra', 'Informatika', '7', '127', '3.07', '410', 'Tepat Waktu'),
(92, '2000018159', 'Waldi Darmansyah', 'Informatika', '7', '127', '3.7', '414', 'Tepat Waktu'),
(93, '2000018160', 'Daffa Alif Murtaja', 'Informatika', '7', '125', '3.9', '440', 'Tepat Waktu'),
(94, '2000018163', 'Anabela Aji Prakasa', 'Informatika', '7', '130', '3.77', '450', 'Tepat Waktu'),
(95, '2000018165', 'Fahrizal Adji Sya\'bani', 'Informatika', '7', '126', '3.72', '500', 'Tepat Waktu'),
(96, '2000018166', 'Muhammad Izza Nur Hakima', 'Informatika', '8', '126', '3.62', '440', 'Tidak Tepat Waktu'),
(97, '2000018170', 'Farisna Hamid Jabbar', 'Informatika', '7', '126', '3.93', '450', 'Tepat Waktu'),
(98, '2000018172', 'Gugun Yudiana', 'Informatika', '8', '130', '2.43', '461', 'Tidak Tepat Waktu'),
(99, '2000018174', 'Muhammad Faris Rizaldi', 'Informatika', '7', '127', '3.87', '495', 'Tepat Waktu'),
(100, '2000018175', 'Rasyid Rahman', 'Informatika', '8', '125', '2.8', '480', 'Tidak Tepat Waktu'),
(101, '2000018176', 'Akmalurrizqi Fudzni', 'Informatika', '6', '125', '3.57', '464', 'Tepat Waktu'),
(102, '2000018177', 'Laila Sekar Gupita', 'Informatika', '6', '130', '3.67', '457', 'Tepat Waktu'),
(103, '2000018178', 'Fahrizal Shofyan Aziz', 'Informatika', '7', '126', '3.92', '510', 'Tepat Waktu'),
(104, '2000018180', 'Hikmatuz Zahra', 'Informatika', '7', '125', '3.95', '498', 'Tepat Waktu'),
(105, '2000018182', 'Muhammad Sultan Reza Aditya Nurrahman', 'Informatika', '7', '127', '3.67', '485', 'Tepat Waktu'),
(106, '2000018188', 'Salma Adynda Saputri', 'Informatika', '7', '127', '4', '469', 'Tepat Waktu'),
(107, '2000018189', 'Rahmat Hidayat', 'Informatika', '6', '127', '3.86', '410', 'Tepat Waktu'),
(108, '2000018190', 'Amar Al Fatah', 'Informatika', '8', '128', '3.83', '414', 'Tidak Tepat Waktu'),
(109, '2000018193', 'Rosila', 'Informatika', '7', '130', '3.88', '440', 'Tepat Waktu'),
(110, '2000018194', 'Munazzad Risky M. Ways', 'Informatika', '7', '130', '3.14', '450', 'Tepat Waktu'),
(111, '2000018196', 'Adisti Oktaviana Dewi', 'Informatika', '7', '130', '3.58', '461', 'Tepat Waktu'),
(112, '2000018200', 'Syariefan Muhammad', 'Informatika', '8', '130', '3.3', '495', 'Tidak Tepat Waktu'),
(113, '2000018201', 'Taufiq Aditya Putra', 'Informatika', '7', '130', '4', '442', 'Tepat Waktu'),
(114, '2000018202', 'Muhammad Raihandaffa Dzikrianasa', 'Informatika', '7', '130', '3.74', '464', 'Tepat Waktu'),
(115, '2000018204', 'Muhammad Asyam Dirhamsyah', 'Informatika', '7', '131', '3.88', '457', 'Tepat Waktu'),
(116, '2000018205', 'Muhammad Ferry Munandar', 'Informatika', '7', '130', '3.54', '510', 'Tepat Waktu'),
(117, '2000018206', 'Duwi Oktoviyanti', 'Informatika', '7', '128', '3.79', '448', 'Tepat Waktu'),
(118, '2000018209', 'Vintya Dewi Anjani', 'Informatika', '7', '131', '3.84', '498', 'Tepat Waktu'),
(119, '2000018210', 'Rafif Nugie Indrasta', 'Informatika', '7', '130', '3.53', '400', 'Tepat Waktu');

-- --------------------------------------------------------

--
-- Table structure for table `kimia`
--

CREATE TABLE `kimia` (
  `id_kimia` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `nim` varchar(250) NOT NULL,
  `prodi` varchar(250) NOT NULL,
  `lama_penulisan` varchar(250) NOT NULL,
  `sks` varchar(250) NOT NULL,
  `ipk` varchar(250) NOT NULL,
  `toefl` varchar(250) NOT NULL,
  `class` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tekpang`
--

CREATE TABLE `tekpang` (
  `id_tp` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `nim` varchar(250) NOT NULL,
  `prodi` varchar(250) NOT NULL,
  `lama_penulisan` varchar(250) NOT NULL,
  `sks` varchar(250) NOT NULL,
  `ipk` varchar(250) NOT NULL,
  `toefl` varchar(250) NOT NULL,
  `class` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `posisi` enum('Tata Usaha','Prodi','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `posisi`) VALUES
(2, 'Tegar Aji', 'tegaraji@gmail.com', '$2b$12$kmJnw2MmxfLDQPWqiWYsn.CF05rJo0rkIIUJwp1F05I/mAJEeQ7tq', 'Prodi'),
(3, 'dita islamiati', 'intadita24@gmail.com', '$2b$12$vePJDH8CmjQGzDWM/scy8uMgvjPvS5DqcCrz6.jrAcwljSs.a502G', 'Tata Usaha');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `elektro`
--
ALTER TABLE `elektro`
  ADD PRIMARY KEY (`id_elektro`);

--
-- Indexes for table `industri`
--
ALTER TABLE `industri`
  ADD PRIMARY KEY (`id_ind`);

--
-- Indexes for table `informatika`
--
ALTER TABLE `informatika`
  ADD PRIMARY KEY (`id_infor`);

--
-- Indexes for table `kimia`
--
ALTER TABLE `kimia`
  ADD PRIMARY KEY (`id_kimia`);

--
-- Indexes for table `tekpang`
--
ALTER TABLE `tekpang`
  ADD PRIMARY KEY (`id_tp`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `elektro`
--
ALTER TABLE `elektro`
  MODIFY `id_elektro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `industri`
--
ALTER TABLE `industri`
  MODIFY `id_ind` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `informatika`
--
ALTER TABLE `informatika`
  MODIFY `id_infor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `kimia`
--
ALTER TABLE `kimia`
  MODIFY `id_kimia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tekpang`
--
ALTER TABLE `tekpang`
  MODIFY `id_tp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
