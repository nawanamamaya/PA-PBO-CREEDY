-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 07, 2026 at 10:59 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pa_creedy`
--

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `cabang_id` varchar(10) NOT NULL,
  `nama_cabang` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`cabang_id`, `nama_cabang`, `alamat`, `no_telepon`) VALUES
('CBG001', 'Cabang Surabaya Pusat', 'Jl. Basuki Rahmat No. 45, Surabaya', '03153412345'),
('CBG002', 'Cabang Sidoarjo', 'Jl. Pahlawan No. 12, Sidoarjo', '0318921567'),
('CBG003', 'Cabang Malang', 'Jl. Jenderal Basuki Rahmat No. 8, Malang', '0341362999'),
('CBG004', 'Cabang Gresik', 'Jl. Dr. Wahidin Sudirohusodo No. 30, Gresik', '0313950412'),
('CBG005', 'Cabang Mojokerto', 'Jl. Majapahit No. 21, Mojokerto', '0321321876'),
('CBG006', 'Cabang Pasuruan', 'Jl. Panglima Sudirman No. 17, Pasuruan', '0343421098'),
('CBG007', 'Cabang Kediri', 'Jl. Dhoho No. 54, Kediri', '0354687321'),
('CBG008', 'Cabang Jember', 'Jl. Gajah Mada No. 63, Jember', '03314876505'),
('CBG009', 'Cabang Banyuwangi', 'Jl. Jenderal Ahmad Yani No. 99, Banyuwangi', '085678967897'),
('CBG010', 'Cabang Madiun', 'Jl. Pahlawan No. 5, Madiun', '0351462318'),
('CBG011', 'Cabang Samarinda', 'Jl. Jenderal Sudirman No. 10, Samarinda', '0541731001'),
('CBG012', 'Cabang Balikpapan', 'Jl. Ahmad Yani No. 20, Balikpapan', '0542731002'),
('CBG013', 'Cabang Tenggarong', 'Jl. Diponegoro No. 15, Tenggarong', '0541731003'),
('CBG014', 'Cabang Bontang', 'Jl. MT Haryono No. 25, Bontang', '0548731004'),
('CBG015', 'Cabang Berau', 'Jl. Pulau Derawan No. 5, Tanjung Redeb', '0554731005'),
('CBG016', 'Cabang Spanyol', 'Barcelona, jalan jendral sudirman no.21', '085348640485'),
('CBG017', 'Cabang Arab', 'Barcelona, jalan jendral sudirman no.21', '085348640485213');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_angsuran`
--

CREATE TABLE `jadwal_angsuran` (
  `angsuran_id` varchar(10) NOT NULL,
  `sisa_angsuran` int NOT NULL,
  `tanggal_jatuh_tempo` date NOT NULL,
  `pokok_angsuran` decimal(15,2) NOT NULL,
  `bunga_angsuran` decimal(15,2) NOT NULL,
  `denda` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status_pembayaran` enum('Belum Bayar','Lunas','Terlambat') NOT NULL DEFAULT 'Belum Bayar',
  `pinjaman_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jadwal_angsuran`
--

INSERT INTO `jadwal_angsuran` (`angsuran_id`, `sisa_angsuran`, `tanggal_jatuh_tempo`, `pokok_angsuran`, `bunga_angsuran`, `denda`, `status_pembayaran`, `pinjaman_id`) VALUES
('ANG001', 5, '2026-01-20', '5000000.00', '337500.00', '0.00', 'Lunas', 'PNJ001'),
('ANG002', 4, '2026-02-20', '5000000.00', '337500.00', '0.00', 'Lunas', 'PNJ001'),
('ANG003', 3, '2026-03-20', '5000000.00', '337500.00', '0.00', 'Lunas', 'PNJ001'),
('ANG004', 2, '2026-04-20', '5000000.00', '337500.00', '0.00', 'Lunas', 'PNJ001'),
('ANG005', 1, '2026-05-20', '5000000.00', '337500.00', '0.00', 'Lunas', 'PNJ001'),
('ANG006', 0, '2026-06-20', '5000000.00', '337500.00', '0.00', 'Lunas', 'PNJ001'),
('ANG007', 5, '2026-01-19', '3333333.00', '225000.00', '0.00', 'Lunas', 'PNJ002'),
('ANG008', 4, '2026-02-19', '3333333.00', '225000.00', '0.00', 'Lunas', 'PNJ002'),
('ANG009', 3, '2026-03-19', '3333333.00', '225000.00', '0.00', 'Lunas', 'PNJ002'),
('ANG010', 2, '2026-04-19', '3333333.00', '225000.00', '0.00', 'Lunas', 'PNJ002');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `nik` varchar(20) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `npwp` varchar(20) DEFAULT NULL,
  `tipe_nasabah` enum('Perorangan','Badan Usaha') NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `tanggal_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`nik`, `user_id`, `npwp`, `tipe_nasabah`, `alamat`, `no_telepon`, `tanggal_daftar`) VALUES
('2509116074151617', 'USR94090', '', 'Perorangan', 'Penajam', '0854535251', '2026-11-06'),
('6471010101010101', 'USR061', NULL, 'Perorangan', 'Jl. Mawar No. 1, Samarinda', '081200000001', '2026-01-05'),
('6471010101010102', 'USR062', NULL, 'Perorangan', 'Jl. Melati No. 2, Samarinda', '081200000002', '2026-01-07'),
('6471010101010103', 'USR063', NULL, 'Perorangan', 'Jl. Anggrek No. 3, Samarinda', '081200000003', '2026-01-10'),
('6471010101010104', 'USR064', NULL, 'Perorangan', 'Jl. Kenanga No. 4, Balikpapan', '081200000004', '2026-01-12'),
('6471010101010105', 'USR065', NULL, 'Perorangan', 'Jl. Diponegoro No. 5, Balikpapan', '081200000005', '2026-01-15'),
('6471010101010106', 'USR066', NULL, 'Perorangan', 'Jl. Ahmad Yani No. 6, Balikpapan', '081200000006', '2026-01-18'),
('6471010101010107', 'USR067', NULL, 'Perorangan', 'Jl. Pahlawan No. 7, Tenggarong', '081200000007', '2026-01-20'),
('6471010101010108', 'USR068', NULL, 'Perorangan', 'Jl. Merdeka No. 8, Tenggarong', '081200000008', '2026-01-22'),
('6471010101010109', 'USR069', NULL, 'Perorangan', 'Jl. Pelita No. 9, Tenggarong', '081200000009', '2026-01-25'),
('6471010101010110', 'USR070', NULL, 'Perorangan', 'Jl. Cendana No. 10, Bontang', '081200000010', '2026-02-01'),
('6471010101010111', 'USR071', NULL, 'Perorangan', 'Jl. Sawo No. 11, Bontang', '081200000011', '2026-02-03'),
('6471010101010112', 'USR072', NULL, 'Perorangan', 'Jl. Kamboja No. 12, Bontang', '081200000012', '2026-02-05'),
('6471010101010113', 'USR073', NULL, 'Perorangan', 'Jl. Gajah Mada No. 13, Berau', '081200000013', '2026-02-08'),
('6471010101010114', 'USR074', NULL, 'Perorangan', 'Jl. Kartini No. 14, Berau', '081200000014', '2026-02-10'),
('6471010101010115', 'USR075', NULL, 'Perorangan', 'Jl. Niaga No. 15, Berau', '081200000015', '2026-02-12'),
('6471010101010131', 'USR031', '42.726.370.2-616.000', 'Perorangan', 'Jl. Anggrek No. 11, Surabaya', '085540773870', '2023-01-15'),
('6471010101010132', 'USR032', '11.488.722.8-946.000', 'Perorangan', 'Jl. Kenanga No. 28, Surabaya', '081018903664', '2023-05-22'),
('6471010101010133', 'USR033', '51.269.425.2-547.000', 'Perorangan', 'Jl. Pemuda No. 68, Surabaya', '087457901208', '2024-12-19'),
('6471010101010134', 'USR034', '57.897.793.5-638.000', 'Perorangan', 'Jl. Melati No. 90, Sidoarjo', '082993191140', '2026-02-04'),
('6471010101010135', 'USR035', '80.303.245.0-679.000', 'Perorangan', 'Jl. Sudirman No. 32, Sidoarjo', '083734155185', '2023-02-19'),
('6471010101010136', 'USR036', NULL, 'Perorangan', 'Jl. Kartini No. 80, Sidoarjo', '083077078519', '2026-03-01'),
('6471010101010137', 'USR037', NULL, 'Perorangan', 'Jl. Kartini No. 1, Malang', '086329170639', '2024-09-02'),
('6471010101010138', 'USR038', NULL, 'Perorangan', 'Jl. Veteran No. 109, Malang', '081784576209', '2026-05-22'),
('6471010101010139', 'USR039', NULL, 'Perorangan', 'Jl. Diponegoro No. 41, Malang', '087707029300', '2025-09-28'),
('6471010101010140', 'USR040', '40.252.431.2-870.000', 'Badan Usaha', 'Jl. Kenanga No. 142, Gresik', '088178080450', '2023-11-27'),
('6471010101010141', 'USR041', '07.024.587.3-633.000', 'Badan Usaha', 'Jl. Diponegoro No. 30, Gresik', '080511448714', '2025-07-18'),
('6471010101010142', 'USR042', '03.138.898.4-967.000', 'Badan Usaha', 'Jl. Merdeka No. 104, Gresik', '084204690101', '2024-10-11'),
('6471010101010143', 'USR043', NULL, 'Perorangan', 'Jl. Merdeka No. 14, Mojokerto', '086931353589', '2024-11-13'),
('6471010101010144', 'USR044', '72.877.825.5-382.000', 'Perorangan', 'Jl. Melati No. 72, Mojokerto', '088422535350', '2023-03-14'),
('6471010101010145', 'USR045', '80.892.826.9-464.000', 'Perorangan', 'Jl. Anggrek No. 29, Mojokerto', '089401040470', '2026-05-09'),
('6471010101010146', 'USR046', '43.317.656.5-287.000', 'Perorangan', 'Jl. Cendana No. 92, Pasuruan', '083610813810', '2024-02-14'),
('6471010101010147', 'USR047', '36.245.249.6-733.000', 'Badan Usaha', 'Jl. Ahmad Yani No. 129, Pasuruan', '089202061305', '2023-12-02'),
('6471010101010148', 'USR048', NULL, 'Perorangan', 'Jl. Ahmad Yani No. 87, Pasuruan', '082158364432', '2025-08-17'),
('6471010101010149', 'USR049', NULL, 'Perorangan', 'Jl. Veteran No. 64, Kediri', '083161665740', '2023-10-07'),
('6471010101010150', 'USR050', '84.205.985.8-543.000', 'Perorangan', 'Jl. Ahmad Yani No. 93, Kediri', '087668297890', '2024-12-10'),
('6471010101010151', 'USR051', '25.296.733.9-674.000', 'Perorangan', 'Jl. Cendana No. 113, Kediri', '086591615901', '2023-12-01'),
('6471010101010152', 'USR052', '52.437.636.0-640.000', 'Badan Usaha', 'Jl. Pemuda No. 7, Jember', '088804707615', '2025-12-31'),
('6471010101010153', 'USR053', '04.513.432.8-828.000', 'Perorangan', 'Jl. Merdeka No. 17, Jember', '088207597570', '2024-01-29'),
('6471010101010154', 'USR054', NULL, 'Perorangan', 'Jl. Merdeka No. 8, Jember', '088822078353', '2024-08-23'),
('6471010101010155', 'USR055', '88.657.757.4-137.000', 'Perorangan', 'Jl. Melati No. 48, Banyuwangi', '089378803189', '2023-05-03'),
('6471010101010156', 'USR056', '35.053.255.8-120.000', 'Badan Usaha', 'Jl. Ahmad Yani No. 3, Banyuwangi', '081927155480', '2023-10-07'),
('6471010101010157', 'USR057', NULL, 'Perorangan', 'Jl. Sudirman No. 18, Banyuwangi', '085985293333', '2026-02-02'),
('6471010101010158', 'USR058', NULL, 'Perorangan', 'Jl. Melati No. 3, Madiun', '082086197863', '2024-12-20'),
('6471010101010159', 'USR059', '91.329.060.0-671.000', 'Perorangan', 'Jl. Pemuda No. 98, Madiun', '083492849300', '2023-07-09'),
('6471010101010160', 'USR060', '09.557.587.3-228.000', 'Perorangan', 'Jl. Kartini No. 51, Madiun', '083715479710', '2026-04-11'),
('6471010101010176', 'USR076', NULL, 'Perorangan', 'Jl. Flamboyan No. 1, Surabaya', '081200000076', '2026-02-15'),
('6471010101010177', 'USR077', NULL, 'Perorangan', 'Jl. Dahlia No. 2, Sidoarjo', '081200000077', '2026-02-16'),
('6471010101010178', 'USR078', NULL, 'Perorangan', 'Jl. Teratai No. 3, Malang', '081200000078', '2026-02-17'),
('6471010101010179', 'USR079', NULL, 'Perorangan', 'Jl. Sakura No. 4, Gresik', '081200000079', '2026-02-18'),
('6471010101010180', 'USR080', NULL, 'Perorangan', 'Jl. Tulip No. 5, Mojokerto', '081200000080', '2026-02-19'),
('6471010101010181', 'USR081', NULL, 'Perorangan', 'Jl. Asoka No. 6, Pasuruan', '081200000081', '2026-02-20'),
('6471010101010182', 'USR082', NULL, 'Perorangan', 'Jl. Bougainville No. 7, Kediri', '081200000082', '2026-02-21'),
('6471010101010183', 'USR083', NULL, 'Perorangan', 'Jl. Kaktus No. 8, Jember', '081200000083', '2026-02-22'),
('6471010101010184', 'USR084', NULL, 'Perorangan', 'Jl. Palm No. 9, Banyuwangi', '081200000084', '2026-02-23'),
('6471010101010185', 'USR085', NULL, 'Perorangan', 'Jl. Pinus No. 10, Madiun', '081200000085', '2026-02-24');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(18) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `jabatan` varchar(200) NOT NULL,
  `cabang_id` varchar(10) NOT NULL,
  `batas_persetujuan` enum('Rp0','100 Juta','500 Juta') NOT NULL DEFAULT 'Rp0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `user_id`, `jabatan`, `cabang_id`, `batas_persetujuan`) VALUES
('12435252552532434', 'USR101', 'Teller', 'CBG001', '100 Juta'),
('198801012020011001', 'USR001', 'Admin', 'CBG001', 'Rp0'),
('198801012020011002', 'USR007', 'Teller', 'CBG003', 'Rp0'),
('198801012020011004', 'USR004', 'Admin', 'CBG002', 'Rp0'),
('198801012020011010', 'USR010', 'Admin', 'CBG004', 'Rp0'),
('198801012020011013', 'USR013', 'Admin', 'CBG005', 'Rp0'),
('198801012020011019', 'USR019', 'Admin', 'CBG007', 'Rp0'),
('198801012020011022', 'USR022', 'Admin', 'CBG008', 'Rp0'),
('198801012020011025', 'USR025', 'Admin', 'CBG009', 'Rp0'),
('198801012020011028', 'USR028', 'Admin', 'CBG010', 'Rp0'),
('198801012020011040', 'USR016', 'Teller', 'CBG006', 'Rp0'),
('198801012020011086', 'USR086', 'Admin', 'CBG011', 'Rp0'),
('198801012020011089', 'USR089', 'Admin', 'CBG012', 'Rp0'),
('198801012020011092', 'USR092', 'Admin', 'CBG013', 'Rp0'),
('198801012020011095', 'USR095', 'Admin', 'CBG014', 'Rp0'),
('198801012020011098', 'USR098', 'Admin', 'CBG015', 'Rp0'),
('199002022020012002', 'USR002', 'Teller', 'CBG001', '100 Juta'),
('199002022020012005', 'USR005', 'Teller', 'CBG002', '100 Juta'),
('199002022020012008', 'USR008', 'Teller', 'CBG003', '100 Juta'),
('199002022020012011', 'USR011', 'Teller', 'CBG004', '100 Juta'),
('199002022020012014', 'USR014', 'Teller', 'CBG005', '100 Juta'),
('199002022020012017', 'USR017', 'Teller', 'CBG006', '100 Juta'),
('199002022020012020', 'USR020', 'Teller', 'CBG007', '100 Juta'),
('199002022020012023', 'USR023', 'Teller', 'CBG008', '100 Juta'),
('199002022020012026', 'USR026', 'Teller', 'CBG009', '100 Juta'),
('199002022020012029', 'USR029', 'Teller', 'CBG010', '100 Juta'),
('199002022020012087', 'USR087', 'Teller', 'CBG011', '100 Juta'),
('199002022020012090', 'USR090', 'Teller', 'CBG012', '100 Juta'),
('199002022020012093', 'USR093', 'Teller', 'CBG013', '100 Juta'),
('199002022020012096', 'USR096', 'Teller', 'CBG014', '100 Juta'),
('199002022020012099', 'USR099', 'Teller', 'CBG015', '100 Juta'),
('199103032020011003', 'USR003', 'Petugas Kredit', 'CBG001', '500 Juta'),
('199103032020011006', 'USR006', 'Petugas Kredit', 'CBG002', '500 Juta'),
('199103032020011009', 'USR009', 'Petugas Kredit', 'CBG003', '500 Juta'),
('199103032020011012', 'USR012', 'Petugas Kredit', 'CBG004', '500 Juta'),
('199103032020011015', 'USR015', 'Petugas Kredit', 'CBG005', '500 Juta'),
('199103032020011018', 'USR018', 'Petugas Kredit', 'CBG006', '500 Juta'),
('199103032020011021', 'USR021', 'Petugas Kredit', 'CBG007', '500 Juta'),
('199103032020011024', 'USR024', 'Petugas Kredit', 'CBG008', '500 Juta'),
('199103032020011027', 'USR027', 'Petugas Kredit', 'CBG009', '500 Juta'),
('199103032020011030', 'USR030', 'Petugas Kredit', 'CBG010', '500 Juta'),
('199103032020011088', 'USR088', 'Petugas Kredit', 'CBG011', '500 Juta'),
('199103032020011091', 'USR091', 'Petugas Kredit', 'CBG012', '500 Juta'),
('199103032020011094', 'USR094', 'Petugas Kredit', 'CBG013', '500 Juta'),
('199103032020011097', 'USR097', 'Petugas Kredit', 'CBG014', '500 Juta'),
('199103032020011100', 'USR100', 'Petugas Kredit', 'CBG015', '500 Juta');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `pinjaman_id` varchar(10) NOT NULL,
  `jumlah_pinjaman` decimal(15,2) NOT NULL,
  `tenor_bulan` int NOT NULL,
  `suku_bunga` decimal(5,2) NOT NULL,
  `tujuan_pinjaman` varchar(200) NOT NULL,
  `skor_kelayakan` decimal(5,2) NOT NULL,
  `status` enum('Diajukan','Disetujui','Ditolak','Aktif','Lunas') NOT NULL DEFAULT 'Diajukan',
  `tanggal_pengajuan` date NOT NULL,
  `tanggal_keputusan` date DEFAULT NULL,
  `catatan_keputusan` varchar(200) DEFAULT NULL,
  `tanggal_cair` date DEFAULT NULL,
  `nasabah_user_id` varchar(10) NOT NULL,
  `pegawai_user_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`pinjaman_id`, `jumlah_pinjaman`, `tenor_bulan`, `suku_bunga`, `tujuan_pinjaman`, `skor_kelayakan`, `status`, `tanggal_pengajuan`, `tanggal_keputusan`, `catatan_keputusan`, `tanggal_cair`, `nasabah_user_id`, `pegawai_user_id`) VALUES
('PNJ001', '30000000.00', 6, '13.50', 'Modal usaha toko online', '72.76', 'Lunas', '2025-12-14', '2025-12-17', 'Disetujui dengan agunan sesuai ketentuan', '2025-12-20', 'USR054', 'USR012'),
('PNJ002', '20000000.00', 6, '13.50', 'Pembelian mesin produksi', '69.57', 'Lunas', '2025-12-15', '2025-12-18', 'Disetujui, penghasilan stabil dan riwayat baik', '2025-12-19', 'USR041', 'USR018'),
('PNJ003', '60000000.00', 6, '7.50', 'Biaya pengobatan keluarga', '70.96', 'Lunas', '2025-12-22', '2025-12-26', 'Disetujui, penghasilan stabil dan riwayat baik', '2025-12-28', 'USR061', 'USR015'),
('PNJ004', '150000000.00', 6, '8.00', 'Pembelian peralatan usaha', '67.52', 'Lunas', '2025-12-27', '2026-01-01', 'Disetujui sesuai skor kelayakan dan analisis kredit', '2026-01-04', 'USR046', 'USR003'),
('PNJ005', '75000000.00', 3, '10.00', 'Modal usaha kuliner', '76.88', 'Lunas', '2026-01-02', '2026-01-06', 'Disetujui sesuai skor kelayakan dan analisis kredit', '2026-01-08', 'USR050', 'USR021'),
('PNJ006', '200000000.00', 6, '12.00', 'Pembelian peralatan usaha', '84.36', 'Lunas', '2026-01-05', '2026-01-09', 'Disetujui sesuai skor kelayakan dan analisis kredit', '2026-01-11', 'USR058', 'USR024'),
('PNJ007', '200000000.00', 18, '12.00', 'Biaya pengobatan keluarga', '94.71', 'Aktif', '2026-06-19', '2026-06-23', 'Disetujui, penghasilan stabil dan riwayat baik', '2026-06-27', 'USR069', 'USR006'),
('PNJ008', '20000000.00', 12, '8.50', 'Modal usaha kuliner', '67.08', 'Aktif', '2026-06-23', '2026-06-26', 'Disetujui sesuai skor kelayakan dan analisis kredit', '2026-06-29', 'USR032', 'USR015'),
('PNJ009', '40000000.00', 36, '13.50', 'Biaya pernikahan', '72.71', 'Aktif', '2026-06-25', '2026-07-01', 'Disetujui sesuai skor kelayakan dan analisis kredit', '2026-07-04', 'USR051', 'USR021'),
('PNJ010', '75000000.00', 12, '10.50', 'Pembelian kendaraan bekas', '83.25', 'Aktif', '2026-06-28', '2026-07-01', 'Disetujui dengan agunan sesuai ketentuan', '2026-07-04', 'USR050', 'USR021');

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `nomor_rekening` varchar(20) NOT NULL,
  `jenis_rekening` enum('Tabungan','Giro','Deposito') NOT NULL,
  `saldo` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status_rekening` enum('Aktif','Dormant','Ditutup') NOT NULL DEFAULT 'Aktif',
  `tanggal_buka` date NOT NULL,
  `tanggal_tutup` date DEFAULT NULL,
  `cabang_id` varchar(10) NOT NULL,
  `nasabah_user_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`nomor_rekening`, `jenis_rekening`, `saldo`, `status_rekening`, `tanggal_buka`, `tanggal_tutup`, `cabang_id`, `nasabah_user_id`) VALUES
('1001000001', 'Tabungan', '15000000.00', 'Aktif', '2023-01-15', NULL, 'CBG001', 'USR031'),
('1001000002', 'Giro', '50000000.00', 'Aktif', '2023-05-22', NULL, 'CBG001', 'USR032'),
('1001000003', 'Tabungan', '12500000.00', 'Aktif', '2024-12-19', NULL, 'CBG001', 'USR033'),
('1001000004', 'Tabungan', '8500000.00', 'Aktif', '2026-02-04', NULL, 'CBG001', 'USR034'),
('1001000005', 'Deposito', '100000000.00', 'Aktif', '2023-02-19', NULL, 'CBG001', 'USR035'),
('1001000006', 'Tabungan', '3000000.00', 'Aktif', '2026-03-01', NULL, 'CBG001', 'USR036'),
('1001000007', 'Tabungan', '7500000.00', 'Aktif', '2024-09-02', NULL, 'CBG001', 'USR037'),
('1001000008', 'Giro', '25000000.00', 'Aktif', '2026-05-22', NULL, 'CBG001', 'USR038'),
('1001000009', 'Tabungan', '4200000.00', 'Aktif', '2025-09-28', NULL, 'CBG001', 'USR039'),
('1001000010', 'Deposito', '75000000.00', 'Aktif', '2023-11-27', NULL, 'CBG001', 'USR040'),
('1001000011', 'Tabungan', '6300000.00', 'Aktif', '2025-07-18', NULL, 'CBG001', 'USR041'),
('1001000012', 'Tabungan', '9100000.00', 'Aktif', '2024-10-11', NULL, 'CBG001', 'USR042'),
('1001000013', 'Tabungan', '2200000.00', 'Aktif', '2024-11-13', NULL, 'CBG001', 'USR043'),
('1001000014', 'Tabungan', '18000000.00', 'Aktif', '2023-03-14', NULL, 'CBG001', 'USR044'),
('1001000015', 'Giro', '45000000.00', 'Aktif', '2026-02-15', NULL, 'CBG001', 'USR076'),
('1002000001', 'Tabungan', '11000000.00', 'Aktif', '2026-05-09', NULL, 'CBG002', 'USR045'),
('1002000002', 'Tabungan', '14800000.00', 'Aktif', '2024-02-14', NULL, 'CBG002', 'USR046'),
('1002000003', 'Giro', '124950000.00', 'Aktif', '2023-12-02', NULL, 'CBG002', 'USR047'),
('1002000004', 'Tabungan', '16500000.00', 'Aktif', '2025-08-17', NULL, 'CBG002', 'USR048'),
('1002000005', 'Tabungan', '5500000.00', 'Aktif', '2023-10-07', NULL, 'CBG002', 'USR049'),
('1002000006', 'Deposito', '200000000.00', 'Aktif', '2024-12-10', NULL, 'CBG002', 'USR050'),
('1002000007', 'Tabungan', '3200000.00', 'Aktif', '2023-12-01', NULL, 'CBG002', 'USR051'),
('1002000008', 'Giro', '85000000.00', 'Aktif', '2025-12-31', NULL, 'CBG002', 'USR052'),
('1002000009', 'Tabungan', '7800000.00', 'Aktif', '2024-01-29', NULL, 'CBG002', 'USR053'),
('1002000010', 'Tabungan', '286300000.00', 'Aktif', '2024-08-23', NULL, 'CBG002', 'USR054'),
('1002000011', 'Tabungan', '53233334.00', 'Aktif', '2023-05-03', NULL, 'CBG002', 'USR055'),
('1002000012', 'Giro', '285508333.00', 'Aktif', '2023-10-07', NULL, 'CBG002', 'USR056'),
('1002000013', 'Tabungan', '18100000.00', 'Aktif', '2026-02-02', NULL, 'CBG002', 'USR057'),
('1002000014', 'Tabungan', '700002.00', 'Aktif', '2024-12-20', NULL, 'CBG002', 'USR058'),
('1002000015', 'Tabungan', '12000000.00', 'Aktif', '2026-02-16', NULL, 'CBG002', 'USR077'),
('1003000001', 'Tabungan', '300000.00', 'Dormant', '2023-07-09', NULL, 'CBG003', 'USR059'),
('1003000002', 'Tabungan', '12700000.00', 'Aktif', '2026-04-11', NULL, 'CBG003', 'USR060'),
('1003000003', 'Tabungan', '8287502.00', 'Aktif', '2026-01-05', NULL, 'CBG003', 'USR061'),
('1003000004', 'Tabungan', '12608334.00', 'Aktif', '2026-01-07', NULL, 'CBG003', 'USR062'),
('1003000005', 'Tabungan', '500000.00', 'Dormant', '2026-01-10', NULL, 'CBG003', 'USR063'),
('1003000006', 'Tabungan', '37550000.00', 'Aktif', '2026-01-12', NULL, 'CBG003', 'USR064'),
('1003000007', 'Tabungan', '25850000.00', 'Aktif', '2026-01-15', NULL, 'CBG003', 'USR065'),
('1003000008', 'Tabungan', '29300000.00', 'Aktif', '2026-01-18', NULL, 'CBG003', 'USR066'),
('1003000009', 'Tabungan', '5150000.00', 'Aktif', '2026-01-20', NULL, 'CBG003', 'USR067'),
('1003000010', 'Giro', '138850000.00', 'Aktif', '2026-01-22', NULL, 'CBG003', 'USR068'),
('1003000011', 'Tabungan', '173977778.00', 'Aktif', '2026-01-25', NULL, 'CBG003', 'USR069'),
('1003000012', 'Tabungan', '15650000.00', 'Aktif', '2026-02-01', NULL, 'CBG003', 'USR070'),
('1003000013', 'Tabungan', '10000000.00', 'Aktif', '2026-02-03', NULL, 'CBG003', 'USR071'),
('1003000014', 'Tabungan', '15000000.00', 'Aktif', '2026-02-05', NULL, 'CBG003', 'USR072'),
('1003000015', 'Giro', '30000000.00', 'Aktif', '2026-02-17', NULL, 'CBG003', 'USR078'),
('1004000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG004', 'USR073'),
('1004000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG004', 'USR074'),
('1004000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG004', 'USR075'),
('1004000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG004', 'USR076'),
('1004000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG004', 'USR077'),
('1004000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG004', 'USR078'),
('1004000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG004', 'USR079'),
('1004000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG004', 'USR080'),
('1004000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG004', 'USR081'),
('1004000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG004', 'USR082'),
('1004000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG004', 'USR083'),
('1004000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG004', 'USR084'),
('1004000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG004', 'USR085'),
('1004000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG004', 'USR031'),
('1004000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG004', 'USR032'),
('1005000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG005', 'USR033'),
('1005000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG005', 'USR034'),
('1005000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG005', 'USR035'),
('1005000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG005', 'USR036'),
('1005000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG005', 'USR037'),
('1005000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG005', 'USR038'),
('1005000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG005', 'USR039'),
('1005000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG005', 'USR040'),
('1005000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG005', 'USR041'),
('1005000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG005', 'USR042'),
('1005000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG005', 'USR043'),
('1005000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG005', 'USR044'),
('1005000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG005', 'USR045'),
('1005000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG005', 'USR046'),
('1005000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG005', 'USR047'),
('1006000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG006', 'USR048'),
('1006000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG006', 'USR049'),
('1006000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG006', 'USR050'),
('1006000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG006', 'USR051'),
('1006000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG006', 'USR052'),
('1006000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG006', 'USR053'),
('1006000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG006', 'USR054'),
('1006000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG006', 'USR055'),
('1006000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG006', 'USR056'),
('1006000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG006', 'USR057'),
('1006000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG006', 'USR058'),
('1006000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG006', 'USR059'),
('1006000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG006', 'USR060'),
('1006000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG006', 'USR061'),
('1006000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG006', 'USR062'),
('1007000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG007', 'USR063'),
('1007000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG007', 'USR064'),
('1007000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG007', 'USR065'),
('1007000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG007', 'USR066'),
('1007000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG007', 'USR067'),
('1007000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG007', 'USR068'),
('1007000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG007', 'USR069'),
('1007000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG007', 'USR070'),
('1007000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG007', 'USR071'),
('1007000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG007', 'USR072'),
('1007000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG007', 'USR073'),
('1007000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG007', 'USR074'),
('1007000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG007', 'USR075'),
('1007000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG007', 'USR076'),
('1007000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG007', 'USR077'),
('1008000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG008', 'USR078'),
('1008000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG008', 'USR079'),
('1008000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG008', 'USR080'),
('1008000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG008', 'USR081'),
('1008000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG008', 'USR082'),
('1008000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG008', 'USR083'),
('1008000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG008', 'USR084'),
('1008000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG008', 'USR085'),
('1008000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG008', 'USR031'),
('1008000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG008', 'USR032'),
('1008000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG008', 'USR033'),
('1008000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG008', 'USR034'),
('1008000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG008', 'USR035'),
('1008000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG008', 'USR036'),
('1008000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG008', 'USR037'),
('1009000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG009', 'USR038'),
('1009000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG009', 'USR039'),
('1009000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG009', 'USR040'),
('1009000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG009', 'USR041'),
('1009000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG009', 'USR042'),
('1009000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG009', 'USR043'),
('1009000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG009', 'USR044'),
('1009000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG009', 'USR045'),
('1009000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG009', 'USR046'),
('1009000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG009', 'USR047'),
('1009000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG009', 'USR048'),
('1009000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG009', 'USR049'),
('1009000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG009', 'USR050'),
('1009000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG009', 'USR051'),
('1009000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG009', 'USR052'),
('1010000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG010', 'USR053'),
('1010000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG010', 'USR054'),
('1010000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG010', 'USR055'),
('1010000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG010', 'USR056'),
('1010000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG010', 'USR057'),
('1010000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG010', 'USR058'),
('1010000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG010', 'USR059'),
('1010000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG010', 'USR060'),
('1010000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG010', 'USR061'),
('1010000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG010', 'USR062'),
('1010000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG010', 'USR063'),
('1010000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG010', 'USR064'),
('1010000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG010', 'USR065'),
('1010000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG010', 'USR066'),
('1010000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG010', 'USR067'),
('1011000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG011', 'USR068'),
('1011000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG011', 'USR069'),
('1011000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG011', 'USR070'),
('1011000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG011', 'USR071'),
('1011000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG011', 'USR072'),
('1011000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG011', 'USR073'),
('1011000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG011', 'USR074'),
('1011000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG011', 'USR075'),
('1011000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG011', 'USR076'),
('1011000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG011', 'USR077'),
('1011000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG011', 'USR078'),
('1011000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG011', 'USR079'),
('1011000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG011', 'USR080'),
('1011000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG011', 'USR081'),
('1011000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG011', 'USR082'),
('1012000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG012', 'USR083'),
('1012000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG012', 'USR084'),
('1012000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG012', 'USR085'),
('1012000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG012', 'USR031'),
('1012000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG012', 'USR032'),
('1012000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG012', 'USR033'),
('1012000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG012', 'USR034'),
('1012000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG012', 'USR035'),
('1012000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG012', 'USR036'),
('1012000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG012', 'USR037'),
('1012000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG012', 'USR038'),
('1012000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG012', 'USR039'),
('1012000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG012', 'USR040'),
('1012000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG012', 'USR041'),
('1012000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG012', 'USR042'),
('1013000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG013', 'USR043'),
('1013000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG013', 'USR044'),
('1013000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG013', 'USR045'),
('1013000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG013', 'USR046'),
('1013000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG013', 'USR047'),
('1013000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG013', 'USR048'),
('1013000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG013', 'USR049'),
('1013000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG013', 'USR050'),
('1013000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG013', 'USR051'),
('1013000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG013', 'USR052'),
('1013000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG013', 'USR053'),
('1013000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG013', 'USR054'),
('1013000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG013', 'USR055'),
('1013000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG013', 'USR056'),
('1013000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG013', 'USR057'),
('1014000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG014', 'USR058'),
('1014000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG014', 'USR059'),
('1014000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG014', 'USR060'),
('1014000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG014', 'USR061'),
('1014000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG014', 'USR062'),
('1014000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG014', 'USR063'),
('1014000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG014', 'USR064'),
('1014000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG014', 'USR065'),
('1014000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG014', 'USR066'),
('1014000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG014', 'USR067'),
('1014000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG014', 'USR068'),
('1014000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG014', 'USR069'),
('1014000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG014', 'USR070'),
('1014000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG014', 'USR071'),
('1014000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG014', 'USR072'),
('1015000001', 'Tabungan', '10000000.00', 'Aktif', '2026-01-01', NULL, 'CBG015', 'USR073'),
('1015000002', 'Tabungan', '11000000.00', 'Aktif', '2026-01-02', NULL, 'CBG015', 'USR074'),
('1015000003', 'Tabungan', '12000000.00', 'Aktif', '2026-01-03', NULL, 'CBG015', 'USR075'),
('1015000004', 'Tabungan', '13000000.00', 'Aktif', '2026-01-04', NULL, 'CBG015', 'USR076'),
('1015000005', 'Tabungan', '14000000.00', 'Aktif', '2026-01-05', NULL, 'CBG015', 'USR077'),
('1015000006', 'Tabungan', '15000000.00', 'Aktif', '2026-01-06', NULL, 'CBG015', 'USR078'),
('1015000007', 'Tabungan', '16000000.00', 'Aktif', '2026-01-07', NULL, 'CBG015', 'USR079'),
('1015000008', 'Tabungan', '17000000.00', 'Aktif', '2026-01-08', NULL, 'CBG015', 'USR080'),
('1015000009', 'Tabungan', '18000000.00', 'Aktif', '2026-01-09', NULL, 'CBG015', 'USR081'),
('1015000010', 'Tabungan', '19000000.00', 'Aktif', '2026-01-10', NULL, 'CBG015', 'USR082'),
('1015000011', 'Tabungan', '20000000.00', 'Aktif', '2026-01-11', NULL, 'CBG015', 'USR083'),
('1015000012', 'Tabungan', '21000000.00', 'Aktif', '2026-01-12', NULL, 'CBG015', 'USR084'),
('1015000013', 'Tabungan', '22000000.00', 'Aktif', '2026-01-13', NULL, 'CBG015', 'USR085'),
('1015000014', 'Tabungan', '23000000.00', 'Aktif', '2026-01-14', NULL, 'CBG015', 'USR031'),
('1015000015', 'Tabungan', '24000000.00', 'Aktif', '2026-01-15', NULL, 'CBG015', 'USR032');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` varchar(10) NOT NULL,
  `jenis_transaksi` enum('Setoran Tunai','Penarikan Tunai','Transfer','Pencairan Pinjaman','Pembayaran Angsuran') NOT NULL,
  `jumlah` decimal(15,2) NOT NULL,
  `saldo_setelah` decimal(15,2) NOT NULL,
  `channel` enum('Teller','ATM','Mobile Banking','Internet Banking') NOT NULL,
  `waktu_transaksi` datetime NOT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `nomor_rekening` varchar(20) NOT NULL,
  `pegawai_user_id` varchar(10) DEFAULT NULL,
  `pinjaman_id` varchar(10) DEFAULT NULL,
  `angsuran_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `jenis_transaksi`, `jumlah`, `saldo_setelah`, `channel`, `waktu_transaksi`, `keterangan`, `nomor_rekening`, `pegawai_user_id`, `pinjaman_id`, `angsuran_id`) VALUES
('TRX0001', 'Setoran Tunai', '1050000.00', '1050000.00', 'Teller', '2023-01-17 13:29:34', 'Setoran awal pembukaan rekening', '1001000001', 'USR002', NULL, NULL),
('TRX0002', 'Setoran Tunai', '500000.00', '500000.00', 'Teller', '2023-02-11 14:47:08', 'Setoran awal pembukaan rekening', '1001000002', 'USR002', NULL, NULL),
('TRX0003', 'Setoran Tunai', '850000.00', '850000.00', 'Teller', '2023-02-19 15:32:09', 'Setoran awal pembukaan rekening', '1002000001', 'USR005', NULL, NULL),
('TRX0004', 'Setoran Tunai', '9750000.00', '9750000.00', 'Teller', '2023-03-15 10:21:35', 'Setoran awal pembukaan rekening', '1003000001', 'USR008', NULL, NULL),
('TRX0005', 'Setoran Tunai', '4050000.00', '4050000.00', 'Teller', '2023-03-27 14:50:10', 'Setoran awal pembukaan rekening', '1004000001', 'USR011', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(200) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL,
  `user_type` enum('Nasabah','Pegawai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `nama_lengkap`, `status`, `user_type`) VALUES
('USR001', 'admin.cbg01@creedy.co.id', 'K24L3Bjt8v', 'Bambang Admin CBG01', 'Aktif', 'Pegawai'),
('USR002', 'teller.cbg01@creedy.co.id', 'V5yMcpXYtf', 'Siti Teller CBG01', 'Aktif', 'Pegawai'),
('USR003', 'kredit.cbg01@creedy.co.id', 'TvcwtH7f64', 'Agus Kredit CBG01', 'Aktif', 'Pegawai'),
('USR004', 'admin.cbg02@creedy.co.id', 'bZaHRMY5RK', 'Dewi Admin CBG02', 'Aktif', 'Pegawai'),
('USR005', 'teller.cbg02@creedy.co.id', 'YeC3vXjLdg', 'Hendra Teller CBG02', 'Aktif', 'Pegawai'),
('USR006', 'kredit.cbg02@creedy.co.id', 'Gf6TAyuKPs', 'Ratna Kredit CBG02', 'Aktif', 'Pegawai'),
('USR007', 'admin.cbg03@creedy.co.id', 'FpeutXL85y', 'Slamet Admin CBG03', 'Aktif', 'Pegawai'),
('USR008', 'teller.cbg03@creedy.co.id', 'u5bkufPYSr', 'Yulia Teller CBG03', 'Aktif', 'Pegawai'),
('USR009', 'kredit.cbg03@creedy.co.id', 'bz5xsC69aa', 'Fajar Kredit CBG03', 'Aktif', 'Pegawai'),
('USR010', 'admin.cbg04@creedy.co.id', 'Kv7Myb3fmT', 'Maria Admin CBG04', 'Aktif', 'Pegawai'),
('USR011', 'teller.cbg04@creedy.co.id', 'z4LPaRsNLr', 'Rizky Teller CBG04', 'Aktif', 'Pegawai'),
('USR012', 'kredit.cbg04@creedy.co.id', 'KVU2spLyu4', 'Anisa Kredit CBG04', 'Aktif', 'Pegawai'),
('USR013', 'admin.cbg05@creedy.co.id', 'nxYLZ37zE3', 'Dimas Admin CBG05', 'Aktif', 'Pegawai'),
('USR014', 'teller.cbg05@creedy.co.id', 'WaazdjYzW5', 'Putri Teller CBG05', 'Aktif', 'Pegawai'),
('USR015', 'kredit.cbg05@creedy.co.id', '2rck6kNaoA', 'Eko Kredit CBG05', 'Aktif', 'Pegawai'),
('USR016', 'admin.cbg06@creedy.co.id', 'urtGz5iEfE', 'Lina Admin CBG06', 'Aktif', 'Pegawai'),
('USR017', 'teller.cbg06@creedy.co.id', 'ktPM9amg2d', 'Arif Teller CBG06', 'Aktif', 'Pegawai'),
('USR018', 'kredit.cbg06@creedy.co.id', 'eR2tCtDC2C', 'Nurul Kredit CBG06', 'Aktif', 'Pegawai'),
('USR019', 'admin.cbg07@creedy.co.id', 'sdeHH522vz', 'Taufik Admin CBG07', 'Aktif', 'Pegawai'),
('USR020', 'teller.cbg07@creedy.co.id', 'v4qWJeGe79', 'Wulan Teller CBG07', 'Aktif', 'Pegawai'),
('USR021', 'kredit.cbg07@creedy.co.id', 'sdBjv5Xo7w', 'Yoga Kredit CBG07', 'Aktif', 'Pegawai'),
('USR022', 'admin.cbg08@creedy.co.id', 'ZKcwV5sa2D', 'Sinta Admin CBG08', 'Aktif', 'Pegawai'),
('USR023', 'teller.cbg08@creedy.co.id', 'X9wnYGWHSX', 'Rendi Teller CBG08', 'Aktif', 'Pegawai'),
('USR024', 'kredit.cbg08@creedy.co.id', 'Vof9gW9npG', 'Ayu Kredit CBG08', 'Aktif', 'Pegawai'),
('USR025', 'admin.cbg09@creedy.co.id', 'MfF2BoRwwL', 'Bagas Admin CBG09', 'Aktif', 'Pegawai'),
('USR026', 'teller.cbg09@creedy.co.id', 'P2dzpCqTQ5', 'Indah Teller CBG09', 'Aktif', 'Pegawai'),
('USR027', 'kredit.cbg09@creedy.co.id', 'LHhKsB8qnt', 'Galih Kredit CBG09', 'Aktif', 'Pegawai'),
('USR028', 'admin.cbg10@creedy.co.id', 'iWXUEj7XtT', 'Mega Admin CBG10', 'Aktif', 'Pegawai'),
('USR029', 'teller.cbg10@creedy.co.id', 'AM7JHqCNt3', 'Adi Teller CBG10', 'Aktif', 'Pegawai'),
('USR030', 'kredit.cbg10@creedy.co.id', '5fXZtGnC2i', 'Dian Kredit CBG10', 'Aktif', 'Pegawai'),
('USR031', 'joko@gmail.com', 'xD3sjrtY8c', 'Joko Susilo', 'Aktif', 'Nasabah'),
('USR032', 'sari@gmail.com', 'AAbSxhT4XB', 'Sari Wulandari', 'Aktif', 'Nasabah'),
('USR033', 'hana@gmail.com', 'SLW3zwzLvb', 'Hana Pertiwi', 'Aktif', 'Nasabah'),
('USR034', 'prasetyo@gmail.com', 'ieRET6cuTq', 'Prasetyo Adi', 'Aktif', 'Nasabah'),
('USR035', 'okta@gmail.com', 'e3jdQ3dBbC', 'Okta Viani', 'Aktif', 'Nasabah'),
('USR036', 'ahmad@gmail.com', 'zV2moKgUAv', 'Ahmad Fauzi', 'Aktif', 'Nasabah'),
('USR037', 'rahmat@gmail.com', 'YPD95AdbHa', 'Rahmat Hidayat', 'Aktif', 'Nasabah'),
('USR038', 'endang@gmail.com', '9EALrm3A9f', 'Endang Susilowati', 'Aktif', 'Nasabah'),
('USR039', 'qori@gmail.com', 'itqn4mWLPz', 'Qori Rahmadani', 'Aktif', 'Nasabah'),
('USR040', 'nusantara@gmail.com', 'et93Pg4Gwr', 'PT Nusantara Logistik', 'Aktif', 'Nasabah'),
('USR041', 'cahaya@gmail.com', 'uY4vUfph7K', 'CV Cahaya Abadi', 'Aktif', 'Nasabah'),
('USR042', 'tani@gmail.com', 'PeA5U3GvT6', 'UD Tani Makmur', 'Aktif', 'Nasabah'),
('USR043', 'mutiara@gmail.com', '6es4rHUp8J', 'Mutiara Ningsih', 'Aktif', 'Nasabah'),
('USR044', 'lukman@gmail.com', 'n7bzLWRwem', 'Lukman Hakim', 'Aktif', 'Nasabah'),
('USR045', 'bella@gmail.com', '9eJJ83oAzc', 'Bella Safitri', 'Aktif', 'Nasabah'),
('USR046', 'irfan@gmail.com', 'KjVqh2Gdrz', 'Irfan Maulana', 'Aktif', 'Nasabah'),
('USR047', 'karya@gmail.com', '7i9uGH3Gxu', 'CV Karya Mandiri', 'Aktif', 'Nasabah'),
('USR048', 'kartika@gmail.com', 'fbxkd3Mg2U', 'Kartika Sari', 'Aktif', 'Nasabah'),
('USR049', 'dwi@gmail.com', 'PHHw9TCJrB', 'Dwi Handayani', 'Aktif', 'Nasabah'),
('USR050', 'hesti@gmail.com', 'PVwED5qaiB', 'Hesti Rahayu', 'Aktif', 'Nasabah'),
('USR051', 'nanda@gmail.com', 'e2H8tbK82o', 'Nanda Prakoso', 'Aktif', 'Nasabah'),
('USR052', 'sumber@gmail.com', 'JrJ6UhSBvA', 'UD Sumber Rezeki', 'Aktif', 'Nasabah'),
('USR053', 'erwin@gmail.com', '97yGsTkbHz', 'Erwin Kusnadi', 'Aktif', 'Nasabah'),
('USR054', 'gunawan@gmail.com', 'V7S62BQSuh', 'Gunawan Setiadi', 'Aktif', 'Nasabah'),
('USR055', 'alif@gmail.com', 'vhtyL2zujT', 'Alif Ramadhan', 'Aktif', 'Nasabah'),
('USR056', 'berkah@gmail.com', 'CX8sCvVw8t', 'CV Berkah Jaya', 'Aktif', 'Nasabah'),
('USR057', 'gilang@gmail.com', 'XS5RMUUHjW', 'Gilang Saputra', 'Aktif', 'Nasabah'),
('USR058', 'candra@gmail.com', 'C5jjpZdPgg', 'Candra Wijaya', 'Aktif', 'Nasabah'),
('USR059', 'budi@gmail.com', 'TfmTVdC8v2', 'Budi Santoso', 'Aktif', 'Nasabah'),
('USR060', 'zahra@gmail.com', 'ooJx23hiaV', 'Zahra Amalia', 'Aktif', 'Nasabah'),
('USR061', 'teguh@gmail.com', 'KBX7ueWXan', 'Teguh Santosa', 'Aktif', 'Nasabah'),
('USR062', 'citra@gmail.com', 'KBu5RZ69zb', 'Citra Dewi', 'Aktif', 'Nasabah'),
('USR063', 'farah@gmail.com', 'xHZDfVdD6i', 'Farah Aulia', 'Aktif', 'Nasabah'),
('USR064', 'denny@gmail.com', 'TQCGwU4Gdc', 'Denny Kurniawan', 'Aktif', 'Nasabah'),
('USR065', 'fitri@gmail.com', '4ScwP9Sixk', 'Fitri Anjani', 'Aktif', 'Nasabah'),
('USR066', 'yusuf@gmail.com', 'amJGBzdFy6', 'Yusuf Ibrahim', 'Aktif', 'Nasabah'),
('USR067', 'vina@gmail.com', 'fjoUmHizn9', 'Vina Melati', 'Aktif', 'Nasabah'),
('USR068', 'mitra@gmail.com', 'w8SFi9pCXZ', 'PT Mitra Sejahtera', 'Aktif', 'Nasabah'),
('USR069', 'umi@gmail.com', 'T6P55uFH4x', 'Umi Kalsum', 'Aktif', 'Nasabah'),
('USR070', 'wahyu@gmail.com', 'MnJmhZR4WV', 'Wahyu Nugroho', 'Aktif', 'Nasabah'),
('USR071', 'andi@gmail.com', 'E32J2FiQZt', 'Andi Pratama', 'Aktif', 'Nasabah'),
('USR072', 'budi.s@gmail.com', 'Ys5YS2FG9m', 'Budi Santoso II', 'Aktif', 'Nasabah'),
('USR073', 'citra.l@gmail.com', 'Xh9J5aESxm', 'Citra Lestari', 'Aktif', 'Nasabah'),
('USR074', 'dewi.a@gmail.com', 'EmY7CjynDn', 'Dewi Anggraini', 'Aktif', 'Nasabah'),
('USR075', 'eko.s@gmail.com', 'mYdMXc8VUv', 'Eko Saputra II', 'Aktif', 'Nasabah'),
('USR076', 'fitri.h@gmail.com', 'dqGJHL3ZXr', 'Fitri Handayani', 'Aktif', 'Nasabah'),
('USR077', 'galih.r@gmail.com', 'ywq5Bbbzhg', 'Galih Ramadhan', 'Aktif', 'Nasabah'),
('USR078', 'hana.p@gmail.com', 'cHBA4uzDoL', 'Hana Putri', 'Aktif', 'Nasabah'),
('USR079', 'irfan.m@gmail.com', 'YThoWR84fc', 'Irfan Maulana II', 'Aktif', 'Nasabah'),
('USR080', 'julia.s@gmail.com', 'ckYwPG557c', 'Julia Safitri', 'Aktif', 'Nasabah'),
('USR081', 'kevin.w@gmail.com', 'kbHS8UA6AE', 'Kevin Wijaya', 'Aktif', 'Nasabah'),
('USR082', 'lina.m@gmail.com', 'ij8MzRMS4b', 'Lina Marlina II', 'Aktif', 'Nasabah'),
('USR083', 'maya.s@gmail.com', 'P2Lnz3S8Ta', 'Maya Sari', 'Aktif', 'Nasabah'),
('USR084', 'nanda.f@gmail.com', 'MBY8WyyDEw', 'Nanda Firmansyah', 'Aktif', 'Nasabah'),
('USR085', 'putra.k@gmail.com', 'q6XfhcFw5A', 'Putra Kurniawan', 'Aktif', 'Nasabah'),
('USR086', 'admin.cbg11@creedy.co.id', '3Z8mocvfiW', 'Rudi Admin CBG11', 'Aktif', 'Pegawai'),
('USR087', 'teller.cbg11@creedy.co.id', 'pHkchDcga6', 'Sinta Teller CBG11', 'Aktif', 'Pegawai'),
('USR088', 'kredit.cbg11@creedy.co.id', 'G3uw2BxEUb', 'Dimas Kredit CBG11', 'Aktif', 'Pegawai'),
('USR089', 'admin.cbg12@creedy.co.id', 'JYmV57DfBK', 'Nadia Admin CBG12', 'Aktif', 'Pegawai'),
('USR090', 'teller.cbg12@creedy.co.id', 'ce2YhZFj9R', 'Fajar Teller CBG12', 'Aktif', 'Pegawai'),
('USR091', 'kredit.cbg12@creedy.co.id', 'Pw97ciPuBi', 'Intan Kredit CBG12', 'Aktif', 'Pegawai'),
('USR092', 'admin.cbg13@creedy.co.id', 'Lrf4V3Mnqs', 'Arif Admin CBG13', 'Aktif', 'Pegawai'),
('USR093', 'teller.cbg13@creedy.co.id', 'a2fmEK2okn', 'Mila Teller CBG13', 'Aktif', 'Pegawai'),
('USR094', 'kredit.cbg13@creedy.co.id', 'M5fcw3kgkD', 'Yoga Kredit CBG13', 'Aktif', 'Pegawai'),
('USR095', 'admin.cbg14@creedy.co.id', 'yPwV7nhqgU', 'Rina Admin CBG14', 'Aktif', 'Pegawai'),
('USR096', 'teller.cbg14@creedy.co.id', 'E3U3uqqMVK', 'Agus Teller CBG14', 'Aktif', 'Pegawai'),
('USR097', 'kredit.cbg14@creedy.co.id', 'XLxnRe4Gqd', 'Tika Kredit CBG14', 'Tidak Aktif', 'Pegawai'),
('USR098', 'admin.cbg15@creedy.co.id', 'JdqD4QuPvr', 'Bayu Admin CBG15', 'Aktif', 'Pegawai'),
('USR099', 'teller.cbg15@creedy.co.id', 'caPLaRj4pp', 'Dina Teller CBG15', 'Aktif', 'Pegawai'),
('USR100', 'kredit.cbg15@creedy.co.id', 'XR2MxV4TS5', 'Reza Kredit CBG15', 'Aktif', 'Pegawai'),
('USR101', 'teller.usr101@creedy.co.id', 'wX7CWUtEa2', 'syafirgacor', 'Aktif', 'Pegawai'),
('USR94090', 'taiayam@gmail.com', 'nrtt7jzMCc', 'Syafir Ahzami', 'Aktif', 'Nasabah');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`cabang_id`);

--
-- Indexes for table `jadwal_angsuran`
--
ALTER TABLE `jadwal_angsuran`
  ADD PRIMARY KEY (`angsuran_id`),
  ADD KEY `fk_jadwal_pinjaman` (`pinjaman_id`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `fk_nasabah_users` (`user_id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `fk_pegawai_users` (`user_id`),
  ADD KEY `fk_pegawai_cabang` (`cabang_id`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`pinjaman_id`),
  ADD KEY `fk_pinjaman_nasabah` (`nasabah_user_id`),
  ADD KEY `fk_pinjaman_pegawai` (`pegawai_user_id`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`nomor_rekening`),
  ADD KEY `fk_rekening_cabang` (`cabang_id`),
  ADD KEY `fk_rekening_nasabah` (`nasabah_user_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `fk_transaksi_rekening` (`nomor_rekening`),
  ADD KEY `fk_transaksi_pegawai` (`pegawai_user_id`),
  ADD KEY `fk_transaksi_pinjaman` (`pinjaman_id`),
  ADD KEY `fk_transaksi_jadwal` (`angsuran_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal_angsuran`
--
ALTER TABLE `jadwal_angsuran`
  ADD CONSTRAINT `fk_jadwal_pinjaman` FOREIGN KEY (`pinjaman_id`) REFERENCES `pinjaman` (`pinjaman_id`);

--
-- Constraints for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD CONSTRAINT `fk_nasabah_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `fk_pegawai_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`cabang_id`),
  ADD CONSTRAINT `fk_pegawai_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD CONSTRAINT `fk_pinjaman_nasabah` FOREIGN KEY (`nasabah_user_id`) REFERENCES `nasabah` (`user_id`),
  ADD CONSTRAINT `fk_pinjaman_pegawai` FOREIGN KEY (`pegawai_user_id`) REFERENCES `pegawai` (`user_id`);

--
-- Constraints for table `rekening`
--
ALTER TABLE `rekening`
  ADD CONSTRAINT `fk_rekening_cabang` FOREIGN KEY (`cabang_id`) REFERENCES `cabang` (`cabang_id`),
  ADD CONSTRAINT `fk_rekening_nasabah` FOREIGN KEY (`nasabah_user_id`) REFERENCES `nasabah` (`user_id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_jadwal` FOREIGN KEY (`angsuran_id`) REFERENCES `jadwal_angsuran` (`angsuran_id`),
  ADD CONSTRAINT `fk_transaksi_pegawai` FOREIGN KEY (`pegawai_user_id`) REFERENCES `pegawai` (`user_id`),
  ADD CONSTRAINT `fk_transaksi_pinjaman` FOREIGN KEY (`pinjaman_id`) REFERENCES `pinjaman` (`pinjaman_id`),
  ADD CONSTRAINT `fk_transaksi_rekening` FOREIGN KEY (`nomor_rekening`) REFERENCES `rekening` (`nomor_rekening`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
