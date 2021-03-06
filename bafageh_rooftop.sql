-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 02 Okt 2019 pada 14.37
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bafageh_rooftop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_account_payable`
--

CREATE TABLE `acc_account_payable` (
  `id` int(11) UNSIGNED NOT NULL,
  `ap_no` varchar(30) NOT NULL,
  `ap_date` date DEFAULT NULL,
  `ap_name` varchar(100) DEFAULT NULL,
  `ap_address` varchar(255) DEFAULT NULL,
  `ap_phone` varchar(30) DEFAULT NULL,
  `tanggal_tempo` date DEFAULT NULL,
  `autoposting_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT '0',
  `jurnal_id` int(11) DEFAULT NULL,
  `posting_no` varchar(30) DEFAULT NULL,
  `no_ref` varchar(30) DEFAULT NULL,
  `acc_bank_id` int(11) DEFAULT NULL,
  `ap_tipe` enum('operational','purchasing') DEFAULT 'operational',
  `ap_used` tinyint(1) DEFAULT '0',
  `ap_status` enum('pengakuan','jurnal','posting','kontrabon','pembayaran') DEFAULT 'pengakuan',
  `total_tagihan` double DEFAULT '0',
  `ap_notes` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` tinyint(1) DEFAULT '1',
  `cash_name` varchar(50) DEFAULT NULL,
  `transfer_bank` varchar(50) DEFAULT NULL,
  `transfer_bank_no` varchar(30) DEFAULT NULL,
  `transfer_bank_name` varchar(50) DEFAULT NULL,
  `no_kontrabon` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_account_receivable`
--

CREATE TABLE `acc_account_receivable` (
  `id` int(11) UNSIGNED NOT NULL,
  `ar_no` varchar(30) NOT NULL,
  `ar_date` date DEFAULT NULL,
  `ar_name` varchar(100) DEFAULT NULL,
  `ar_address` varchar(255) DEFAULT NULL,
  `ar_phone` varchar(30) DEFAULT NULL,
  `tanggal_tempo` date DEFAULT NULL,
  `autoposting_id` int(11) DEFAULT NULL,
  `ref_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `jurnal_id` int(11) DEFAULT NULL,
  `posting_no` varchar(30) DEFAULT NULL,
  `no_ref` varchar(30) DEFAULT NULL,
  `acc_bank_id` int(11) DEFAULT NULL,
  `ar_tipe` enum('sales','marketplace','salesorder') DEFAULT 'sales',
  `ar_used` tinyint(1) DEFAULT '0',
  `ar_status` enum('pengakuan','jurnal','posting','invoice','pembayaran') DEFAULT 'pengakuan',
  `total_tagihan` double DEFAULT '0',
  `ar_notes` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` tinyint(1) DEFAULT '1',
  `cash_name` varchar(50) DEFAULT NULL,
  `transfer_bank` varchar(50) DEFAULT NULL,
  `transfer_bank_no` varchar(30) DEFAULT NULL,
  `transfer_bank_name` varchar(50) DEFAULT NULL,
  `no_invoice` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_autoposting`
--

CREATE TABLE `acc_autoposting` (
  `id` int(11) NOT NULL,
  `autoposting_name` varchar(100) NOT NULL,
  `autoposting_tipe` enum('purchasing','sales','other','pelunasan_account_payable','account_payable','account_receivable','pembayaran_account_receivable','cashflow_penerimaan','cashflow_pengeluaran','cashflow_mutasi_kas_bank') DEFAULT 'other',
  `rek_id_debet` int(11) DEFAULT NULL,
  `rek_id_kredit` int(11) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_autoposting_detail`
--

CREATE TABLE `acc_autoposting_detail` (
  `id` int(11) NOT NULL,
  `autoposting_id` int(11) DEFAULT NULL,
  `rek_id_debet` int(11) NOT NULL,
  `rek_id_kredit` int(11) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_invoice`
--

CREATE TABLE `acc_invoice` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice_no` varchar(30) NOT NULL,
  `invoice_name` varchar(100) DEFAULT NULL,
  `invoice_address` varchar(255) DEFAULT NULL,
  `invoice_phone` varchar(30) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `tanggal_jatuh_tempo` date DEFAULT NULL,
  `invoice_status` enum('progress','done','cancel') DEFAULT 'progress',
  `total_tagihan` double DEFAULT '0',
  `total_bayar` double DEFAULT NULL,
  `invoice_notes` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_invoice_detail`
--

CREATE TABLE `acc_invoice_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `ar_id` int(11) DEFAULT NULL,
  `total_bayar` double DEFAULT '0',
  `total_tagihan` double DEFAULT '0',
  `invoiced_status` enum('unpaid','paid') DEFAULT 'unpaid',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_jurnal_header`
--

CREATE TABLE `acc_jurnal_header` (
  `id` int(11) NOT NULL,
  `no_registrasi` varchar(50) NOT NULL,
  `kd_tipe_jurnal` varchar(10) DEFAULT NULL,
  `kd_currency` varchar(50) DEFAULT NULL,
  `nilai_kurs` double DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `is_posting` tinyint(1) DEFAULT NULL,
  `no_jurnal` varchar(50) DEFAULT NULL,
  `tgl_posting` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `total` double DEFAULT '0',
  `periode` varchar(20) DEFAULT NULL,
  `ket_periode` varchar(50) DEFAULT NULL,
  `counter_print` int(11) DEFAULT NULL,
  `tgl_registrasi` date NOT NULL,
  `tahun` smallint(6) DEFAULT NULL,
  `is_balance` tinyint(1) DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `ref_no` varchar(50) DEFAULT NULL,
  `jurnal_from` enum('mutasi_jurnal','account_payable','account_receivable','closing_sales','pelunasan_account_payable','pelunasan_account_receivable') DEFAULT 'mutasi_jurnal'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_kode_rekening`
--

CREATE TABLE `acc_kode_rekening` (
  `id` int(11) NOT NULL,
  `kd_kel_akun` varchar(10) DEFAULT '0',
  `kd_kel_akun_detail` varchar(10) DEFAULT '0',
  `kode_rek` varchar(20) DEFAULT NULL,
  `nama_rek` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `status_akun` enum('parent','detail') DEFAULT 'parent',
  `coa_level` varchar(1) DEFAULT '0',
  `posisi_akun` enum('D','K') DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cashflow_tipe` enum('none','operating','investing','financing') DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_kontrabon`
--

CREATE TABLE `acc_kontrabon` (
  `id` int(11) UNSIGNED NOT NULL,
  `kb_no` varchar(30) NOT NULL,
  `kb_name` varchar(100) DEFAULT NULL,
  `kb_address` varchar(255) DEFAULT NULL,
  `kb_phone` varchar(30) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `kb_date` date DEFAULT NULL,
  `tanggal_jatuh_tempo` date DEFAULT NULL,
  `kb_status` enum('progress','done','cancel') DEFAULT 'progress',
  `total_tagihan` double DEFAULT '0',
  `total_bayar` double DEFAULT NULL,
  `kb_notes` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_kontrabon_detail`
--

CREATE TABLE `acc_kontrabon_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `kb_id` int(11) NOT NULL,
  `ap_id` int(11) DEFAULT NULL,
  `total_bayar` double DEFAULT '0',
  `total_tagihan` double DEFAULT '0',
  `kbd_status` enum('unpaid','paid') DEFAULT 'unpaid',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_mutasi_kas_bank`
--

CREATE TABLE `acc_mutasi_kas_bank` (
  `id` int(11) UNSIGNED NOT NULL,
  `mkb_no` varchar(30) NOT NULL,
  `mkb_name` varchar(100) DEFAULT NULL,
  `autoposting_id` int(11) DEFAULT NULL,
  `jurnal_id` int(11) DEFAULT NULL,
  `posting_id` int(11) DEFAULT NULL,
  `no_ref` varchar(30) DEFAULT NULL,
  `mkb_tujuan` int(11) DEFAULT NULL,
  `mkb_used` tinyint(1) DEFAULT '0',
  `mkb_status` enum('pengakuan','jurnal','posting') DEFAULT 'pengakuan',
  `mkb_total` double DEFAULT '0',
  `mkb_notes` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `posting_no` varchar(30) DEFAULT NULL,
  `mkb_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_pelunasan_ap`
--

CREATE TABLE `acc_pelunasan_ap` (
  `id` int(11) UNSIGNED NOT NULL,
  `kb_id` int(11) NOT NULL,
  `pelunasan_no` varchar(30) DEFAULT NULL,
  `pelunasan_date` date DEFAULT NULL,
  `pelunasan_total` double DEFAULT '0',
  `pelunasan_status` enum('jurnal','posting') DEFAULT 'jurnal',
  `pelunasan_notes` varchar(255) DEFAULT NULL,
  `autoposting_id` int(11) DEFAULT NULL,
  `jurnal_id` int(11) DEFAULT NULL,
  `posting_no` varchar(30) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `no_bukti` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_pembayaran_ar`
--

CREATE TABLE `acc_pembayaran_ar` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `pembayaran_no` varchar(30) DEFAULT NULL,
  `pembayaran_date` date DEFAULT NULL,
  `pembayaran_total` double DEFAULT '0',
  `pembayaran_status` enum('jurnal','posting') DEFAULT 'jurnal',
  `pembayaran_notes` varchar(255) DEFAULT NULL,
  `autoposting_id` int(11) DEFAULT NULL,
  `jurnal_id` int(11) DEFAULT NULL,
  `posting_no` varchar(30) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `no_bukti` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_penerimaan_kas`
--

CREATE TABLE `acc_penerimaan_kas` (
  `id` int(11) UNSIGNED NOT NULL,
  `km_no` varchar(30) NOT NULL,
  `km_atasnama` varchar(100) DEFAULT NULL,
  `km_tipe` enum('umum','salesorder','sales') DEFAULT 'umum',
  `km_name` varchar(100) DEFAULT NULL,
  `autoposting_id` int(11) DEFAULT NULL,
  `jurnal_id` int(11) DEFAULT NULL,
  `posting_id` int(11) DEFAULT NULL,
  `no_ref` varchar(30) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `km_tujuan` int(11) DEFAULT NULL,
  `km_used` tinyint(1) DEFAULT '0',
  `km_status` enum('pengakuan','jurnal','posting') DEFAULT 'pengakuan',
  `km_total` double DEFAULT '0',
  `km_notes` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `posting_no` varchar(30) DEFAULT NULL,
  `km_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_pengeluaran_kas`
--

CREATE TABLE `acc_pengeluaran_kas` (
  `id` int(11) UNSIGNED NOT NULL,
  `kk_no` varchar(30) NOT NULL,
  `kk_name` varchar(100) DEFAULT NULL,
  `autoposting_id` int(11) DEFAULT NULL,
  `jurnal_id` int(11) DEFAULT NULL,
  `posting_id` int(11) DEFAULT NULL,
  `no_ref` varchar(30) DEFAULT NULL,
  `kk_tujuan` int(11) DEFAULT NULL,
  `kk_used` tinyint(1) DEFAULT '0',
  `kk_status` enum('pengakuan','jurnal','posting') DEFAULT 'pengakuan',
  `kk_total` double DEFAULT '0',
  `kk_notes` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `posting_no` varchar(30) DEFAULT NULL,
  `kk_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_periode_laporan`
--

CREATE TABLE `acc_periode_laporan` (
  `id` int(11) NOT NULL,
  `kd_periode_laporan` varchar(5) NOT NULL DEFAULT '',
  `ket_periode_laporan` varchar(50) NOT NULL,
  `kd_periode_kalender` varchar(5) NOT NULL,
  `nama_bulan_kalender` varchar(50) NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `acc_periode_laporan`
--

INSERT INTO `acc_periode_laporan` (`id`, `kd_periode_laporan`, `ket_periode_laporan`, `kd_periode_kalender`, `nama_bulan_kalender`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, '01', 'Januari', '01', 'Januari', 'administrator', '2014-10-21 10:29:20', 'administrator', '2014-10-21 10:31:02', 0, 0),
(2, '02', 'Februari', '02', 'Februari', 'administrator', '2014-10-21 10:31:30', 'administrator', '2014-10-21 10:31:30', 0, 0),
(3, '03', 'Maret', '03', 'Maret', 'administrator', '2014-10-21 10:32:04', 'administrator', '2014-10-21 10:32:04', 0, 0),
(4, '04', 'April', '04', 'April', 'administrator', '2014-10-21 10:32:18', 'administrator', '2014-10-21 10:32:18', 0, 0),
(5, '05', 'Mei', '05', 'Mei', 'administrator', '2014-10-21 10:32:33', 'administrator', '2014-10-21 10:32:33', 0, 0),
(6, '06', 'Juni', '06', 'Juni', 'administrator', '2014-10-21 10:32:58', 'administrator', '2014-10-21 10:32:58', 0, 0),
(7, '07', 'Juli', '07', 'Juli', 'administrator', '2014-10-21 10:33:14', 'administrator', '2014-10-21 10:33:14', 0, 0),
(8, '08', 'Agustus', '08', 'Agustus', 'administrator', '2014-10-21 10:34:56', 'administrator', '2014-10-21 10:34:56', 0, 0),
(9, '09', 'September', '09', 'September', 'administrator', '2014-10-21 10:35:11', 'administrator', '2014-10-21 10:35:11', 0, 0),
(10, '10', 'Oktober', '10', 'Oktober', 'administrator', '2014-10-21 10:35:30', 'administrator', '2014-10-21 10:35:30', 0, 0),
(11, '11', 'November', '11', 'November', 'administrator', '2014-10-21 10:35:46', 'administrator', '2014-10-21 10:35:46', 0, 0),
(12, '12', 'Desember', '12', 'Desember', 'administrator', '2014-10-21 10:36:01', 'administrator', '2014-10-21 10:36:01', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_tujuan_cashflow`
--

CREATE TABLE `acc_tujuan_cashflow` (
  `id` int(11) NOT NULL,
  `tujuan_cashflow_name` varchar(100) NOT NULL,
  `tujuan_cashflow_tipe` enum('cashflow_penerimaan','cashflow_pengeluaran','cashflow_mutasi_kas_bank','other') DEFAULT 'other',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_clients`
--

CREATE TABLE `apps_clients` (
  `id` tinyint(4) NOT NULL,
  `client_code` varchar(50) NOT NULL,
  `client_name` char(100) NOT NULL,
  `client_address` char(150) DEFAULT NULL,
  `city_id` tinyint(4) DEFAULT NULL,
  `province_id` tinyint(4) DEFAULT NULL,
  `client_postcode` char(5) DEFAULT NULL,
  `country_id` tinyint(4) DEFAULT NULL,
  `client_phone` char(20) DEFAULT NULL,
  `client_fax` char(20) DEFAULT NULL,
  `client_email` char(50) DEFAULT NULL,
  `client_logo` char(50) DEFAULT NULL,
  `client_website` char(50) DEFAULT NULL,
  `client_notes` char(100) DEFAULT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `client_ip` char(30) DEFAULT NULL,
  `mysql_user` char(30) DEFAULT NULL,
  `mysql_pass` varchar(100) DEFAULT NULL,
  `mysql_port` char(10) DEFAULT NULL,
  `mysql_database` char(100) DEFAULT NULL,
  `merchant_verified` enum('unverified','verified') DEFAULT 'unverified',
  `merchant_xid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_clients`
--

INSERT INTO `apps_clients` (`id`, `client_code`, `client_name`, `client_address`, `city_id`, `province_id`, `client_postcode`, `country_id`, `client_phone`, `client_fax`, `client_email`, `client_logo`, `client_website`, `client_notes`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `client_ip`, `mysql_user`, `mysql_pass`, `mysql_port`, `mysql_database`, `merchant_verified`, `merchant_xid`) VALUES
(1, 'MERCHANT-KEY', 'MERCHANT NAME', 'ADDRESS', NULL, 0, NULL, NULL, '081-000-000', '-', 'youremail@email.id', NULL, NULL, NULL, '', '2019-03-07 21:07:01', 'system', '2019-04-28 07:51:29', 1, 0, NULL, NULL, NULL, NULL, NULL, 'unverified', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_clients_structure`
--

CREATE TABLE `apps_clients_structure` (
  `id` smallint(6) NOT NULL,
  `client_structure_name` char(100) NOT NULL,
  `client_structure_notes` char(100) DEFAULT NULL,
  `client_structure_parent` smallint(6) DEFAULT '0',
  `client_structure_order` smallint(6) DEFAULT '0',
  `is_child` tinyint(1) DEFAULT '1',
  `role_id` smallint(6) DEFAULT NULL,
  `client_id` tinyint(4) DEFAULT NULL,
  `client_unit_id` tinyint(4) DEFAULT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_clients_structure`
--

INSERT INTO `apps_clients_structure` (`id`, `client_structure_name`, `client_structure_notes`, `client_structure_parent`, `client_structure_order`, `is_child`, `role_id`, `client_id`, `client_unit_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'Administrator', '', 0, 0, 0, 1, 0, 1, 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(2, 'Apps Admin', '', 1, 0, 1, 2, 1, 2, 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(3, 'Purchasing', '', 2, 0, 1, 4, 1, 3, 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(4, 'Cashier', '', 2, 0, 1, 5, 1, 4, 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_clients_unit`
--

CREATE TABLE `apps_clients_unit` (
  `id` tinyint(4) NOT NULL,
  `client_unit_name` char(50) NOT NULL,
  `client_id` tinyint(4) NOT NULL,
  `client_unit_code` char(10) DEFAULT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_clients_unit`
--

INSERT INTO `apps_clients_unit` (`id`, `client_unit_name`, `client_id`, `client_unit_code`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'Management', 1, 'MNG', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(2, 'IT Dept.', 1, 'IT', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(3, 'Accounting', 1, 'ACC', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(4, 'Operational', 1, 'OPR', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_modules`
--

CREATE TABLE `apps_modules` (
  `id` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_author` varchar(100) DEFAULT NULL,
  `module_version` varchar(10) DEFAULT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_folder` varchar(255) NOT NULL,
  `module_controller` varchar(255) NOT NULL,
  `module_is_menu` tinyint(1) DEFAULT '0',
  `module_breadcrumb` varchar(100) NOT NULL,
  `module_order` int(5) DEFAULT '0',
  `module_icon` varchar(50) DEFAULT NULL,
  `module_shortcut_icon` varchar(50) DEFAULT NULL,
  `module_glyph_icon` varchar(50) DEFAULT NULL,
  `module_glyph_font` varchar(100) DEFAULT NULL,
  `module_free` tinyint(1) DEFAULT '1',
  `running_background` tinyint(1) DEFAULT '0',
  `show_on_start_menu` tinyint(1) DEFAULT '1',
  `show_on_right_start_menu` tinyint(4) DEFAULT '0',
  `start_menu_path` varchar(255) DEFAULT NULL,
  `start_menu_order` int(11) DEFAULT '0',
  `start_menu_icon` varchar(100) DEFAULT NULL,
  `start_menu_glyph` varchar(100) DEFAULT NULL,
  `show_on_context_menu` tinyint(1) DEFAULT '0',
  `context_menu_icon` varchar(100) DEFAULT NULL,
  `context_menu_glyph` varchar(100) DEFAULT NULL,
  `show_on_shorcut_desktop` tinyint(1) DEFAULT NULL,
  `desktop_shortcut_icon` varchar(100) DEFAULT NULL,
  `desktop_shortcut_glyph` varchar(100) DEFAULT NULL,
  `show_on_preference` tinyint(1) DEFAULT '0',
  `preference_icon` varchar(100) DEFAULT NULL,
  `preference_glyph` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_modules`
--

INSERT INTO `apps_modules` (`id`, `module_name`, `module_author`, `module_version`, `module_description`, `module_folder`, `module_controller`, `module_is_menu`, `module_breadcrumb`, `module_order`, `module_icon`, `module_shortcut_icon`, `module_glyph_icon`, `module_glyph_font`, `module_free`, `running_background`, `show_on_start_menu`, `show_on_right_start_menu`, `start_menu_path`, `start_menu_order`, `start_menu_icon`, `start_menu_glyph`, `show_on_context_menu`, `context_menu_icon`, `context_menu_glyph`, `show_on_shorcut_desktop`, `desktop_shortcut_icon`, `desktop_shortcut_glyph`, `show_on_preference`, `preference_icon`, `preference_glyph`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'Setup Aplikasi', 'dev@wepos.id', 'v.1.0', '', 'systems', 'setupAplikasiFree', 1, '1. Master Aplikasi>Setup Aplikasi', 1, 'icon-cog', 'icon-cog', '', '', 1, 0, 1, 0, '1. Master Aplikasi>Setup Aplikasi', 1000, 'icon-cog', '', 0, 'icon-cog', '', 1, 'icon-cog', '', 0, 'icon-cog', '', 'administrator', '2019-04-10 08:52:11', 'administrator', '2019-04-30 00:00:00', 1, 0),
(2, 'Client Info', 'dev@wepos.id', 'v.1.0.0', 'Client Info', 'systems', 'clientInfo', 0, '1. Master Aplikasi>Client Info', 1, 'icon-home', 'icon-home', '', '', 1, 0, 1, 0, '1. Master Aplikasi>Client Info', 1101, 'icon-home', '', 0, 'icon-home', '', 1, 'icon-home', '', 1, 'icon-home', '', 'administrator', '2019-04-03 07:47:08', 'administrator', '2019-04-03 07:47:08', 1, 0),
(3, 'Client Unit', 'dev@wepos.id', 'v.1.0', '', 'systems', 'DataClientUnit', 1, '1. Master Aplikasi>Client Unit', 1, 'icon-building', 'icon-building', '', '', 1, 0, 1, 0, '1. Master Aplikasi>Client Unit', 1102, 'icon-building', '', 0, 'icon-building', '', 1, 'icon-building', '', 1, 'icon-building', '', 'administrator', '2019-04-10 08:52:10', 'administrator', '2019-04-30 00:00:00', 1, 0),
(4, 'Data Structure', 'dev@wepos.id', 'v.1.0', '', 'systems', 'DataStructure', 1, '1. Master Aplikasi>Data Structure', 1, 'icon-building', 'icon-building', '', '', 1, 0, 1, 0, '1. Master Aplikasi>Data Structure', 1103, 'icon-building', '', 0, 'icon-building', '', 1, 'icon-building', '', 1, 'icon-building', '', 'administrator', '2019-04-10 08:52:11', 'administrator', '2019-04-30 00:00:00', 1, 0),
(5, 'Role Manager', 'dev@wepos.id', 'v.1.2', 'Role Manager', 'systems', 'Roles', 1, '1. Master Aplikasi>Role Manager', 1, 'icon-role-modules', 'icon-role-modules', '', '', 1, 0, 1, 0, '1. Master Aplikasi>Role Manager', 1201, 'icon-role-modules', '', 0, 'icon-role-modules', '', 1, 'icon-role-modules', '', 1, 'icon-role-modules', '', 'administrator', '2019-04-10 08:52:15', 'administrator', '2019-04-30 00:00:00', 1, 0),
(6, 'Data User', 'dev@wepos.id', 'v.1.0', '', 'systems', 'UserData', 1, '1. Master Aplikasi>Data User', 1, 'icon-user-data', 'icon-user-data', '', '', 1, 0, 1, 0, '1. Master Aplikasi>Data User', 1203, 'icon-user-data', '', 0, 'icon-user-data', '', 1, 'icon-user-data', '', 0, 'icon-user-data', '', 'administrator', '2019-04-10 08:52:11', 'administrator', '2019-04-30 00:00:00', 1, 0),
(7, 'User Profile', 'dev@wepos.id', 'v.1.0', '', 'systems', 'UserProfile', 1, '1. Master Aplikasi>User Profile', 1, 'user', 'user', '', '', 1, 0, 1, 1, '1. Master Aplikasi>User Profile', 1301, 'user', '', 1, 'user', '', 1, 'user', '', 1, 'user', '', 'administrator', '2019-04-10 08:52:17', 'administrator', '2019-04-30 00:00:00', 1, 0),
(8, 'Desktop Shortcuts', 'dev@wepos.id', 'v.1.0', 'Shortcuts Manager to Desktop', 'systems', 'DesktopShortcuts', 1, '1. Master Aplikasi>Desktop Shortcuts', 1, 'icon-preferences', 'icon-preferences', '', '', 1, 0, 1, 1, '1. Master Aplikasi>Desktop Shortcuts', 1302, 'icon-preferences', '', 1, 'icon-preferences', '', 1, 'icon-preferences', '', 1, 'icon-preferences', '', 'administrator', '2019-04-10 08:52:12', 'administrator', '2019-04-30 00:00:00', 1, 0),
(9, 'QuickStart Shortcuts', 'dev@wepos.id', 'v.1.0', '', 'systems', 'QuickStartShortcuts', 0, '1. Master Aplikasi>QuickStart Shortcuts', 1, 'icon-preferences', 'icon-preferences', '', '', 1, 0, 1, 0, '1. Master Aplikasi>QuickStart Shortcuts', 1303, 'icon-preferences', '', 0, 'icon-preferences', '', 1, 'icon-preferences', '', 1, 'icon-preferences', '', 'administrator', '2019-04-24 07:43:19', 'administrator', '2019-04-21 09:16:19', 1, 0),
(10, 'Refresh Aplikasi', 'dev@wepos.id', 'v.1.0.0', '', 'systems', 'refreshModule', 0, 'Refresh Aplikasi', 1, 'icon-refresh', 'icon-refresh', '', '', 1, 0, 0, 0, 'Refresh Aplikasi', 1304, 'icon-refresh', '', 0, 'icon-refresh', '', 1, 'icon-refresh', '', 0, 'icon-refresh', '', 'administrator', '2019-04-17 15:00:19', 'administrator', '2019-04-17 15:00:19', 1, 0),
(11, 'Lock Screen', 'dev@wepos.id', 'v.1.0.0', 'User Lock Screen', 'systems', 'lockScreen', 0, 'LockScreen', 1, 'icon-grid', 'icon-grid', '', '', 1, 1, 0, 0, 'LockScreen', 1305, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-17 01:40:20', 'administrator', '2019-04-30 00:00:00', 1, 0),
(12, 'Logout', 'dev@wepos.id', 'v.1.0.0', 'Just Logout Module', 'systems', 'logoutModule', 0, 'Logout', 1, 'icon-grid', 'icon-grid', '', '', 1, 1, 0, 0, 'Logout', 1306, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-17 01:36:16', 'administrator', '2019-04-20 15:06:35', 1, 0),
(13, 'WePOS Update', 'dev@wepos.id', 'v.1.0.0', 'WePOS Update', 'systems', 'weposUpdate', 0, '1. Master Aplikasi>WePOS Update', 1, 'icon-sync', 'icon-grid', '', '', 1, 0, 0, 0, '1. Master Aplikasi>WePOS Update', 1401, 'icon-sync', '', 0, 'icon-sync', '', 1, 'icon-sync', '', 1, 'icon-sync', '', 'administrator', '2019-04-22 08:00:58', 'administrator', '2019-04-22 08:00:58', 1, 0),
(14, 'Notifikasi Sistem', 'dev@wepos.id', 'v.1.0.0', 'Notifikasi Sistem', 'systems', 'systemNotify', 0, 'Notifikasi Sistem', 1, 'icon-info', 'icon-info', '', '', 1, 1, 0, 0, 'Notifikasi Sistem', 1402, 'icon-info', '', 0, 'icon-info', '', 0, 'icon-info', '', 0, 'icon-info', '', 'administrator', '2019-04-22 08:00:58', 'administrator', '2019-04-22 08:00:58', 1, 0),
(17, 'Master Warehouse', 'dev@wepos.id', 'v.1.0.0', 'Master Warehouse', 'master_pos', 'masterStoreHouse', 0, '2. Master POS>Master Warehouse', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Master Warehouse', 2201, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-10 03:24:56', 'administrator', '2019-04-21 20:05:16', 1, 0),
(18, 'Master Unit', 'dev@wepos.id', 'v.1.0.0', 'Master Unit', 'master_pos', 'masterUnit', 0, '2. Master POS>Master Unit', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Master Unit', 2202, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-10 03:25:13', 'administrator', '2019-04-12 22:15:29', 1, 0),
(19, 'Master Supplier', 'dev@wepos.id', 'v.1.0.0', 'Master Supplier', 'master_pos', 'masterSupplier', 0, '2. Master POS>Supplier', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Supplier', 2203, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-10 03:25:04', 'administrator', '2019-04-21 20:04:34', 1, 0),
(20, 'Item Category', 'dev@wepos.id', 'v.1.0.0', 'Item Category', 'master_pos', 'itemCategory', 0, '2. Master POS>Item Category', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Item Category', 2210, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-05 00:36:29', 'administrator', '2019-04-15 20:31:54', 1, 0),
(21, 'Sub Item Category', 'dev@wepos.id', 'v.1.0.0', 'Sub Item Category', 'master_pos', 'itemSubCategory', 0, '2. Master POS>Sub Item Category', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Sub Item Category', 2221, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-12 22:16:35', 'administrator', '2019-04-05 10:25:39', 1, 0),
(22, 'Sub Item Category 2', 'dev@wepos.id', 'v.1.0.0', 'Sub Item Category 2', 'master_pos', 'itemSubCategory2', 0, '2. Master POS>Sub Item Category 2', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Sub Item Category 2', 2222, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-12 16:37:04', 'administrator', '2019-04-05 10:27:53', 0, 1),
(25, 'Master Item', 'dev@wepos.id', 'v.1.0.0', 'Data Item', 'master_pos', 'masterItemRetail', 0, '2. Master POS>Master Item', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Master Item', 2230, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-13 14:04:34', 'administrator', '2019-04-13 14:04:34', 1, 0),
(26, 'Discount Planner', 'dev@wepos.id', 'v.1.0', 'Planning All discount', 'master_pos', 'discountPlannerFree', 0, '2. Master POS>Discount Planner', 2, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Discount Planner', 2301, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-10 17:26:01', 'administrator', '2019-04-30 00:00:00', 1, 0),
(27, 'Printer Manager', 'dev@wepos.id', 'v.1.0', 'Printer Manager', 'master_pos', 'masterPrinter', 0, '2. Master POS>Printer Manager', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Printer Manager', 2302, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-10 03:24:50', 'administrator', '2019-04-21 20:06:25', 1, 0),
(28, 'Master Tipe Billing', 'dev@wepos.id', 'v.1.0.0', '', 'master_pos', 'masterTipeBilling', 0, '2. Master POS>Master Tipe Billing', 2, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Master Tipe Billing', 2309, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-10 17:26:54', 'administrator', '2019-04-30 00:00:00', 1, 0),
(30, 'Master Bank', 'dev@wepos.id', 'v.1.0.0', 'Master Bank', 'master_pos', 'masterBank', 0, '2. Master POS>Master Bank', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Master Bank', 2304, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-10 03:24:53', 'administrator', '2019-04-21 20:05:03', 1, 0),
(33, 'Warehouse Access', 'dev@wepos.id', 'v.1.0.0', 'Warehouse Access', 'master_pos', 'warehouseAccess', 0, '2. Master POS>User Access>Warehouse Access', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>User Access>Warehouse Access', 2401, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-27 19:23:32', 'administrator', '2019-04-21 20:02:49', 1, 0),
(34, 'Printer Access', 'dev@wepos.id', 'v.1.0.0', 'Printer Access', 'master_pos', 'printerAccess', 0, '2. Master POS>User Access>Printer Access', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>User Access>Printer Access', 2402, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-03 06:43:42', 'administrator', '2019-04-21 20:02:38', 1, 0),
(35, 'Supervisor Access', 'dev@wepos.id', 'v.1.0.0', 'Supervisor Access', 'master_pos', 'supervisorAccess', 0, '2. Master POS>User Access>Supervisor Access', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>User Access>Supervisor Access', 2403, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-11 22:53:04', 'administrator', '2019-04-21 20:02:58', 1, 0),
(37, 'Open Cashier (Shift)', 'dev@wepos.id', 'v.1.0', '', 'cashier', 'openCashierShift', 0, '3. Cashier & Sales Order>Open Cashier (Shift)', 7, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '3. Cashier & Sales Order>Open Cashier (Shift)', 3001, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-10 17:28:12', 'administrator', '2019-04-30 00:00:00', 1, 0),
(38, 'Close Cashier (Shift)', 'dev@wepos.id', 'v.1.0', '', 'cashier', 'closeCashierShift', 0, '3. Cashier & Sales Order>Close Cashier (Shift)', 7, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '3. Cashier & Sales Order>Close Cashier (Shift)', 3002, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-10 17:28:17', 'administrator', '2019-04-30 00:00:00', 1, 0),
(39, 'List Open Close Cashier', 'dev@wepos.id', 'v.1.0.0', '', 'cashier', 'listOpenCloseCashier', 0, '3. Cashier & Sales Order>List Open Close Cashier', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '3. Cashier & Sales Order>List Open Close Cashier', 3003, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-20 07:59:55', 'administrator', '2019-04-20 07:59:55', 1, 0),
(40, 'Cashier', 'dev@wepos.id', 'v.1.0', 'Cashier', 'cashier', 'billingCashierRetail', 0, '3. Cashier & Sales Order>Cashier Retail', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '3. Cashier & Sales Order>Cashier Retail', 3101, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-10 03:28:03', 'administrator', '2019-04-22 12:58:59', 1, 0),
(46, 'Cashier Receipt Setup', 'dev@wepos.id', 'v.1.0.0', 'Cashier Receipt Setup', 'cashier', 'cashierReceiptSetupRetail', 0, '3. Cashier & Sales Order>Cashier Receipt Setup', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '3. Cashier & Sales Order>Cashier Receipt Setup', 3301, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-11 06:13:49', 'administrator', '2019-04-22 12:59:09', 1, 0),
(50, 'Purchase Order/Pembelian', 'dev@wepos.id', 'v.1.0.0', 'Purchase Order/Pembelian', 'purchase', 'purchaseOrder', 0, '4. Purchase & Receive>Purchase Order/Pembelian', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '4. Purchase & Receive>Purchase Order/Pembelian', 4201, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-10 03:27:18', 'administrator', '2019-04-15 15:07:08', 1, 0),
(51, 'Receiving List/Penerimaan Barang', 'dev@wepos.id', 'v.1.0.0', 'Receiving List/Penerimaan Barang', 'inventory', 'receivingList', 0, '4. Purchase & Receive>Receiving List/Penerimaan Barang', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '4. Purchase & Receive>Receiving List/Penerimaan Barang', 4301, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-10 12:05:57', 'administrator', '2019-04-22 13:04:22', 1, 0),
(52, 'Daftar Stok Barang', 'dev@wepos.id', 'v.1.0.0', 'Daftar Stok Barang', 'inventory', 'listStock', 0, '5. Inventory>Daftar Stok Barang', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '5. Inventory>Daftar Stok Barang', 5101, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-03 06:43:42', 'administrator', '2019-04-24 13:22:20', 1, 0),
(57, 'Stock Opname', 'dev@wepos.id', 'v.1.0.0', 'Module Stock Opname', 'inventory', 'stockOpname', 0, '5. Inventory>Stock Opname', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '5. Inventory>Stock Opname', 5401, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-10 12:06:05', 'administrator', '2019-04-24 13:22:51', 1, 0),
(76, 'Closing Sales', 'dev@wepos.id', 'v.1.0.0', 'Closing Sales', 'audit_closing', 'closingSales', 0, '8. Closing & Audit>Closing Sales', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '8. Closing & Audit>Closing Sales', 8101, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-03 21:43:42', 'administrator', '2019-04-03 21:43:42', 1, 0),
(77, 'Closing Purchasing', 'dev@wepos.id', 'v.1.0.0', 'Closing Purchasing', 'audit_closing', 'closingPurchasing', 0, '8. Closing & Audit>Closing Purchasing', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '8. Closing & Audit>Closing Purchasing', 8102, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-03 21:47:56', 'administrator', '2019-04-03 21:51:27', 1, 0),
(79, 'Auto Closing Generator', 'dev@wepos.id', 'v.1.0.0', 'Auto Closing Generator', 'monitoring', 'generateAutoClosing', 0, '9. Sync, Backup, Generate>Auto Closing Generator', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '9. Sync, Backup, Generate>Auto Closing Generator', 9102, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-03 21:43:42', 'administrator', '2019-04-03 21:43:42', 0, 1),
(80, 'Backup Master Data', 'dev@wepos.id', 'v.1.0.0', 'Backup Master Data', 'sync_backup', 'syncData', 0, '9. Sync, Backup, Generate>Backup Master Data', 1, 'icon-sync', 'icon-sync', '', '', 1, 0, 1, 0, '9. Sync, Backup, Generate>Backup Master Data', 9201, 'icon-sync', '', 0, 'icon-sync', '', 1, 'icon-sync', '', 1, 'icon-sync', '', 'administrator', '2019-04-25 12:14:44', 'administrator', '2019-04-26 21:05:47', 1, 0),
(81, 'Backup Data Transaksi', 'dev@wepos.id', 'v.1.0.0', 'Backup Data Transaksi', 'sync_backup', 'backupTrx', 0, '9. Sync, Backup, Generate>Backup Data Transaksi', 1, 'icon-backup', 'icon-backup', '', '', 1, 0, 1, 0, '9. Sync, Backup, Generate>Backup Data Transaksi', 9202, 'icon-backup', '', 0, 'icon-backup', '', 1, 'icon-backup', '', 1, 'icon-backup', '', 'administrator', '2019-04-25 12:17:26', 'administrator', '2019-04-26 21:06:01', 1, 0),
(82, 'Generate Report Summary', 'dev@wepos.id', 'v.1.0.0', 'Generate Report Summary', 'generate', 'generateReport', 0, '9. Sync, Backup, Generate>Generate Report Summary', 1, 'icon-generate', 'icon-generate', '', '', 1, 0, 0, 0, '9. Sync, Backup, Generate>Generate Report Summary', 9301, 'icon-generate', '', 0, 'icon-generate', '', 1, 'icon-generate', '', 1, 'icon-generate', '', 'administrator', '2019-04-26 21:10:03', 'administrator', '2019-04-26 21:10:03', 0, 1),
(83, 'Sync & Backup', 'dev@wepos.id', 'v.1.0.0', 'Sync & Backup', 'sync_backup', 'syncBackup', 0, '9. Sync, Backup, Generate>Sync & Backup', 1, 'icon-sync', 'icon-sync', '', '', 1, 0, 1, 0, '9. Sync, Backup, Generate>Sync & Backup', 9203, 'icon-sync', '', 0, 'icon-sync', '', 1, 'icon-sync', '', 1, 'icon-sync', '', 'administrator', '2019-04-25 12:14:44', 'administrator', '2019-04-26 21:05:47', 0, 1),
(84, 'Sales Report', 'dev@wepos.id', 'v.1.0', 'Sales Report', 'billing', 'reportSales', 0, '6. Reports>Sales (Billing)>Sales Report', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Billing)>Sales Report', 6101, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-11 01:28:24', 'administrator', '2019-04-17 17:01:16', 1, 0),
(87, 'Sales Report (Recap)', 'dev@wepos.id', 'v.1.0.0', '', 'billing', 'reportSalesRecap', 0, '6. Reports>Sales (Billing)>Sales Report (Recap)', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Billing)>Sales Report (Recap)', 6104, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-24 16:30:29', 'administrator', '2019-04-24 16:38:02', 1, 0),
(88, 'Sales By Discount', 'dev@wepos.id', 'v.1.0.0', 'Sales By Discount', 'billing', 'salesByDiscount', 0, '6. Reports>Sales (Billing)>Sales By Discount', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Billing)>Sales By Discount', 6105, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-15 20:43:42', 'administrator', '2019-04-15 20:43:42', 1, 0),
(94, 'Cancel Billing Report', 'dev@wepos.id', 'v.1.0.0', '', 'billing', 'reportCancelBill', 0, '6. Reports>Sales (Billing)>Report Cancel Billing', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Billing)>Report Cancel Billing', 6110, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-19 09:45:34', 'administrator', '2019-04-24 16:26:54', 1, 0),
(96, 'Sales By Item', 'dev@wepos.id', 'v.1.0.0', 'Sales By Item', 'billing', 'reportSalesByItem', 0, '6. Reports>Sales (Item)>Sales By Item', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Item)>Sales By Item', 6111, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-09 05:51:55', 'administrator', '2019-04-17 17:47:33', 1, 0),
(103, 'Sales Profit Report', 'dev@wepos.id', 'v.1.0.0', '', 'billing', 'reportSalesProfit', 0, '6. Reports>Sales (Profit)>Sales Profit Report', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Profit)>Sales Profit Report', 6131, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-24 16:46:57', 'administrator', '2019-04-24 17:21:51', 1, 0),
(106, 'Sales Profit Report (Recap)', 'dev@wepos.id', 'v.1.0.0', '', 'billing', 'reportSalesProfitRecap', 0, '6. Reports>Sales (Profit)>Sales Profit Report (Recap)', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Profit)>Sales Profit Report (Recap)', 6134, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-24 16:58:17', 'administrator', '2019-04-24 17:23:59', 1, 0),
(107, 'Sales Profit By Item', 'dev@wepos.id', 'v.1.0.0', 'Sales Profit By Item', 'billing', 'reportSalesProfitByItem', 0, '6. Reports>Sales (Profit)>Sales Profit By Item', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Profit)>Sales Profit By Item', 6135, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-24 16:53:21', 'administrator', '2019-04-17 19:38:07', 1, 0),
(130, 'Bagi Hasil', 'dev@wepos.id', 'v.1.0.0', 'Bagi Hasil Detail', 'billing', 'reportSalesBagiHasil', 0, '6. Reports>Sales (Bagi Hasil)>Bagi Hasil', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Bagi Hasil)>Bagi Hasil', 6301, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-15 06:43:42', 'administrator', '2019-04-15 06:43:42', 1, 0),
(131, 'Bagi Hasil (Recap)', 'dev@wepos.id', 'v.1.0.0', 'Bagi Hasil (Recap)', 'billing', 'reportSalesBagiHasilRecap', 0, '6. Reports>Sales (Bagi Hasil)>Bagi Hasil (Recap)', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Sales (Bagi Hasil)>Bagi Hasil (Recap)', 6302, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-15 06:43:42', 'administrator', '2019-04-15 06:43:42', 1, 0),
(136, 'Purchase Report', 'dev@wepos.id', 'v.1.0.0', 'Purchase Report', 'purchase', 'reportPurchase', 0, '6. Reports>Purchase/Pembelian>Purchase Report', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Purchase/Pembelian>Purchase Report', 6401, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-16 21:28:58', 'administrator', '2019-04-09 19:08:45', 1, 0),
(138, 'Purchase Report (Recap)', 'dev@wepos.id', 'v.1.0.0', 'Purchase Report (Recap)', 'purchase', 'reportPurchaseRecap', 0, '6. Reports>Purchase/Pembelian>Purchase Report (Recap)', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Purchase/Pembelian>Purchase Report (Recap)', 6403, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-17 13:23:40', 'administrator', '2019-04-09 19:08:25', 1, 0),
(139, 'Last Purchase Price', 'dev@wepos.id', 'v.1.0.0', 'Last Purchase Price', 'purchase', 'reportLastPurchasePrice', 0, '6. Reports>Purchase/Pembelian>Last Purchase Price', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Purchase/Pembelian>Last Purchase Price', 6404, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-17 13:23:40', 'administrator', '2019-04-09 19:08:25', 1, 0),
(140, 'Receiving Report', 'dev@wepos.id', 'v.1.0.0', 'Receiving Report', 'inventory', 'reportReceiving', 0, '6. Reports>Receiving (In)>Receiving Report', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Receiving (In)>Receiving Report', 6501, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 0, 'icon-grid', '', 'administrator', '2019-04-17 13:31:50', 'administrator', '2019-04-09 19:00:32', 1, 0),
(143, 'Receiving Report (Recap)', 'dev@wepos.id', 'v.1.0.0', 'Receiving Report (Recap)', 'inventory', 'reportReceivingRecap', 0, '6. Reports>Receiving (In)>Receiving Report (Recap)', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Receiving (In)>Receiving Report (Recap)', 6504, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-09 15:57:19', 'administrator', '2019-04-09 19:01:16', 1, 0),
(156, 'Monitoring Stock (Actual)', 'dev@wepos.id', 'v.1.0.0', 'Monitoring Stock (Actual)', 'inventory', 'reportMonitoringStock', 0, '6. Reports>Warehouse>Monitoring Stock (Actual)', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Warehouse>Monitoring Stock (Actual)', 6642, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-11 23:44:12', 'administrator', '2019-04-18 00:45:36', 1, 0),
(157, 'Kartu Stok', 'dev@wepos.id', 'v.1.0.0', 'Kartu Stok', 'inventory', 'kartuStok', 0, '6. Reports>Warehouse>Kartu Stock', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '6. Reports>Warehouse>Kartu Stock', 6643, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-03 06:43:42', 'administrator', '2019-04-18 00:46:03', 1, 0),
(176, 'Product Category', 'dev@wepos.id', 'v.1.0', '', 'master_pos', 'productCategory', 0, '2. Master POS>Product Category', 2, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Product Category', 2101, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-10 17:26:07', 'administrator', '2019-04-30 00:00:00', 1, 0),
(177, 'Master Product & Package', 'dev@wepos.id', 'v.1.0', 'Master Product & Package', 'master_pos', 'masterProduct', 0, '2. Master POS>Master Product', 2, 'icon-grid', 'icon-grid', '', '', 1, 0, 1, 0, '2. Master POS>Master Product', 2102, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-04-10 17:24:38', 'administrator', '2019-04-30 00:00:00', 1, 0),
(184, 'Pembayaran PPOB', 'dev@wepos.id', 'v.1.0.0', 'Pembayaran PPOB', 'cashier', 'ppob', 0, '3. Cashier & Sales Order>Pembayaran PPOB', 1, 'icon-grid', 'icon-grid', '', '', 1, 0, 0, 0, '3. Cashier & Sales Order>Pembayaran PPOB', 3401, 'icon-grid', '', 0, 'icon-grid', '', 1, 'icon-grid', '', 1, 'icon-grid', '', 'administrator', '2019-02-18 08:25:57', 'administrator', '2019-02-17 17:49:57', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_modules_method`
--

CREATE TABLE `apps_modules_method` (
  `id` smallint(6) NOT NULL,
  `method_function` char(100) NOT NULL,
  `module_id` smallint(6) NOT NULL,
  `method_description` char(100) DEFAULT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_modules_preload`
--

CREATE TABLE `apps_modules_preload` (
  `id` smallint(6) NOT NULL,
  `preload_filename` char(50) NOT NULL,
  `preload_folderpath` char(100) DEFAULT NULL,
  `module_id` smallint(6) NOT NULL,
  `preload_description` char(100) DEFAULT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_options`
--

CREATE TABLE `apps_options` (
  `id` bigint(11) NOT NULL,
  `option_var` varchar(100) NOT NULL,
  `option_value` mediumtext NOT NULL,
  `option_description` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `createdby` varchar(50) NOT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_options`
--

INSERT INTO `apps_options` (`id`, `option_var`, `option_value`, `option_description`, `created`, `createdby`, `updated`, `updatedby`, `is_active`, `is_deleted`) VALUES
(1, 'timezone_default', 'Asia/Jakarta', 'Timezone Asia/Jakarta', '2018-07-08 23:12:43', 'administrator', NULL, 'administrator', 1, 0),
(2, 'report_place_default', 'Bogor', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(3, 'input_chinese_text', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(4, 'payment_id_cash', '1', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(5, 'payment_id_debit', '2', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(6, 'payment_id_credit', '3', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(7, 'warehouse_primary', '1', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(8, 'auto_logout_time', '3600', NULL, '2018-07-16 12:12:12', 'administrator', NULL, NULL, 1, 0),
(9, 'use_login_pin', '', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(10, 'wepos_tipe', 'retail', 'retail/cafe/foodcourt', '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(11, 'retail_warehouse', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(12, 'spv_access_active', 'retur_order,unmerge_billing,change_ppn,change_service,change_dp,set_compliment_item,clear_compliment_item', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(13, 'supervisor_pin_mode', '', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(14, 'management_systems', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(15, 'ipserver_management_systems', '', NULL, '2018-07-11 20:00:00', 'administrator', '2019-04-26 00:00:01', NULL, 1, 0),
(16, 'multiple_store', '0', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(17, 'view_multiple_store', '', NULL, '2018-07-02 19:11:13', '', '2019-04-26 00:00:01', NULL, 1, 0),
(18, 'autobackup_on_settlement', '', NULL, '2018-07-02 19:11:13', '', NULL, NULL, 1, 0),
(19, 'wepos_update_version', '', NULL, '2018-07-02 19:11:21', '', NULL, NULL, 1, 0),
(20, 'wepos_update_version2', '', NULL, '2018-07-02 19:11:21', '', NULL, NULL, 1, 0),
(21, 'wepos_update_next_version', '', NULL, '2018-07-02 19:13:04', '', NULL, NULL, 1, 0),
(22, 'wepos_update_next_version2', '', NULL, '2018-07-02 19:13:04', '', NULL, NULL, 1, 0),
(23, 'wepos_connected_id', '', NULL, '2018-07-02 19:13:04', '', NULL, NULL, 1, 0),
(24, 'current_date', '1569967200', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(25, 'store_connected_id', '', NULL, '2018-07-02 19:32:18', '', NULL, NULL, 1, 0),
(26, 'store_connected_code', '', NULL, '2018-07-02 19:32:18', '', NULL, NULL, 1, 0),
(27, 'print_preview_billing', '1', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(28, 'big_size_width', '1024', NULL, '2018-07-13 20:00:00', 'administrator', NULL, NULL, 1, 0),
(29, 'big_size_height', '768', NULL, '2018-07-13 20:00:00', 'administrator', NULL, NULL, 1, 0),
(30, 'thumb_size_width', '375', NULL, '2018-07-13 20:00:00', 'administrator', NULL, NULL, 1, 0),
(31, 'thumb_size_height', '250', NULL, '2018-07-13 20:00:00', 'administrator', NULL, NULL, 1, 0),
(32, 'tiny_size_width', '160', NULL, '2018-07-13 20:00:00', 'administrator', NULL, NULL, 1, 0),
(33, 'tiny_size_height', '120', NULL, '2018-07-13 20:00:00', 'administrator', NULL, NULL, 1, 0),
(34, 'big_size_real', '1', NULL, '2018-07-13 20:00:00', 'administrator', NULL, NULL, 1, 0),
(35, 'auto_item_code', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(36, 'item_code_separator', '.', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(37, 'item_code_format', '{Cat}.{SubCat1}.{ItemNo}', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(38, 'item_no_length', '4', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(39, 'so_count_stock', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(40, 'ds_count_stock', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(41, 'ds_auto_terima', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(42, 'auto_add_supplier_item_when_purchasing', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(43, 'purchasing_request_order', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(44, 'use_approval_po', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(45, 'auto_add_supplier_ap', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(46, 'receiving_select_warehouse', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(47, 'stock_rekap_start_date', '01-04-2019', NULL, '2018-07-12 18:00:00', 'administrator', '2019-04-26 00:00:01', NULL, 1, 0),
(48, 'persediaan_barang', 'average', 'average,fifo', '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(49, 'hide_empty_stock_on_report', '1', NULL, '2018-07-10 20:00:00', 'administrator', NULL, NULL, 1, 0),
(50, 'approval_change_payment_po_done', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(51, 'use_item_sku', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(52, 'autocut_stok_sales_to_usage', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(53, 'autocut_stok_sales_to_usage_spv', '0', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(54, 'item_sku_from_code', '', NULL, '2018-07-02 19:11:13', '', NULL, NULL, 1, 0),
(55, 'include_tax', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(56, 'include_service', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(57, 'role_id_kasir', '1,2,5', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(58, 'takeaway_no_tax', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(59, 'takeaway_no_service', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(60, 'use_pembulatan', '1', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(61, 'pembulatan_dinamis', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(62, 'cashier_pembulatan_keatas', '1', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(63, 'cashier_max_pembulatan', '100', 'MAX PEMBULATAN', '2018-07-05 11:41:36', '', NULL, NULL, 1, 0),
(64, 'default_tax_percentage', '10', 'DEF TAX', '2018-07-17 22:46:13', 'administrator', '2018-07-10 03:44:35', 'administrator', 1, 0),
(65, 'default_service_percentage', '', 'DEF SERVICE', '2018-07-17 22:46:36', 'administrator', '2018-07-10 03:44:35', 'administrator', 1, 0),
(66, 'table_available_after_paid', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(67, 'hide_compliment_order', '1', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(68, 'hide_takeaway_order_apps', '', NULL, '2018-07-06 14:50:09', 'administrator', NULL, NULL, 1, 0),
(69, 'hide_compliment_order_apps', '1', NULL, '2018-07-06 14:50:09', 'administrator', NULL, NULL, 1, 0),
(70, 'use_order_counter', '0', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(71, 'order_menu_after_booked_on_tablet', '0', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(72, 'order_menu_after_reserved_on_tablet', '0', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(73, 'autohold_create_billing', '1', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(74, 'diskon_sebelum_pajak_service', '', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(75, 'default_discount_payment', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(76, 'no_midnight', '0', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(77, 'billing_log', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(78, 'save_order_note', '', NULL, '2018-07-10 20:00:00', 'administrator', NULL, NULL, 1, 0),
(79, 'order_timer', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(80, 'hide_button_invoice', '', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(81, 'hide_button_halfpayment', '', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(82, 'hide_button_mergebill', '1', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(83, 'hide_button_splitbill', '1', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(84, 'hide_button_logoutaplikasi', '1', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(85, 'set_ta_table_ta', '', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(86, 'cashier_credit_ar', '', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(87, 'min_noncash', '', NULL, '2018-07-12 20:00:00', 'administrator', NULL, NULL, 1, 0),
(88, 'must_choose_customer', '', NULL, '2018-07-02 19:11:13', '', NULL, NULL, 1, 0),
(89, 'no_hold_billing', '1', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(90, 'default_tipe_billing', '1', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(91, 'salesorder_cek_stok', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(92, 'salesorder_cashier', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(93, 'salesorder_cashier_spv', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(94, 'tujuan_penerimaan_dp_salesorder', '', NULL, '2018-07-02 19:11:13', '', NULL, NULL, 1, 0),
(95, 'jenis_penerimaan_dp_salesorder', '', NULL, '2018-07-02 19:11:13', '', NULL, NULL, 1, 0),
(96, 'default_discount_id_salesorder', '', NULL, '2018-07-02 19:11:13', '', NULL, NULL, 1, 0),
(97, 'cashierReceipt_layout', '[align=1][size=1]Bafageh Rooftop Cafe\n[align=1][size=0]Jl. Raya Puncak KM 86 3rd Floor Ruko Bafageh Business Center\n[align=1]Delivery Order: 0895-6176-96143\n[set_tab1b]\n[size=1]{billing_no}[tab]{tipe_billing=\"\"}\n[size=0][align=0]--------------------------------\n[set_tab1]\n{order_data}\n[align=0]--------------------------------\n[set_tab2]\n[tab]SUB TOTAL[tab]{subtotal}\n{hide_empty}[tab]PAJAK[tab]{tax_total}\n{hide_empty}[tab]DISC[tab]{potongan}\n{hide_empty}[tab]COMPLIMENT[tab]{compliment}\n{hide_empty}[tab]DP[tab]{dp_total}\n{hide_empty}[tab]PEMBULATAN[tab]{rounded}\n[size=1][tab]GRAND TOTAL[tab]{grand_total}\n{hide_empty}[size=0][tab]BAYAR[tab]{cash}\n{hide_empty}[tab]KEMBALI[tab]{return}\n[size=0][align=0]--------------------------------\n[size=0][align=0]Payment: {payment_type}\n{hide_empty}[size=0][align=0]Tipe: {customer}\n\n', 'cashier print receipt layout', '2018-07-06 01:16:17', 'system', '2018-07-06 01:16:17', 'system', 1, 0),
(98, 'cashierReceipt_layout_footer', '[size=0][align=0]--------------------------------\n[align=1] {date_time} : {user}\n\n[align=1]Terima Kasih\n[align=1]Kami Tunggu Kedatangan Anda Kembali\n\n.\n\n\n\n', '', '2018-07-06 01:16:17', 'system', '2018-07-06 01:16:17', 'system', 1, 0),
(99, 'qcReceipt_layout', '[align=1][size=1]QC / CHECKER\n[size=0][align=0]--------------------------------\n[set_tab1b]\n[align=0][size=1]{tipe_billing}[tab]\n[align=0][size=0]{date_time}[tab]{user}\n[size=0][align=0]--------------------------------\n[set_tab1a]\n[size=0]{order_data_other}\n\nNotes: {qc_notes}', 'QC receipt layout', '2018-07-08 02:51:16', 'administrator', '2018-07-31 12:47:27', 'administrator', 1, 0),
(100, 'cashierReceipt_invoice_layout', '[align=1][size=1]Bafageh Rooftop Cafe\n[align=1][size=0]Jl. Raya Puncak KM 86 3rd Floor Ruko Bafageh Business Center\n[align=1]Delivery Order: 0895-6176-96143\n[set_tab1b]\n[size=1]{billing_no}[tab]{tipe_billing=\"\"}\n[size=0][align=0]--------------------------------\n[set_tab1]\n{order_data}\n[align=0]--------------------------------\n[set_tab2]\n[tab]SUB TOTAL[tab]{subtotal}\n{hide_empty}[tab]PAJAK[tab]{tax_total}\n{hide_empty}[tab]DISC[tab]{potongan}\n{hide_empty}[tab]COMPLIMENT[tab]{compliment}\n{hide_empty}[tab]DP[tab]{dp_total}\n{hide_empty}[tab]PEMBULATAN[tab]{rounded}\n[size=1][tab]GRAND TOTAL[tab]{grand_total}\n[size=0][align=0]--------------------------------\n{hide_empty}[size=0][align=0]Tipe: {customer}\n', 'cashier print invoice layout', '2018-07-06 01:16:17', 'system', '2018-07-06 01:16:17', 'system', 1, 0),
(101, 'cashierReceipt_bagihasil_layout', '[align=1][size=1]Bafageh Rooftop Cafe\n[align=1][size=0]Jl. Raya Puncak KM 86 3rd Floor Ruko Bafageh Business Center\n[align=1]Delivery Order: 0895-6176-96143\n[align=1]{supplier_name}\n\n[set_tab1b]\n[size=1]{tanggal_shift} {jam_shift}[tab]\n[size=0][align=0]--------------------------------\n[set_tab3]\n{sales_data}\n[align=0]--------------------------------\n[set_tab1]\n[size=0]TOTAL ITEM[tab]{total_qty}\nTOTAL SALES[tab]{total_sales}\nTOTAL TOKO[tab]{total_toko}\nTOTAL SUPPLIER[tab]{total_supplier}\n', NULL, '2018-07-06 01:16:17', 'system', '2018-07-06 01:16:17', 'system', 1, 0),
(102, 'cashierReceipt_settlement_layout', '[align=1][size=1]Bafageh Rooftop Cafe\n[align=1][size=0]Jl. Raya Puncak KM 86 3rd Floor Ruko Bafageh Business Center\n[align=1]Delivery Order: 0895-6176-96143\n\n[align=1][size=1]SETTLEMENT  {tanggal_settlement} \n[set_tab1]\n[align=1][size=0]{tanggal_shift} {jam_shift} - by: {user}\n[size=0][align=0]--------------------------------\n[set_tab3]\n{summary_data}\n[align=0]--------------------------------\n[set_tab3]\n[align=0]{payment_data}\n\n', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(103, 'cashierReceipt_openclose_layout', '[align=1][size=1]Bafageh Rooftop Cafe\n[align=1][size=0]Jl. Raya Puncak KM 86 3rd Floor Ruko Bafageh Business Center\n[align=1]Delivery Order: 0895-6176-96143\n\n[set_tab1b]\n[align=0][size=0]{tipe_openclose}: {shift_on}[tab]\n[align=0][size=0]{tanggal_shift} {jam_shift}[tab]\n[size=0][align=0]--------------------------------\n[set_tab3]\n{uang_kertas_data}\n{uang_koin_data}{summary_data}\n[align=0]--------------------------------\n[set_tab3]\n[align=0]{payment_data}approved: {spv_user}\n\n', NULL, '2018-07-06 01:16:17', 'system', '2018-07-06 01:16:17', 'system', 1, 0),
(104, 'salesorderReceipt_layout', '[align=1][size=1]Bafageh Rooftop Cafe\n[size=0]Jl. Raya Puncak KM 86 3rd Floor Ruko Bafageh Business Center\n[align=1]Delivery Order: 0895-6176-96143\n\n[set_tab1]\n[align=0][size=0]{tipe_openclose}: {shift_on}[tab]\n[align=0][size=0]{tanggal_shift} {jam_shift}[tab]\n[size=0][align=0]--------------------------------\n[set_tab3]\n{uang_kertas_data}\n{uang_koin_data}{summary_data}\n[align=0]--------------------------------\n[set_tab3]\n[align=0]{payment_data}approved: {spv_user}\n\n\n', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(105, 'print_chinese_text', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(106, 'print_order_peritem_kitchen', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(107, 'print_order_peritem_bar', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(108, 'print_order_peritem_other', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(109, 'printMonitoring_qc', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(110, 'printMonitoring_kitchen', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(111, 'printMonitoring_bar', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(112, 'printMonitoring_other', '', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(113, 'printMonitoringTime_qc', '2000', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(114, 'printMonitoringTime_kitchen', '2000', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(115, 'printMonitoringTime_bar', '2000', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(116, 'printMonitoringTime_other', '2000', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(117, 'cleanPrintMonitoring', '06:00', NULL, '2018-07-23 19:00:00', 'administrator', NULL, NULL, 1, 0),
(118, 'show_multiple_print_qc', '', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(119, 'multiple_print_qc', '1', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(120, 'print_qc_then_order', '', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(121, 'show_multiple_print_billing', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(122, 'multiple_print_billing', '1', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(123, 'print_qc_order_when_payment', '', NULL, '2018-07-11 20:00:00', 'administrator', NULL, NULL, 1, 0),
(124, 'do_print_cashierReceipt_default', '1', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(125, 'printer_tipe_cashierReceipt_default', 'QPOS', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(126, 'printer_pin_cashierReceipt_default', '32 CHAR', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(127, 'printer_ip_cashierReceipt_default', 'angga-pc\\pos-58', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(128, 'printer_id_cashierReceipt_default', '1', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(129, 'do_print_qcReceipt_default', '1', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(130, 'printer_tipe_qcReceipt_default', 'QPOS', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(131, 'printer_pin_qcReceipt_default', '32 CHAR', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(132, 'printer_ip_qcReceipt_default', 'angga-pc\\pos-58', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(133, 'printer_id_qcReceipt_default', '1', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(134, 'do_print_cashierReceipt_127.0.0.1', '1', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(135, 'printer_tipe_cashierReceipt_127.0.0.1', 'QPOS', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(136, 'printer_pin_cashierReceipt_127.0.0.1', '32 CHAR', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(137, 'printer_ip_cashierReceipt_127.0.0.1', 'angga-pc\\pos-58', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(138, 'printer_id_cashierReceipt_127.0.0.1', '1', NULL, '2018-07-28 19:57:55', 'administrator', '2018-07-28 19:57:55', 'administrator', 1, 0),
(139, 'do_print_qcReceipt_127.0.0.1', '1', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(140, 'printer_tipe_qcReceipt_127.0.0.1', 'QPOS', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(141, 'printer_pin_qcReceipt_127.0.0.1', '32 CHAR', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(142, 'printer_ip_qcReceipt_127.0.0.1', 'angga-pc\\pos-58', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(143, 'printer_id_qcReceipt_127.0.0.1', '1', NULL, '2018-07-05 00:11:02', 'administrator', '2018-07-05 00:11:02', 'administrator', 1, 0),
(144, 'closing_sales_start_date', '01-04-2019', NULL, '2018-07-06 20:00:00', 'administrator', '2019-04-26 00:00:01', NULL, 1, 0),
(145, 'closing_purchasing_start_date', '01-04-2019', NULL, '2018-07-09 00:00:00', '', '2019-04-26 00:00:01', NULL, 1, 0),
(146, 'closing_inventory_start_date', '01-04-2019', NULL, '2018-07-02 12:00:00', '', '2019-04-26 00:00:01', NULL, 1, 0),
(147, 'closing_accounting_start_date', '01-04-2019', NULL, '2018-07-06 20:00:00', 'administrator', '2019-04-26 00:00:01', NULL, 1, 0),
(148, 'autoclosing_generate_sales', '1', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(149, 'autoclosing_generate_purchasing', '1', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(150, 'autoclosing_generate_inventory', '1', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(151, 'autoclosing_generate_stock', '1', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(152, 'autoclosing_generate_accounting', '', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(153, 'autoclosing_closing_sales', '', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(154, 'autoclosing_closing_purchasing', '', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(155, 'autoclosing_closing_inventory', '', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(156, 'autoclosing_closing_accounting', '', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(157, 'autoclosing_auto_cancel_billing', '1', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(158, 'autoclosing_auto_cancel_receiving', '1', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(159, 'autoclosing_auto_cancel_distribution', '1', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(160, 'autoclosing_auto_cancel_production', '1', NULL, '2018-07-08 12:43:06', '', NULL, NULL, 1, 0),
(161, 'autoclosing_skip_open_jurnal', '', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(162, 'autoclosing_generate_timer', '360000', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(163, 'autoclosing_closing_time', '03:00', NULL, '2018-07-01 12:00:43', '', NULL, NULL, 1, 0),
(164, 'account_payable_non_accounting', '1', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(165, 'account_receivable_non_accounting', '1', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(166, 'cashflow_receivable_non_accounting', '1', NULL, '2018-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(167, 'cashflow_non_accounting', '1', NULL, '2016-07-06 20:00:00', 'administrator', NULL, NULL, 1, 0),
(168, 'merchant_key', '', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(169, 'merchant_tipe', 'retail', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(170, 'merchant_cor_token', '0', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(171, 'merchant_acc_token', '0', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(172, 'merchant_mkt_token', '0', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(173, 'produk_nama', 'Rooftop Cafe', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(174, 'produk_key', 'GFR-0001', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(175, 'produk_expired', 'unlimited', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(176, 'share_membership', '', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(177, 'merchant_last_check', '1566890655', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(178, 'merchant_last_checkon', '1555934167', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(179, 'hide_tanya_wepos', '', NULL, '2018-07-04 00:00:00', 'administrator', NULL, NULL, 1, 0),
(181, 'use_wms', '', NULL, NULL, '', NULL, NULL, 1, 0),
(182, 'opsi_no_print_when_payment', '', NULL, NULL, '', NULL, NULL, 1, 0),
(183, 'using_item_average_as_hpp', '', NULL, NULL, '', NULL, NULL, 1, 0),
(184, 'store_connected_name', '', NULL, '2019-04-26 00:00:01', 'administrator', NULL, NULL, 1, 0),
(185, 'store_connected_email', '', NULL, '2019-04-26 00:00:01', 'administrator', NULL, NULL, 1, 0),
(186, 'as_server_backup', '', NULL, '2019-04-26 00:00:01', 'administrator', NULL, NULL, 1, 0),
(187, 'wepos_version', '3.42.20', NULL, '2019-04-26 00:00:01', 'administrator', NULL, NULL, 1, 0),
(188, 'stock_rekap_last_update', '27-08-2019 17:15:00', NULL, NULL, '', NULL, NULL, 1, 0),
(189, 'store_connected_phone', '', NULL, NULL, '', NULL, NULL, 1, 0),
(190, 'use_ppob', '0', NULL, NULL, '', NULL, NULL, 1, 0),
(191, 'ppob_key', '', NULL, NULL, '', NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_roles`
--

CREATE TABLE `apps_roles` (
  `id` smallint(6) NOT NULL,
  `role_name` char(50) NOT NULL,
  `role_description` char(100) DEFAULT NULL,
  `role_window_mode` enum('full','lite') DEFAULT 'full',
  `client_id` tinyint(4) NOT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_roles`
--

INSERT INTO `apps_roles` (`id`, `role_name`, `role_description`, `role_window_mode`, `client_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'Super Admin', 'Super Admin Roles', 'full', 1, 'administrator', '2014-08-11 14:20:00', 'admin', '2018-09-04 10:05:23', 1, 0),
(2, 'Apps Admin', 'Application Admin', 'full', 1, 'administrator', '2014-08-11 14:22:25', 'admin', '2018-09-04 10:05:33', 1, 0),
(3, 'Inventory', 'Inventory', 'full', 1, 'administrator', '2014-06-22 17:08:20', 'admin', '2018-09-04 10:10:55', 1, 0),
(4, 'Purchasing', '', 'full', 1, 'administrator', '2016-10-03 04:56:31', 'admin', '2018-09-04 10:09:56', 1, 0),
(5, 'Cashier', '', 'full', 1, 'administrator', '2016-10-29 09:54:10', 'admin', '2018-09-04 10:14:10', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_roles_module`
--

CREATE TABLE `apps_roles_module` (
  `id` smallint(6) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  `module_id` smallint(6) NOT NULL,
  `start_menu_path` char(100) DEFAULT NULL,
  `module_order` smallint(6) DEFAULT '0',
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_roles_module`
--

INSERT INTO `apps_roles_module` (`id`, `role_id`, `module_id`, `start_menu_path`, `module_order`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 1, 162, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(2, 1, 61, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(3, 1, 59, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(4, 1, 165, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(5, 1, 166, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(6, 1, 62, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(7, 1, 163, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(8, 1, 63, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(9, 1, 164, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(10, 1, 167, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(11, 1, 64, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(12, 1, 65, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(13, 1, 168, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(14, 1, 60, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(15, 1, 170, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(16, 1, 171, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(17, 1, 66, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(18, 1, 169, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(19, 1, 78, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(20, 1, 77, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(21, 1, 76, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(22, 1, 130, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(23, 1, 131, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(24, 1, 94, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(25, 1, 93, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(26, 1, 135, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(27, 1, 134, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(28, 1, 95, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(29, 1, 92, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(30, 1, 43, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(31, 1, 42, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(32, 1, 44, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(33, 1, 45, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(34, 1, 160, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(35, 1, 88, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(36, 1, 89, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(37, 1, 96, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(38, 1, 98, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(39, 1, 97, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(40, 1, 102, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(41, 1, 99, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(42, 1, 100, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(43, 1, 101, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(44, 1, 107, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(45, 1, 109, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(46, 1, 108, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(47, 1, 110, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(48, 1, 103, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(49, 1, 106, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(50, 1, 104, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(51, 1, 105, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(52, 1, 84, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(53, 1, 87, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(54, 1, 85, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(55, 1, 86, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(56, 1, 90, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(57, 1, 133, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(58, 1, 132, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(59, 1, 72, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(60, 1, 70, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(61, 1, 71, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(62, 1, 174, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(63, 1, 172, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(64, 1, 173, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(65, 1, 175, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(66, 1, 75, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(67, 1, 73, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(68, 1, 74, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(69, 1, 69, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(70, 1, 67, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(71, 1, 68, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(72, 1, 40, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(73, 1, 46, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(74, 1, 38, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(75, 1, 39, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(76, 1, 37, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(77, 1, 47, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(78, 1, 52, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(79, 1, 53, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(80, 1, 54, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(81, 1, 147, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(82, 1, 146, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(83, 1, 148, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(84, 1, 155, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(85, 1, 157, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(86, 1, 158, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(87, 1, 58, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(88, 1, 156, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(89, 1, 150, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(90, 1, 149, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(91, 1, 151, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(92, 1, 55, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(93, 1, 142, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(94, 1, 141, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(95, 1, 51, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(96, 1, 144, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(97, 1, 145, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(98, 1, 140, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(99, 1, 143, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(100, 1, 57, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(101, 1, 153, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(102, 1, 152, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(103, 1, 154, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(104, 1, 56, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(105, 1, 159, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(106, 1, 26, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(107, 1, 20, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(108, 1, 30, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(109, 1, 32, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(110, 1, 31, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(111, 1, 25, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(112, 1, 29, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(113, 1, 19, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(114, 1, 28, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(115, 1, 18, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(116, 1, 17, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(117, 1, 15, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(118, 1, 36, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(119, 1, 34, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(120, 1, 27, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(121, 1, 21, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(122, 1, 22, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(123, 1, 23, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(124, 1, 24, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(125, 1, 35, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(126, 1, 16, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(127, 1, 33, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(128, 1, 79, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(129, 1, 139, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(130, 1, 137, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(131, 1, 50, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(132, 1, 136, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(133, 1, 138, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(134, 1, 48, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(135, 1, 49, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(136, 1, 41, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(137, 1, 114, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(138, 1, 116, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(139, 1, 115, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(140, 1, 117, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(141, 1, 118, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(142, 1, 119, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(143, 1, 120, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(144, 1, 112, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(145, 1, 123, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(146, 1, 125, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(147, 1, 124, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(148, 1, 126, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(149, 1, 127, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(150, 1, 128, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(151, 1, 129, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(152, 1, 121, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(153, 1, 122, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(154, 1, 111, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(155, 1, 113, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(156, 1, 81, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(157, 1, 83, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(158, 1, 80, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(159, 1, 2, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(160, 1, 3, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(161, 1, 4, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(162, 1, 6, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(163, 1, 8, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(164, 1, 11, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(165, 1, 161, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(166, 1, 12, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(167, 1, 14, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(168, 1, 9, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(169, 1, 10, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(170, 1, 5, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(171, 1, 1, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(172, 1, 7, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(173, 1, 13, NULL, 0, 'admin', '2018-09-04 10:05:23', 'admin', '2018-09-04 10:05:23', 1, 0),
(174, 2, 162, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(175, 2, 61, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(176, 2, 59, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(177, 2, 165, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(178, 2, 166, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(179, 2, 62, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(180, 2, 163, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(181, 2, 63, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(182, 2, 164, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(183, 2, 167, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(184, 2, 64, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(185, 2, 65, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(186, 2, 168, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(187, 2, 60, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(188, 2, 170, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(189, 2, 171, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(190, 2, 66, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(191, 2, 169, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(192, 2, 78, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(193, 2, 77, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(194, 2, 76, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(195, 2, 130, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(196, 2, 131, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(197, 2, 94, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(198, 2, 93, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(199, 2, 135, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(200, 2, 134, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(201, 2, 95, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(202, 2, 92, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(203, 2, 43, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(204, 2, 42, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(205, 2, 44, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(206, 2, 45, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(207, 2, 160, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(208, 2, 88, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(209, 2, 89, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(210, 2, 96, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(211, 2, 98, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(212, 2, 97, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(213, 2, 102, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(214, 2, 99, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(215, 2, 100, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(216, 2, 101, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(217, 2, 107, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(218, 2, 109, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(219, 2, 108, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(220, 2, 110, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(221, 2, 103, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(222, 2, 106, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(223, 2, 104, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(224, 2, 105, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(225, 2, 84, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(226, 2, 87, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(227, 2, 85, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(228, 2, 86, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(229, 2, 90, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(230, 2, 133, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(231, 2, 132, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(232, 2, 72, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(233, 2, 70, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(234, 2, 71, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(235, 2, 174, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(236, 2, 172, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(237, 2, 173, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(238, 2, 175, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(239, 2, 75, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(240, 2, 73, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(241, 2, 74, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(242, 2, 69, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(243, 2, 67, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(244, 2, 68, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(245, 2, 40, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(246, 2, 46, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(247, 2, 38, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(248, 2, 39, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(249, 2, 37, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(250, 2, 47, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(251, 2, 52, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(252, 2, 53, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(253, 2, 54, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(254, 2, 147, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(255, 2, 146, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(256, 2, 148, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(257, 2, 155, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(258, 2, 157, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(259, 2, 158, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(260, 2, 58, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(261, 2, 156, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(262, 2, 150, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(263, 2, 149, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(264, 2, 151, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(265, 2, 55, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(266, 2, 142, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(267, 2, 141, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(268, 2, 51, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(269, 2, 144, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(270, 2, 145, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(271, 2, 140, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(272, 2, 143, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(273, 2, 57, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(274, 2, 153, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(275, 2, 152, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(276, 2, 154, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(277, 2, 56, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(278, 2, 159, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(279, 2, 26, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(280, 2, 20, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(281, 2, 30, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(282, 2, 32, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(283, 2, 31, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(284, 2, 25, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(285, 2, 29, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(286, 2, 19, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(287, 2, 28, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(288, 2, 18, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(289, 2, 17, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(290, 2, 15, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(291, 2, 36, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(292, 2, 34, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(293, 2, 27, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(294, 2, 21, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(295, 2, 22, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(296, 2, 23, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(297, 2, 24, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(298, 2, 35, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(299, 2, 16, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(300, 2, 33, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(301, 2, 79, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(302, 2, 139, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(303, 2, 137, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(304, 2, 50, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(305, 2, 136, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(306, 2, 138, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(307, 2, 48, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(308, 2, 49, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(309, 2, 41, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(310, 2, 114, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(311, 2, 116, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(312, 2, 115, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(313, 2, 117, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(314, 2, 118, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(315, 2, 119, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(316, 2, 120, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(317, 2, 112, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(318, 2, 123, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(319, 2, 125, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(320, 2, 124, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(321, 2, 126, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(322, 2, 127, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(323, 2, 128, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(324, 2, 129, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(325, 2, 121, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(326, 2, 122, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(327, 2, 111, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(328, 2, 113, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(329, 2, 81, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(330, 2, 83, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(331, 2, 80, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(332, 2, 2, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(333, 2, 3, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(334, 2, 4, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(335, 2, 6, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(336, 2, 8, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(337, 2, 11, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(338, 2, 161, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(339, 2, 12, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(340, 2, 14, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(341, 2, 9, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(342, 2, 10, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(343, 2, 5, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(344, 2, 1, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(345, 2, 7, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(346, 2, 13, NULL, 0, 'admin', '2018-09-04 10:05:33', 'admin', '2018-09-04 10:05:33', 1, 0),
(347, 4, 157, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(348, 4, 139, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(349, 4, 137, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(350, 4, 50, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(351, 4, 136, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(352, 4, 138, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(353, 4, 48, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(354, 4, 49, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(355, 4, 20, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(356, 4, 25, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(357, 4, 21, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(358, 4, 22, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(359, 4, 19, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(360, 4, 162, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(361, 4, 62, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(362, 4, 165, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(363, 4, 166, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(364, 4, 163, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(365, 4, 61, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(366, 4, 8, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(367, 4, 11, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(368, 4, 12, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(369, 4, 14, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(370, 4, 9, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(371, 4, 10, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(372, 4, 7, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(373, 4, 52, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(374, 4, 159, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(375, 4, 77, NULL, 0, 'admin', '2018-09-04 10:09:56', 'admin', '2018-09-04 10:09:56', 1, 0),
(376, 3, 7, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(377, 3, 10, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(378, 3, 9, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(379, 3, 14, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(380, 3, 12, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(381, 3, 11, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(382, 3, 8, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(383, 3, 78, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(384, 3, 52, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(385, 3, 53, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(386, 3, 54, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(387, 3, 147, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(388, 3, 146, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(389, 3, 148, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(390, 3, 155, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(391, 3, 157, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(392, 3, 158, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(393, 3, 58, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(394, 3, 156, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(395, 3, 150, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(396, 3, 149, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(397, 3, 151, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(398, 3, 55, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(399, 3, 142, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(400, 3, 141, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(401, 3, 51, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(402, 3, 144, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(403, 3, 145, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(404, 3, 140, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(405, 3, 143, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(406, 3, 57, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(407, 3, 153, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(408, 3, 152, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(409, 3, 154, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(410, 3, 56, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(411, 3, 159, NULL, 0, 'admin', '2018-09-04 10:10:55', 'admin', '2018-09-04 10:10:55', 1, 0),
(412, 5, 94, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(413, 5, 93, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(414, 5, 42, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(415, 5, 44, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(416, 5, 45, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(417, 5, 43, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(418, 5, 88, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(419, 5, 89, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(420, 5, 96, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(421, 5, 97, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(422, 5, 90, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(423, 5, 84, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(424, 5, 87, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(425, 5, 76, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(426, 5, 8, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(427, 5, 11, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(428, 5, 12, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(429, 5, 14, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(430, 5, 9, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(431, 5, 10, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(432, 5, 7, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(433, 5, 40, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(434, 5, 46, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(435, 5, 38, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(436, 5, 37, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(437, 5, 47, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(438, 1, 176, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(439, 2, 176, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(440, 1, 177, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(441, 2, 177, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(442, 5, 184, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(443, 1, 184, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0),
(444, 2, 184, NULL, 0, 'admin', '2018-09-04 10:14:10', 'admin', '2018-09-04 10:14:10', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_roles_widget`
--

CREATE TABLE `apps_roles_widget` (
  `id` smallint(6) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  `widget_id` smallint(6) NOT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_supervisor`
--

CREATE TABLE `apps_supervisor` (
  `id` smallint(6) NOT NULL,
  `user_id` smallint(6) NOT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_supervisor`
--

INSERT INTO `apps_supervisor` (`id`, `user_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 2, 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_supervisor_access`
--

CREATE TABLE `apps_supervisor_access` (
  `id` smallint(6) NOT NULL,
  `supervisor_id` smallint(6) NOT NULL,
  `supervisor_access` char(50) NOT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_supervisor_access`
--

INSERT INTO `apps_supervisor_access` (`id`, `supervisor_id`, `supervisor_access`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 1, 'cancel_billing', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(2, 1, 'unmerge_billing', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(3, 1, 'set_compliment_item', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(4, 1, 'clear_compliment_item', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(5, 1, 'cancel_order', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(6, 1, 'retur_order', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(7, 1, 'change_ppn', 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(8, 1, 'approval_po', 'admin', '2019-04-23 10:12:44', 'admin', '2019-04-23 10:12:44', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_supervisor_log`
--

CREATE TABLE `apps_supervisor_log` (
  `id` int(11) NOT NULL,
  `supervisor_id` smallint(6) NOT NULL,
  `supervisor_access_id` int(11) DEFAULT NULL,
  `supervisor_access` char(100) DEFAULT NULL,
  `log_data` text NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ref_id_1` varchar(50) DEFAULT '',
  `ref_id_2` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_users`
--

CREATE TABLE `apps_users` (
  `id` smallint(6) NOT NULL,
  `user_username` char(50) NOT NULL,
  `user_password` char(64) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  `user_firstname` char(50) NOT NULL,
  `user_lastname` char(50) DEFAULT NULL,
  `user_email` char(50) DEFAULT NULL,
  `user_phone` char(50) DEFAULT NULL,
  `user_mobile` char(50) DEFAULT NULL,
  `user_address` char(100) DEFAULT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '1',
  `client_structure_id` smallint(6) NOT NULL,
  `avatar` char(255) DEFAULT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `user_pin` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_users`
--

INSERT INTO `apps_users` (`id`, `user_username`, `user_password`, `role_id`, `user_firstname`, `user_lastname`, `user_email`, `user_phone`, `user_mobile`, `user_address`, `client_id`, `client_structure_id`, `avatar`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `user_pin`) VALUES
(1, 'irfanarv', '221ef29688703da80f42a015aa00bd93', 1, 'Irfan', 'Arifin', 'irfan@bafageh.com', '082116982479', '', 'Puncak - West Java - Indonesia', 1, 1, '0', '1', '2014-06-22 22:05:55', '1', '2015-09-10 05:22:59', 1, 0, '1995'),
(2, 'Andri', '202cb962ac59075b964b07152d234b70', 2, 'Andri', 'Bafageh', 'cafe@bafageh.com', '', '', '', 1, 2, NULL, '1', '2014-06-22 14:35:59', 'irfanarv', '2019-06-09 16:25:38', 1, 0, '1234'),
(3, 'purchasing', '202cb962ac59075b964b07152d234b70', 3, 'Purchasing', 'Retail', 'purchasing@wepos.id', '', '', '', 1, 3, NULL, 'admin', '2018-08-09 10:50:46', 'admin', '2018-08-09 10:50:46', 1, 0, '3543'),
(4, 'inventory', '202cb962ac59075b964b07152d234b70', 4, 'Inventory', 'Retail', 'inventory@wepos.id', '', '', '', 1, 5, NULL, 'admin', '2018-08-09 10:51:25', 'admin', '2018-08-09 10:51:25', 1, 0, '8734'),
(5, 'kasir', '202cb962ac59075b964b07152d234b70', 5, 'Cashier', 'Retail', 'kasir@wepos.id', '', '', '', 1, 6, NULL, 'admin', '2018-08-09 10:51:57', 'admin', '2018-08-09 10:51:57', 1, 0, '2218');

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_users_desktop`
--

CREATE TABLE `apps_users_desktop` (
  `id` smallint(6) NOT NULL,
  `user_id` smallint(6) NOT NULL,
  `dock` enum('top','bottom','left','right') NOT NULL DEFAULT 'bottom',
  `window_mode` enum('full','lite') DEFAULT 'full',
  `wallpaper` char(50) NOT NULL DEFAULT 'default.jpg',
  `wallpaperStretch` tinyint(1) NOT NULL DEFAULT '0',
  `wallpaper_id` tinyint(4) NOT NULL DEFAULT '1',
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_users_desktop`
--

INSERT INTO `apps_users_desktop` (`id`, `user_id`, `dock`, `window_mode`, `wallpaper`, `wallpaperStretch`, `wallpaper_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 1, 'bottom', 'full', 'wall3.jpg', 1, 1, 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(2, 2, 'bottom', 'full', 'wall1.jpg', 0, 1, 'system', '2017-05-05 18:16:17', 'system', '2017-05-05 18:16:17', 1, 0),
(3, 3, 'bottom', 'full', 'default.jpg', 0, 1, NULL, NULL, NULL, NULL, 1, 0),
(4, 4, 'bottom', 'full', 'default.jpg', 0, 1, NULL, NULL, NULL, NULL, 1, 0),
(5, 5, 'bottom', 'full', 'default.jpg', 0, 1, NULL, NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_users_quickstart`
--

CREATE TABLE `apps_users_quickstart` (
  `id` smallint(6) NOT NULL,
  `user_id` smallint(6) NOT NULL,
  `module_id` smallint(6) NOT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_users_quickstart`
--

INSERT INTO `apps_users_quickstart` (`id`, `user_id`, `module_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 1, 40, 'irfanarv', '2019-06-09 17:05:29', 'irfanarv', '2019-06-09 17:05:29', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_users_shortcut`
--

CREATE TABLE `apps_users_shortcut` (
  `id` smallint(6) NOT NULL,
  `user_id` smallint(6) NOT NULL,
  `module_id` smallint(6) NOT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `apps_users_shortcut`
--

INSERT INTO `apps_users_shortcut` (`id`, `user_id`, `module_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 2, 40, 'Andri', '2019-06-09 16:43:58', 'Andri', '2019-06-09 16:43:58', 1, 0),
(5, 2, 177, 'Andri', '2019-06-09 16:43:58', 'Andri', '2019-06-09 16:43:58', 1, 0),
(8, 2, 176, 'Andri', '2019-06-09 16:54:00', 'Andri', '2019-06-09 16:54:00', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `apps_widgets`
--

CREATE TABLE `apps_widgets` (
  `id` smallint(6) NOT NULL,
  `widget_name` char(50) NOT NULL,
  `widget_author` char(50) DEFAULT NULL,
  `widget_version` char(10) DEFAULT NULL,
  `widget_description` char(100) DEFAULT NULL,
  `widget_controller` char(50) NOT NULL,
  `widget_order` smallint(6) DEFAULT '0',
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_bank`
--

CREATE TABLE `pos_bank` (
  `id` int(11) UNSIGNED NOT NULL,
  `bank_code` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `payment_id` int(11) NOT NULL,
  `createdby` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `pos_bank`
--

INSERT INTO `pos_bank` (`id`, `bank_code`, `bank_name`, `payment_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'A1', 'DEBIT', 2, 'administrator', '2017-03-31 07:29:28', 'administrator', '2017-03-31 07:29:28', 1, 0),
(2, 'A2', 'CC VISA', 3, 'administrator', '2017-03-31 07:29:44', 'administrator', '2017-03-31 07:29:44', 1, 0),
(3, 'A3', 'CC MASTERCARD', 3, 'administrator', '2017-03-31 07:30:05', 'administrator', '2017-03-31 07:30:05', 1, 0),
(4, 'B1', 'BCA', 2, 'administrator', '2017-03-31 07:30:22', 'administrator', '2017-03-31 07:30:22', 1, 0),
(5, 'B2', 'BCA FLAZZ', 2, 'administrator', '2017-03-31 07:30:43', 'administrator', '2017-03-31 07:30:43', 1, 0),
(6, 'B3', 'BCA MASTERCARD', 3, 'administrator', '2017-03-31 07:31:06', 'administrator', '2017-03-31 07:31:06', 1, 0),
(7, 'B4', 'BCA VISA', 3, 'administrator', '2017-03-31 07:31:24', 'administrator', '2017-03-31 07:31:24', 1, 0),
(8, 'C1', 'BNI', 2, 'administrator', '2017-03-31 07:31:44', 'administrator', '2017-03-31 07:31:44', 1, 0),
(9, 'C2', 'BNI VISA', 3, 'administrator', '2017-03-31 07:32:00', 'administrator', '2017-03-31 07:32:00', 1, 0),
(10, 'C3', 'BNI MASTERCARD', 3, 'administrator', '2017-03-31 07:32:20', 'administrator', '2017-03-31 07:32:20', 1, 0),
(11, 'D1', 'MANDIRI', 2, 'administrator', '2017-05-26 07:38:07', 'administrator', '2017-05-26 07:38:07', 1, 0),
(12, 'D2', 'MANDIRI VISA', 3, 'administrator', '2017-05-26 07:38:24', 'administrator', '2017-05-26 07:38:24', 1, 0),
(13, 'D3', 'MANDIRI MASTERCARD', 3, 'administrator', '2017-05-26 07:38:24', 'administrator', '2017-05-26 07:38:24', 1, 0),
(14, 'E1', 'T-Cash', 2, 'administrator', '2017-10-23 04:49:50', 'administrator', '2017-10-23 04:49:50', 1, 0),
(15, 'E2', 'OVO', 2, 'administrator', '2017-10-23 04:49:50', 'administrator', '2017-10-23 04:49:50', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_billing`
--

CREATE TABLE `pos_billing` (
  `id` int(11) NOT NULL,
  `billing_no` varchar(20) NOT NULL,
  `table_id` mediumint(9) DEFAULT NULL,
  `table_no` char(20) DEFAULT NULL,
  `billing_status` enum('paid','unpaid','hold','cancel') DEFAULT 'unpaid',
  `total_billing` double DEFAULT '0',
  `total_paid` double DEFAULT '0',
  `total_pembulatan` double DEFAULT '0',
  `billing_notes` char(100) DEFAULT NULL,
  `payment_id` tinyint(4) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `bank_id` tinyint(4) DEFAULT NULL,
  `card_no` char(50) DEFAULT NULL,
  `include_tax` tinyint(1) DEFAULT '0',
  `tax_percentage` decimal(5,2) DEFAULT '0.00' COMMENT 'will added to total',
  `tax_total` double DEFAULT '0',
  `include_service` tinyint(1) DEFAULT '0',
  `service_percentage` decimal(5,2) DEFAULT '0.00',
  `service_total` double DEFAULT '0',
  `discount_id` mediumint(9) DEFAULT NULL,
  `discount_notes` char(100) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT '0.00',
  `discount_price` double DEFAULT '0',
  `discount_total` double DEFAULT '0',
  `is_compliment` tinyint(1) DEFAULT '0',
  `is_half_payment` tinyint(1) DEFAULT '0',
  `total_cash` double DEFAULT '0',
  `total_credit` double DEFAULT '0',
  `total_hpp` double DEFAULT '0',
  `total_guest` smallint(6) DEFAULT '1',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `merge_id` int(11) DEFAULT NULL,
  `merge_main_status` tinyint(1) DEFAULT '0',
  `split_from_id` int(11) DEFAULT NULL,
  `takeaway_no_tax` tinyint(1) DEFAULT '0',
  `takeaway_no_service` tinyint(1) DEFAULT '0',
  `total_dp` double DEFAULT '0',
  `grand_total` double DEFAULT '0',
  `total_return` double DEFAULT '0',
  `discount_perbilling` tinyint(1) DEFAULT '0',
  `voucher_no` char(100) DEFAULT NULL,
  `compliment_total` double DEFAULT '0',
  `compliment_total_tax_service` double DEFAULT '0',
  `cancel_notes` char(100) DEFAULT NULL,
  `sales_id` mediumint(9) DEFAULT NULL,
  `sales_percentage` decimal(5,2) DEFAULT '0.00',
  `sales_price` double DEFAULT '0',
  `sales_type` char(20) DEFAULT NULL,
  `lock_billing` tinyint(1) DEFAULT '0',
  `qc_notes` varchar(100) DEFAULT NULL,
  `storehouse_id` int(11) DEFAULT '0',
  `is_sistem_tawar` tinyint(1) DEFAULT '0',
  `single_rate` tinyint(1) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `is_salesorder` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_billing`
--

INSERT INTO `pos_billing` (`id`, `billing_no`, `table_id`, `table_no`, `billing_status`, `total_billing`, `total_paid`, `total_pembulatan`, `billing_notes`, `payment_id`, `payment_date`, `bank_id`, `card_no`, `include_tax`, `tax_percentage`, `tax_total`, `include_service`, `service_percentage`, `service_total`, `discount_id`, `discount_notes`, `discount_percentage`, `discount_price`, `discount_total`, `is_compliment`, `is_half_payment`, `total_cash`, `total_credit`, `total_hpp`, `total_guest`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `merge_id`, `merge_main_status`, `split_from_id`, `takeaway_no_tax`, `takeaway_no_service`, `total_dp`, `grand_total`, `total_return`, `discount_perbilling`, `voucher_no`, `compliment_total`, `compliment_total_tax_service`, `cancel_notes`, `sales_id`, `sales_percentage`, `sales_price`, `sales_type`, `lock_billing`, `qc_notes`, `storehouse_id`, `is_sistem_tawar`, `single_rate`, `customer_id`, `is_salesorder`) VALUES
(1, '1906100001', 1, 'WALKIN', 'paid', 58000, 100000, 0, '', 1, '2019-06-10 17:28:31', 0, NULL, 0, '10.00', 0, 0, '0.00', 0, NULL, NULL, '0.00', 0, 0, 0, 0, 58000, 58000, 28000, 1, 'irfanarv', '2019-06-10 10:27:02', 'irfanarv', '2019-06-10 10:28:31', 1, 0, NULL, 0, NULL, 0, 0, 0, 58000, 42000, 0, NULL, 0, 0, NULL, 0, '0.00', 0, '', 0, NULL, 1, 0, 0, 0, 0),
(2, '1906100002', 1, 'WALKIN', 'paid', 20000, 20000, 0, '', 1, '2019-06-10 17:29:38', 0, NULL, 0, '10.00', 0, 0, '0.00', 0, NULL, NULL, '0.00', 0, 0, 0, 0, 20000, 20000, 10000, 1, 'irfanarv', '2019-06-10 10:29:31', 'irfanarv', '2019-06-10 10:29:38', 1, 0, NULL, 0, NULL, 0, 0, 0, 20000, 0, 0, NULL, 0, 0, NULL, 0, '0.00', 0, '', 0, NULL, 1, 0, 0, 0, 0),
(3, '1906100003', 1, 'WALKIN', 'paid', 20000, 20000, 0, '', 1, '2019-06-10 17:31:47', 0, NULL, 0, '10.00', 0, 0, '0.00', 0, NULL, NULL, '0.00', 0, 0, 0, 0, 20000, 20000, 10000, 1, 'irfanarv', '2019-06-10 10:30:41', 'irfanarv', '2019-06-10 10:31:47', 1, 0, NULL, 0, NULL, 0, 0, 0, 20000, 0, 0, NULL, 0, 0, NULL, 0, '0.00', 0, '', 0, NULL, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_billing_additional_price`
--

CREATE TABLE `pos_billing_additional_price` (
  `id` int(11) NOT NULL,
  `additional_price_id` int(11) NOT NULL,
  `total_price` double DEFAULT '0',
  `billing_id` int(11) NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_billing_detail`
--

CREATE TABLE `pos_billing_detail` (
  `id` int(11) NOT NULL,
  `product_id` mediumint(9) NOT NULL,
  `order_qty` smallint(6) DEFAULT '0',
  `product_price` double DEFAULT '0',
  `product_price_hpp` double DEFAULT '0',
  `product_normal_price` double DEFAULT '0',
  `category_id` tinyint(4) DEFAULT NULL,
  `billing_id` int(11) NOT NULL,
  `order_status` enum('order','progress','done','cancel') DEFAULT 'order',
  `order_notes` char(100) DEFAULT NULL,
  `order_day_counter` int(11) DEFAULT NULL,
  `order_counter` smallint(6) DEFAULT '0',
  `retur_type` enum('none','payment','menu') DEFAULT 'none',
  `retur_qty` smallint(6) DEFAULT '0',
  `retur_reason` char(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `billing_id_before_merge` int(11) DEFAULT NULL,
  `cancel_order_notes` char(100) DEFAULT NULL,
  `order_qty_split` smallint(6) DEFAULT NULL,
  `product_price_real` double DEFAULT '0',
  `has_varian` tinyint(1) DEFAULT '0',
  `varian_id` mediumint(9) DEFAULT NULL,
  `product_varian_id` int(11) DEFAULT NULL,
  `print_qc` tinyint(1) DEFAULT '0',
  `print_order` tinyint(1) DEFAULT '0',
  `include_tax` tinyint(1) DEFAULT '1',
  `tax_percentage` decimal(5,2) DEFAULT '0.00',
  `tax_total` double DEFAULT '0',
  `include_service` tinyint(1) DEFAULT '1',
  `service_percentage` decimal(5,2) DEFAULT '0.00',
  `service_total` double DEFAULT '0',
  `is_takeaway` tinyint(1) DEFAULT '0',
  `takeaway_no_tax` tinyint(1) DEFAULT '0',
  `takeaway_no_service` tinyint(1) DEFAULT '0',
  `is_compliment` tinyint(1) DEFAULT '0',
  `discount_id` mediumint(9) DEFAULT NULL,
  `discount_notes` char(100) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT '0.00',
  `discount_price` double DEFAULT '0',
  `discount_total` double DEFAULT '0',
  `is_promo` tinyint(1) DEFAULT '0',
  `promo_id` mediumint(9) DEFAULT NULL,
  `promo_tipe` tinyint(1) DEFAULT '0',
  `promo_desc` char(100) DEFAULT NULL,
  `promo_percentage` decimal(5,2) DEFAULT '0.00',
  `promo_price` double DEFAULT '0',
  `is_kerjasama` tinyint(1) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  `persentase_bagi_hasil` decimal(5,2) DEFAULT '0.00',
  `total_bagi_hasil` double DEFAULT '0',
  `grandtotal_bagi_hasil` double DEFAULT '0',
  `storehouse_id` int(11) DEFAULT '0',
  `is_buyget` tinyint(1) DEFAULT '0',
  `buyget_id` int(11) DEFAULT '0',
  `buyget_tipe` varchar(20) DEFAULT NULL,
  `buyget_percentage` decimal(5,2) DEFAULT '0.00',
  `buyget_total` double DEFAULT '0',
  `buyget_qty` smallint(6) DEFAULT '0',
  `buyget_desc` varchar(100) DEFAULT '',
  `buyget_item` int(11) DEFAULT '0',
  `free_item` tinyint(1) DEFAULT '0',
  `ref_order_id` int(11) DEFAULT '0',
  `use_stok_kode_unik` tinyint(1) DEFAULT '0',
  `data_stok_kode_unik` text,
  `product_type` enum('item','package') DEFAULT 'item',
  `package_item` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_billing_detail`
--

INSERT INTO `pos_billing_detail` (`id`, `product_id`, `order_qty`, `product_price`, `product_price_hpp`, `product_normal_price`, `category_id`, `billing_id`, `order_status`, `order_notes`, `order_day_counter`, `order_counter`, `retur_type`, `retur_qty`, `retur_reason`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `billing_id_before_merge`, `cancel_order_notes`, `order_qty_split`, `product_price_real`, `has_varian`, `varian_id`, `product_varian_id`, `print_qc`, `print_order`, `include_tax`, `tax_percentage`, `tax_total`, `include_service`, `service_percentage`, `service_total`, `is_takeaway`, `takeaway_no_tax`, `takeaway_no_service`, `is_compliment`, `discount_id`, `discount_notes`, `discount_percentage`, `discount_price`, `discount_total`, `is_promo`, `promo_id`, `promo_tipe`, `promo_desc`, `promo_percentage`, `promo_price`, `is_kerjasama`, `supplier_id`, `persentase_bagi_hasil`, `total_bagi_hasil`, `grandtotal_bagi_hasil`, `storehouse_id`, `is_buyget`, `buyget_id`, `buyget_tipe`, `buyget_percentage`, `buyget_total`, `buyget_qty`, `buyget_desc`, `buyget_item`, `free_item`, `ref_order_id`, `use_stok_kode_unik`, `data_stok_kode_unik`, `product_type`, `package_item`) VALUES
(1, 2, 1, 20000, 10000, 20000, 2, 1, 'done', '', 20190610, 0, 'none', 0, NULL, 'irfanarv', '2019-06-10 10:27:36', 'irfanarv', '2019-06-10 10:27:36', 1, 0, 0, NULL, NULL, 20000, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.00', 0, 0, 0, 0, 0, NULL, NULL, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, 0, 0, '0.00', 0, 0, 1, 0, 0, '', '0.00', 0, 0, '', 0, 0, 0, 0, '', 'item', 0),
(2, 1, 1, 38000, 18000, 38000, 4, 1, 'done', '', 20190610, 0, 'none', 0, NULL, 'irfanarv', '2019-06-10 10:27:39', 'irfanarv', '2019-06-10 10:27:39', 1, 0, 0, NULL, NULL, 38000, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.00', 0, 0, 0, 0, 0, NULL, NULL, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, 0, 0, '0.00', 0, 0, 1, 0, 0, '', '0.00', 0, 0, '', 0, 0, 0, 0, '', 'item', 0),
(3, 2, 1, 20000, 10000, 20000, 2, 2, 'done', '', 20190610, 0, 'none', 0, NULL, 'irfanarv', '2019-06-10 10:29:31', 'irfanarv', '2019-06-10 10:29:31', 1, 0, 0, NULL, NULL, 20000, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.00', 0, 0, 0, 0, 0, NULL, NULL, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, 0, 0, '0.00', 0, 0, 1, 0, 0, '', '0.00', 0, 0, '', 0, 0, 0, 0, '', 'item', 0),
(4, 2, 1, 20000, 10000, 20000, 2, 3, 'done', '', 20190610, 0, 'none', 0, NULL, 'irfanarv', '2019-06-10 10:30:47', 'irfanarv', '2019-06-10 10:30:47', 1, 0, 0, NULL, NULL, 20000, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, '0.00', 0, 0, 0, 0, 0, NULL, NULL, '0.00', 0, 0, 0, 0, 0, '', '0.00', 0, 0, 0, '0.00', 0, 0, 1, 0, 0, '', '0.00', 0, 0, '', 0, 0, 0, 0, '', 'item', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_billing_detail_split`
--

CREATE TABLE `pos_billing_detail_split` (
  `id` int(11) NOT NULL,
  `product_id` mediumint(9) NOT NULL,
  `order_qty` smallint(6) DEFAULT '0',
  `product_price` double DEFAULT '0',
  `product_price_hpp` double DEFAULT '0',
  `product_normal_price` double DEFAULT '0',
  `category_id` tinyint(4) DEFAULT NULL,
  `billing_id` int(11) NOT NULL,
  `order_status` enum('order','progress','done','cancel') DEFAULT 'order',
  `order_notes` char(100) DEFAULT NULL,
  `order_day_counter` int(11) DEFAULT NULL,
  `order_counter` smallint(6) DEFAULT '0',
  `retur_type` enum('none','payment','menu') DEFAULT 'none',
  `retur_qty` smallint(6) DEFAULT '0',
  `retur_reason` char(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `billing_id_before_merge` int(11) DEFAULT NULL,
  `cancel_order_notes` char(100) DEFAULT NULL,
  `billing_detail_id` int(11) DEFAULT NULL,
  `order_qty_split` smallint(6) DEFAULT NULL,
  `product_price_real` double DEFAULT '0',
  `has_varian` tinyint(1) DEFAULT '0',
  `varian_id` mediumint(9) DEFAULT NULL,
  `product_varian_id` int(11) DEFAULT NULL,
  `print_qc` tinyint(1) DEFAULT '0',
  `print_order` tinyint(1) DEFAULT '0',
  `include_tax` tinyint(1) DEFAULT '1',
  `tax_percentage` decimal(5,2) DEFAULT '0.00',
  `tax_total` double DEFAULT '0',
  `include_service` tinyint(1) DEFAULT '1',
  `service_percentage` decimal(5,2) DEFAULT '0.00',
  `service_total` double DEFAULT '0',
  `is_takeaway` tinyint(1) DEFAULT '0',
  `takeaway_no_tax` tinyint(1) DEFAULT '0',
  `takeaway_no_service` tinyint(1) DEFAULT '0',
  `is_compliment` tinyint(1) DEFAULT '0',
  `discount_id` mediumint(9) DEFAULT NULL,
  `discount_notes` char(100) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT '0.00',
  `discount_price` double DEFAULT '0',
  `discount_total` double DEFAULT '0',
  `is_promo` tinyint(1) DEFAULT '0',
  `promo_id` mediumint(9) DEFAULT NULL,
  `promo_tipe` tinyint(1) DEFAULT '0',
  `promo_desc` char(100) DEFAULT NULL,
  `promo_percentage` decimal(5,2) DEFAULT '0.00',
  `promo_price` double DEFAULT '0',
  `is_kerjasama` tinyint(1) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  `persentase_bagi_hasil` decimal(5,2) DEFAULT '0.00',
  `total_bagi_hasil` double DEFAULT '0',
  `grandtotal_bagi_hasil` double DEFAULT '0',
  `storehouse_id` int(11) DEFAULT '0',
  `is_buyget` tinyint(1) DEFAULT '0',
  `buyget_id` int(11) DEFAULT '0',
  `buyget_tipe` varchar(20) DEFAULT NULL,
  `buyget_percentage` decimal(5,2) DEFAULT '0.00',
  `buyget_total` double DEFAULT '0',
  `buyget_qty` smallint(6) DEFAULT '0',
  `buyget_desc` varchar(100) DEFAULT '',
  `buyget_item` int(11) DEFAULT '0',
  `free_item` tinyint(1) DEFAULT '0',
  `ref_order_id` int(11) DEFAULT '0',
  `use_stok_kode_unik` tinyint(1) DEFAULT '0',
  `data_stok_kode_unik` text,
  `product_type` enum('item','package') DEFAULT 'item',
  `package_item` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_billing_log`
--

CREATE TABLE `pos_billing_log` (
  `id` int(11) NOT NULL,
  `billing_id` int(25) NOT NULL,
  `trx_type` varchar(20) DEFAULT NULL,
  `trx_info` varchar(255) DEFAULT NULL,
  `log_data` mediumtext NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_closing`
--

CREATE TABLE `pos_closing` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `bulan` char(2) DEFAULT NULL,
  `tahun` char(4) DEFAULT NULL,
  `tipe` enum('sales','purchasing','inventory','hrd','accounting') DEFAULT NULL,
  `closing_status` tinyint(1) DEFAULT '0',
  `generate_status` tinyint(1) DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_closing`
--

INSERT INTO `pos_closing` (`id`, `tanggal`, `bulan`, `tahun`, `tipe`, `closing_status`, `generate_status`, `createdby`, `created`, `updatedby`, `updated`) VALUES
(1, '2019-06-10', '06', '2019', 'sales', 0, 1, 'irfanarv', '2019-06-10 10:22:44', 'irfanarv', '2019-06-10 10:22:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_closing_inventory`
--

CREATE TABLE `pos_closing_inventory` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `inventory_item` smallint(6) DEFAULT '0',
  `inventory_in_qty` float DEFAULT '0',
  `inventory_in_hpp` float DEFAULT '0',
  `inventory_out_qty` float DEFAULT '0',
  `inventory_out_hpp` float DEFAULT '0',
  `inventory_stok` float DEFAULT '0',
  `inventory_hpp` double DEFAULT '0',
  `receiving_total` smallint(6) DEFAULT '0',
  `receiving_item_total` smallint(6) DEFAULT '0',
  `receiving_item_qty` float DEFAULT '0',
  `receiving_item_hpp` double DEFAULT '0',
  `usage_total` smallint(6) DEFAULT '0',
  `usage_item_total` smallint(6) DEFAULT '0',
  `usage_item_qty` float DEFAULT '0',
  `usage_item_hpp` double DEFAULT '0',
  `waste_total` smallint(6) DEFAULT '0',
  `waste_item_total` smallint(6) DEFAULT '0',
  `waste_item_qty` float DEFAULT '0',
  `waste_item_hpp` double DEFAULT '0',
  `waste_persentase` decimal(5,2) DEFAULT '0.00',
  `mutasi_total` smallint(6) DEFAULT '0',
  `mutasi_item_total` smallint(6) DEFAULT '0',
  `mutasi_item_qty` float DEFAULT '0',
  `mutasi_item_hpp` double DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_closing_log`
--

CREATE TABLE `pos_closing_log` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `tipe` varchar(100) DEFAULT NULL,
  `task` varchar(100) DEFAULT NULL,
  `task_status` varchar(15) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_closing_purchasing`
--

CREATE TABLE `pos_closing_purchasing` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `po_total` smallint(6) DEFAULT '0',
  `po_total_supplier` smallint(6) DEFAULT '0',
  `po_total_item` smallint(6) DEFAULT '0',
  `po_status_done` smallint(6) DEFAULT '0',
  `po_status_progress` smallint(6) DEFAULT '0',
  `po_qty_item` float DEFAULT '0',
  `po_sub_total` double DEFAULT '0',
  `po_discount` double DEFAULT '0',
  `po_tax` double DEFAULT '0',
  `po_shipping` double DEFAULT '0',
  `po_grand_total` double DEFAULT '0',
  `po_qty_cash` smallint(6) DEFAULT '0',
  `po_total_cash` double DEFAULT '0',
  `po_qty_credit` smallint(6) DEFAULT '0',
  `po_total_credit` double DEFAULT '0',
  `receiving_total` smallint(6) DEFAULT '0',
  `receiving_total_po` smallint(6) DEFAULT '0',
  `receiving_total_supplier` smallint(6) DEFAULT '0',
  `receiving_total_item` smallint(6) DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `po_total_ro` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_closing_sales`
--

CREATE TABLE `pos_closing_sales` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `qty_billing` smallint(6) DEFAULT '0',
  `total_guest` smallint(6) DEFAULT '0',
  `total_billing` double DEFAULT '0',
  `tax_total` double DEFAULT '0',
  `service_total` double DEFAULT '0',
  `discount_total` double DEFAULT '0',
  `total_dp` double DEFAULT '0',
  `grand_total` double DEFAULT '0',
  `sub_total` double DEFAULT '0',
  `total_pembulatan` double DEFAULT '0',
  `total_compliment` double DEFAULT '0',
  `total_hpp` double DEFAULT '0',
  `total_profit` double DEFAULT '0',
  `qty_halfpayment` smallint(6) DEFAULT '0',
  `total_payment_1` double DEFAULT '0',
  `qty_payment_1` smallint(6) DEFAULT '0',
  `total_payment_2` double DEFAULT '0',
  `qty_payment_2` smallint(6) DEFAULT '0',
  `total_payment_3` double DEFAULT '0',
  `qty_payment_3` smallint(6) DEFAULT '0',
  `total_payment_4` double DEFAULT '0',
  `qty_payment_4` smallint(6) DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_closing_sales`
--

INSERT INTO `pos_closing_sales` (`id`, `tanggal`, `qty_billing`, `total_guest`, `total_billing`, `tax_total`, `service_total`, `discount_total`, `total_dp`, `grand_total`, `sub_total`, `total_pembulatan`, `total_compliment`, `total_hpp`, `total_profit`, `qty_halfpayment`, `total_payment_1`, `qty_payment_1`, `total_payment_2`, `qty_payment_2`, `total_payment_3`, `qty_payment_3`, `total_payment_4`, `qty_payment_4`, `createdby`, `created`, `updatedby`, `updated`) VALUES
(1, '2019-06-10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'irfanarv', '2019-06-10 10:22:44', 'irfanarv', '2019-06-10 10:22:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_customer`
--

CREATE TABLE `pos_customer` (
  `id` int(11) UNSIGNED NOT NULL,
  `customer_code` varchar(20) DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_contact_person` varchar(40) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(100) DEFAULT NULL,
  `customer_fax` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `customer_status` enum('ok','warning','blacklist') DEFAULT 'ok',
  `keterangan_blacklist` varchar(255) DEFAULT NULL,
  `source_from` enum('MERCHANT','WSM','ELVO') DEFAULT 'MERCHANT',
  `customer_no` mediumint(9) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_discount`
--

CREATE TABLE `pos_discount` (
  `id` int(11) NOT NULL,
  `discount_name` varchar(100) NOT NULL,
  `discount_percentage` decimal(5,2) DEFAULT '0.00',
  `discount_price` double DEFAULT '0',
  `min_total_billing` double DEFAULT '0' COMMENT 'optional condition using discount',
  `discount_date_type` enum('limited_date','unlimited_date') DEFAULT 'limited_date',
  `discount_product` tinyint(1) DEFAULT '0' COMMENT '0 = all product, 1 = dicount per-product',
  `discount_desc` varchar(100) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_discount_billing` tinyint(1) DEFAULT '0',
  `discount_max_price` double DEFAULT '0',
  `discount_type` tinyint(1) DEFAULT '0',
  `is_promo` tinyint(1) DEFAULT '0',
  `discount_allow_day` tinyint(2) DEFAULT '0',
  `use_discount_time` tinyint(1) DEFAULT '0',
  `discount_time_start` varchar(15) DEFAULT NULL,
  `discount_time_end` varchar(15) DEFAULT NULL,
  `is_sistem_tawar` tinyint(1) DEFAULT '0',
  `is_buy_get` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_discount`
--

INSERT INTO `pos_discount` (`id`, `discount_name`, `discount_percentage`, `discount_price`, `min_total_billing`, `discount_date_type`, `discount_product`, `discount_desc`, `date_start`, `date_end`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `is_discount_billing`, `discount_max_price`, `discount_type`, `is_promo`, `discount_allow_day`, `use_discount_time`, `discount_time_start`, `discount_time_end`, `is_sistem_tawar`, `is_buy_get`) VALUES
(1, 'Open Price', '0.00', 0, 50000, 'unlimited_date', NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'administrator', '2017-05-08 15:10:05', 'admin', '2019-04-24 01:13:50', 1, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, 1, 0),
(2, 'Discount 1', '5.00', 0, 0, 'unlimited_date', NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'next', '2017-12-21 04:44:26', 'next', '2017-12-21 04:44:26', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_discount_buyget`
--

CREATE TABLE `pos_discount_buyget` (
  `id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `buyget_tipe` enum('item','percentage') DEFAULT 'item',
  `buy_item` int(11) DEFAULT '0',
  `buy_qty` smallint(6) DEFAULT NULL,
  `get_item` int(11) NOT NULL,
  `get_qty` smallint(6) DEFAULT NULL,
  `get_percentage` decimal(5,2) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_discount_product`
--

CREATE TABLE `pos_discount_product` (
  `id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_discount_voucher`
--

CREATE TABLE `pos_discount_voucher` (
  `id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `voucher_no` char(50) NOT NULL,
  `voucher_status` tinyint(1) DEFAULT '0',
  `date_used` date DEFAULT NULL,
  `ref_billing_no` char(20) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_distribution`
--

CREATE TABLE `pos_distribution` (
  `id` int(11) NOT NULL,
  `dis_number` varchar(20) NOT NULL,
  `dis_date` date NOT NULL,
  `divisi_id` int(11) NOT NULL COMMENT 'Divisi yg minta',
  `dis_deliver` varchar(100) DEFAULT NULL,
  `dis_receiver` varchar(100) DEFAULT NULL,
  `dis_memo` tinytext,
  `dis_status` enum('progress','done','cancel') NOT NULL DEFAULT 'progress',
  `createdby` varchar(50) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_from` int(11) DEFAULT NULL,
  `delivery_to` int(11) DEFAULT NULL,
  `is_retur` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_distribution_detail`
--

CREATE TABLE `pos_distribution_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dis_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `disd_dikirim` float DEFAULT NULL,
  `disd_diterima` float NOT NULL,
  `disd_status` tinyint(1) NOT NULL DEFAULT '0',
  `item_hpp` double DEFAULT '0',
  `item_price` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_divisi`
--

CREATE TABLE `pos_divisi` (
  `id` int(6) UNSIGNED NOT NULL,
  `divisi_name` varchar(200) NOT NULL,
  `divisi_desc` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_divisi`
--

INSERT INTO `pos_divisi` (`id`, `divisi_name`, `divisi_desc`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'BackOffice', '', 'administrator', '2016-09-24 10:12:27', 'administrator', '2016-09-24 10:12:27', 1, 0),
(2, 'FrontOffice', '', 'administrator', '2016-09-24 10:12:32', 'administrator', '2016-09-24 10:12:32', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_floorplan`
--

CREATE TABLE `pos_floorplan` (
  `id` int(11) NOT NULL,
  `floorplan_name` varchar(100) NOT NULL,
  `floorplan_desc` varchar(100) DEFAULT NULL,
  `floorplan_image` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_items`
--

CREATE TABLE `pos_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_type` enum('main','support') DEFAULT 'main',
  `item_manufacturer` varchar(255) DEFAULT NULL,
  `item_desc` varchar(255) DEFAULT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `item_price` double DEFAULT '0',
  `sales_price` double DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_hpp` double DEFAULT '0',
  `last_in` double DEFAULT '0',
  `old_last_in` double DEFAULT '0',
  `min_stock` float DEFAULT '0',
  `total_qty_stok` float DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `use_for_sales` tinyint(1) DEFAULT '0',
  `id_ref_product` int(11) DEFAULT '0',
  `sales_use_tax` tinyint(1) DEFAULT '0',
  `sales_use_service` tinyint(1) DEFAULT '0',
  `is_kerjasama` tinyint(1) DEFAULT '0',
  `persentase_bagi_hasil` decimal(5,2) DEFAULT '0.00',
  `total_bagi_hasil` double DEFAULT '0',
  `subcategory_id` smallint(6) DEFAULT '0',
  `item_no` smallint(6) DEFAULT '0',
  `use_stok_kode_unik` tinyint(1) DEFAULT '0',
  `subcategory4_id` smallint(6) DEFAULT '0',
  `item_sku` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_items`
--

INSERT INTO `pos_items` (`id`, `item_code`, `item_name`, `item_type`, `item_manufacturer`, `item_desc`, `item_image`, `item_price`, `sales_price`, `category_id`, `unit_id`, `supplier_id`, `item_hpp`, `last_in`, `old_last_in`, `min_stock`, `total_qty_stok`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `use_for_sales`, `id_ref_product`, `sales_use_tax`, `sales_use_service`, `is_kerjasama`, `persentase_bagi_hasil`, `total_bagi_hasil`, `subcategory_id`, `item_no`, `use_stok_kode_unik`, `subcategory4_id`, `item_sku`) VALUES
(1, 'BUA..0001', 'Buah', 'main', NULL, '', NULL, 200000, 0, 7, 4, 0, 200000, 0, 0, 12, 0, 'irfanarv', '2019-06-10 09:33:57', 'irfanarv', '2019-06-10 09:33:57', 1, 0, 0, 0, 0, 0, 0, '0.00', 0, 0, NULL, 1, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_item_category`
--

CREATE TABLE `pos_item_category` (
  `id` int(11) NOT NULL,
  `item_category_name` varchar(100) NOT NULL,
  `item_category_code` char(3) DEFAULT NULL,
  `item_category_desc` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_item_category`
--

INSERT INTO `pos_item_category` (`id`, `item_category_name`, `item_category_code`, `item_category_desc`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'NOTE', 'NT', '', NULL, '2017-12-16 05:05:16', NULL, '2017-12-16 05:05:16', 1, 1),
(2, 'SMARTPHONE', 'SM', '', NULL, '2017-12-16 05:05:30', NULL, '2017-12-16 05:05:30', 1, 1),
(3, 'CELLPHONE', 'CP', '', NULL, '2017-12-16 05:05:54', NULL, '2017-12-16 05:05:54', 1, 1),
(4, 'ACCECORIES', 'ACC', '', NULL, '2017-12-16 05:06:09', NULL, '2017-12-16 05:06:09', 1, 1),
(5, 'PULSA', 'PLS', '', NULL, '2017-12-16 05:06:19', NULL, '2017-12-16 05:06:19', 1, 1),
(6, 'TABLET', 'TAB', '', NULL, '2017-12-16 06:08:37', NULL, '2017-12-16 06:08:37', 1, 1),
(7, 'BUAH', 'BUA', '', 'irfanarv', '2019-06-10 09:32:31', 'irfanarv', '2019-06-10 09:32:31', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_item_kode_unik`
--

CREATE TABLE `pos_item_kode_unik` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `kode_unik` varchar(255) NOT NULL,
  `ref_in` varchar(50) DEFAULT NULL,
  `date_in` datetime DEFAULT NULL,
  `ref_out` varchar(50) DEFAULT NULL,
  `date_out` datetime DEFAULT NULL,
  `storehouse_id` smallint(6) DEFAULT NULL,
  `qty_kode` smallint(6) DEFAULT '1',
  `item_hpp` double DEFAULT '0',
  `varian_name` varchar(50) DEFAULT NULL,
  `varian_group` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_item_kode_unik_log`
--

CREATE TABLE `pos_item_kode_unik_log` (
  `id` bigint(20) NOT NULL,
  `kode_unik_id` bigint(20) DEFAULT NULL,
  `ref_in` varchar(50) DEFAULT NULL,
  `date_in` datetime DEFAULT NULL,
  `ref_out` varchar(50) DEFAULT NULL,
  `date_out` datetime DEFAULT NULL,
  `storehouse_id` smallint(6) DEFAULT NULL,
  `item_hpp` double DEFAULT '0',
  `item_sales` double DEFAULT NULL,
  `varian_name` varchar(50) DEFAULT NULL,
  `varian_group` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_item_subcategory`
--

CREATE TABLE `pos_item_subcategory` (
  `id` tinyint(4) NOT NULL,
  `item_subcategory_name` varchar(100) NOT NULL,
  `item_subcategory_code` char(5) DEFAULT NULL,
  `item_subcategory_desc` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_notify_log`
--

CREATE TABLE `pos_notify_log` (
  `id` int(11) NOT NULL,
  `log_date` date DEFAULT NULL,
  `log_type` enum('master_data','inventory','sales','finance','accounting','app') DEFAULT NULL,
  `log_info` varchar(255) DEFAULT NULL,
  `log_data` mediumtext NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_ooo_menu`
--

CREATE TABLE `pos_ooo_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_open_close_shift`
--

CREATE TABLE `pos_open_close_shift` (
  `id` int(11) NOT NULL,
  `kasir_user` varchar(50) NOT NULL,
  `spv_user` varchar(50) DEFAULT NULL,
  `tipe_shift` enum('open','close') DEFAULT 'open',
  `tanggal_shift` date NOT NULL,
  `jam_shift` varchar(5) DEFAULT '00:00',
  `user_shift` tinyint(1) DEFAULT '1',
  `uang_kertas_100000` smallint(6) DEFAULT '0',
  `uang_kertas_50000` smallint(6) DEFAULT '0',
  `uang_kertas_20000` smallint(6) DEFAULT '0',
  `uang_kertas_10000` smallint(6) DEFAULT '0',
  `uang_kertas_5000` smallint(6) DEFAULT '0',
  `uang_kertas_2000` smallint(6) DEFAULT '0',
  `uang_kertas_1000` smallint(6) NOT NULL DEFAULT '0',
  `uang_koin_1000` smallint(6) NOT NULL DEFAULT '0',
  `uang_koin_500` smallint(6) DEFAULT '0',
  `uang_koin_200` smallint(6) DEFAULT '0',
  `uang_koin_100` smallint(6) DEFAULT '0',
  `jumlah_uang_kertas` double DEFAULT '0',
  `jumlah_uang_koin` double DEFAULT '0',
  `is_validate` tinyint(1) DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_order_note`
--

CREATE TABLE `pos_order_note` (
  `id` int(11) NOT NULL,
  `order_note_text` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_payment_type`
--

CREATE TABLE `pos_payment_type` (
  `id` int(11) NOT NULL,
  `payment_type_name` varchar(100) NOT NULL,
  `payment_type_desc` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_payment_type`
--

INSERT INTO `pos_payment_type` (`id`, `payment_type_name`, `payment_type_desc`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'Cash', 'Paid by Cash', 'administrator', '0000-00-00 00:00:00', 'administrator', '0000-00-00 00:00:00', 1, 0),
(2, 'Debit Card', 'Paid by Debit Card', 'administrator', '2014-06-27 20:32:50', 'administrator', '0000-00-00 00:00:00', 1, 0),
(3, 'Credit Card', 'Paid by Credit Card', 'administrator', '0000-00-00 00:00:00', 'administrator', '0000-00-00 00:00:00', 1, 0),
(4, 'AR / Piutang', 'Paid By AR', 'administrator', '2019-03-26 03:32:50', 'administrator', '2019-03-26 03:32:50', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_po`
--

CREATE TABLE `pos_po` (
  `id` int(11) NOT NULL,
  `po_number` varchar(20) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier_invoice` varchar(100) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `po_total_qty` float DEFAULT '0',
  `po_sub_total` double DEFAULT NULL,
  `po_discount` double DEFAULT NULL,
  `po_tax` double DEFAULT NULL,
  `po_shipping` double DEFAULT NULL,
  `po_total_price` double DEFAULT '0',
  `po_payment` enum('cash','credit') NOT NULL DEFAULT 'cash',
  `po_status` enum('progress','done','cancel') NOT NULL DEFAULT 'progress',
  `po_memo` tinytext,
  `ro_id` int(11) NOT NULL,
  `po_project` varchar(100) DEFAULT NULL,
  `po_ship_to` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_from_ro` tinyint(1) DEFAULT '1',
  `approval_status` enum('progress','done') DEFAULT NULL,
  `use_approval` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_po`
--

INSERT INTO `pos_po` (`id`, `po_number`, `supplier_id`, `supplier_invoice`, `po_date`, `po_total_qty`, `po_sub_total`, `po_discount`, `po_tax`, `po_shipping`, `po_total_price`, `po_payment`, `po_status`, `po_memo`, `ro_id`, `po_project`, `po_ship_to`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `supplier_from_ro`, `approval_status`, `use_approval`) VALUES
(1, 'PO1906001', 1, '001', '2019-06-10', 0, 2400000, 0, 0, 0, 2400000, 'cash', 'progress', '', 0, '', '', 'irfanarv', '2019-06-10 09:37:09', 'irfanarv', '2019-06-10 09:37:09', 1, 0, NULL, 'done', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_po_detail`
--

CREATE TABLE `pos_po_detail` (
  `id` bigint(20) NOT NULL,
  `po_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `po_detail_purchase` double DEFAULT NULL,
  `po_detail_qty` float DEFAULT NULL,
  `po_receive_qty` float DEFAULT '0',
  `unit_id` int(11) DEFAULT NULL,
  `po_detail_total` double DEFAULT '0',
  `po_detail_status` enum('request','take','cancel') NOT NULL DEFAULT 'take',
  `ro_detail_id` bigint(20) DEFAULT NULL,
  `supplier_item_id` int(11) DEFAULT NULL,
  `po_detail_potongan` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_po_detail`
--

INSERT INTO `pos_po_detail` (`id`, `po_id`, `item_id`, `po_detail_purchase`, `po_detail_qty`, `po_receive_qty`, `unit_id`, `po_detail_total`, `po_detail_status`, `ro_detail_id`, `supplier_item_id`, `po_detail_potongan`) VALUES
(1, 1, 1, 200000, 12, 0, 4, 2400000, 'request', 0, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_printer`
--

CREATE TABLE `pos_printer` (
  `id` int(10) UNSIGNED NOT NULL,
  `printer_ip` varchar(255) DEFAULT NULL,
  `printer_name` varchar(255) DEFAULT NULL,
  `printer_tipe` varchar(30) DEFAULT NULL,
  `printer_pin` varchar(10) DEFAULT NULL,
  `is_print_anywhere` tinyint(1) DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `print_method` enum('ESC/POS','JSPRINT','BROWSER') DEFAULT 'ESC/POS',
  `print_logo` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_printer`
--

INSERT INTO `pos_printer` (`id`, `printer_ip`, `printer_name`, `printer_tipe`, `printer_pin`, `is_print_anywhere`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `print_method`, `print_logo`) VALUES
(1, 'angga-pc\\pos-58', 'KASIR', 'QPOS', '32 CHAR', 0, 'system', '2017-05-05 05:57:37', 'irfanarv', '2019-06-09 17:22:07', 1, 0, 'BROWSER', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_print_monitoring`
--

CREATE TABLE `pos_print_monitoring` (
  `id` bigint(11) NOT NULL,
  `tipe` varchar(10) NOT NULL,
  `peritem` tinyint(1) DEFAULT '0',
  `receiptTxt` mediumtext NOT NULL,
  `printer` varchar(100) DEFAULT NULL,
  `billing_no` varchar(20) DEFAULT NULL,
  `table_no` varchar(20) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  `print_date` date DEFAULT NULL,
  `print_datetime` timestamp NULL DEFAULT NULL,
  `status_print` tinyint(1) DEFAULT '0',
  `tipe_printer` varchar(20) DEFAULT NULL,
  `tipe_pin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_product`
--

CREATE TABLE `pos_product` (
  `id` int(11) NOT NULL,
  `product_code` varchar(100) DEFAULT NULL,
  `product_no` smallint(6) DEFAULT '0',
  `product_name` varchar(200) NOT NULL,
  `product_desc` varchar(255) DEFAULT NULL,
  `product_price` double DEFAULT '0',
  `product_hpp` double DEFAULT '0',
  `product_image` varchar(100) DEFAULT NULL,
  `product_type` enum('item','package') DEFAULT 'item',
  `product_group` enum('food','beverage','other') DEFAULT 'other',
  `category_id` int(11) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `product_chinese_name` varchar(255) DEFAULT NULL,
  `price_include_tax` tinyint(1) DEFAULT '0',
  `price_include_service` tinyint(1) DEFAULT '0',
  `discount_manual` tinyint(1) DEFAULT '1',
  `has_varian` smallint(6) DEFAULT '0',
  `normal_price` double DEFAULT '0',
  `use_tax` tinyint(1) DEFAULT '1',
  `use_service` tinyint(1) DEFAULT '1',
  `from_item` tinyint(1) DEFAULT '0',
  `id_ref_item` int(11) DEFAULT '0',
  `is_kerjasama` tinyint(1) DEFAULT '0',
  `persentase_bagi_hasil` decimal(5,2) DEFAULT '0.00',
  `total_bagi_hasil` double DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_product`
--

INSERT INTO `pos_product` (`id`, `product_code`, `product_no`, `product_name`, `product_desc`, `product_price`, `product_hpp`, `product_image`, `product_type`, `product_group`, `category_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `product_chinese_name`, `price_include_tax`, `price_include_service`, `discount_manual`, `has_varian`, `normal_price`, `use_tax`, `use_service`, `from_item`, `id_ref_item`, `is_kerjasama`, `persentase_bagi_hasil`, `total_bagi_hasil`, `supplier_id`, `unit_id`) VALUES
(1, 'SKU-SS-00001', 1, 'PINE APPLE SHISHA', '', 38000, 18000, NULL, 'item', 'food', 4, 'Andri', '2019-06-09 16:56:57', 'Andri', '2019-06-09 16:56:57', 1, 0, NULL, 0, 0, 1, 0, 38000, 0, 0, 0, 0, 0, '0.00', 0, 0, 1),
(2, 'SKU-FD-00001', 1, 'NASI GORENG', '', 20000, 10000, NULL, 'item', 'food', 2, 'Andri', '2019-06-09 16:58:03', 'Andri', '2019-06-09 16:58:03', 1, 0, NULL, 0, 0, 1, 0, 20000, 0, 0, 0, 0, 0, '0.00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_production`
--

CREATE TABLE `pos_production` (
  `id` int(11) NOT NULL,
  `pr_number` varchar(20) NOT NULL,
  `pr_date` date NOT NULL,
  `pr_memo` tinytext,
  `pr_status` enum('progress','done','cancel') NOT NULL DEFAULT 'progress',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `pr_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_production_detail`
--

CREATE TABLE `pos_production_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pr_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `prd_qty` float DEFAULT '0',
  `prd_status` tinyint(1) NOT NULL DEFAULT '0',
  `item_hpp` double DEFAULT '0',
  `item_price` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_product_category`
--

CREATE TABLE `pos_product_category` (
  `id` int(11) NOT NULL,
  `product_category_code` char(6) DEFAULT NULL,
  `product_category_name` varchar(100) NOT NULL,
  `product_category_desc` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_product_category`
--

INSERT INTO `pos_product_category` (`id`, `product_category_code`, `product_category_name`, `product_category_desc`, `parent_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'BVRG', 'BEVERAGE', '', 0, 'Andri', '2019-06-09 16:50:47', 'Andri', '2019-06-09 16:50:47', 1, 0),
(2, 'FD', 'FOOD', '', 0, 'Andri', '2019-06-09 16:54:21', 'Andri', '2019-06-09 16:54:21', 1, 0),
(3, 'SN', 'SNACK', '', 0, 'Andri', '2019-06-09 16:54:30', 'Andri', '2019-06-09 16:54:30', 1, 0),
(4, 'SS', 'SHISHA', '', 0, 'Andri', '2019-06-09 16:54:51', 'Andri', '2019-06-09 16:54:51', 1, 0),
(5, 'CF', 'COFFEE', '', 0, 'Andri', '2019-06-09 16:55:02', 'Andri', '2019-06-09 16:55:02', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_product_gramasi`
--

CREATE TABLE `pos_product_gramasi` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_price` double DEFAULT '0',
  `item_qty` float DEFAULT '0',
  `createdby` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `product_varian_id` int(11) DEFAULT '0',
  `varian_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_product_package`
--

CREATE TABLE `pos_product_package` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` double DEFAULT NULL,
  `product_hpp` double DEFAULT '0',
  `createdby` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `normal_price` double DEFAULT '0',
  `has_varian` smallint(6) DEFAULT '0',
  `product_varian_id` int(11) DEFAULT '0',
  `varian_id` int(11) DEFAULT '0',
  `product_qty` float DEFAULT '1',
  `product_varian_id_item` int(11) DEFAULT '0',
  `varian_id_item` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_product_varian`
--

CREATE TABLE `pos_product_varian` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `varian_id` int(11) DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `product_hpp` double DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `normal_price` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_receive_detail`
--

CREATE TABLE `pos_receive_detail` (
  `id` bigint(20) NOT NULL,
  `item_id` int(11) NOT NULL,
  `receive_id` int(11) NOT NULL,
  `receive_det_date` date DEFAULT NULL,
  `receive_det_qty` float DEFAULT NULL,
  `receive_det_purchase` double DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `po_detail_qty` float DEFAULT NULL,
  `po_detail_id` int(11) DEFAULT NULL,
  `current_stock` float DEFAULT '0',
  `supplier_item_id` int(11) DEFAULT NULL,
  `storehouse_id` int(11) DEFAULT '0',
  `use_stok_kode_unik` tinyint(1) DEFAULT '0',
  `data_stok_kode_unik` text,
  `receive_det_varian_group` varchar(50) DEFAULT NULL,
  `receive_det_varian_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_receiving`
--

CREATE TABLE `pos_receiving` (
  `id` int(11) NOT NULL,
  `receive_number` varchar(20) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `receive_date` date DEFAULT NULL,
  `receive_memo` tinytext,
  `total_qty` float DEFAULT '0',
  `total_price` double DEFAULT '0',
  `receive_status` enum('progress','done','cancel') NOT NULL DEFAULT 'progress',
  `po_id` int(11) NOT NULL,
  `receive_project` varchar(100) DEFAULT NULL,
  `receive_ship_to` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `storehouse_id` int(11) DEFAULT '0',
  `no_surat_jalan` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_retur`
--

CREATE TABLE `pos_retur` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `retur_number` varchar(20) NOT NULL,
  `retur_ref` enum('penjualan','penjualan_so') DEFAULT NULL,
  `retur_type` enum('barang','batal_order') NOT NULL,
  `retur_date` date NOT NULL,
  `retur_memo` tinytext,
  `total_qty` float NOT NULL DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0',
  `total_tax` double DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ref_no` varchar(30) DEFAULT NULL,
  `retur_status` enum('progress','done') DEFAULT 'progress',
  `storehouse_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_retur_detail`
--

CREATE TABLE `pos_retur_detail` (
  `id` bigint(20) NOT NULL,
  `retur_id` bigint(20) NOT NULL,
  `item_product_id` int(11) NOT NULL,
  `returd_qty_before` int(11) DEFAULT NULL,
  `returd_price` double DEFAULT '0',
  `returd_hpp` double DEFAULT '0',
  `returd_tax` double DEFAULT '0',
  `returd_qty` float DEFAULT '0',
  `returd_total` double DEFAULT '0',
  `returd_ref_id` bigint(20) DEFAULT NULL,
  `returd_refd_id` bigint(20) DEFAULT NULL,
  `returd_note` varchar(255) DEFAULT NULL,
  `data_stok_kode_unik` text,
  `use_stok_kode_unik` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_ro`
--

CREATE TABLE `pos_ro` (
  `id` int(11) NOT NULL,
  `ro_number` varchar(20) NOT NULL,
  `ro_date` date DEFAULT NULL,
  `ro_memo` tinytext,
  `ro_total_qty` float DEFAULT '0',
  `ro_status` enum('request','validated','take','cancel') NOT NULL DEFAULT 'request',
  `divisi_id` int(11) DEFAULT '0',
  `total_item` tinyint(4) DEFAULT '0',
  `total_validated` tinyint(4) DEFAULT '0',
  `total_request` tinyint(4) DEFAULT '0',
  `ro_from` varchar(100) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `take_reff_id` int(11) DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_room`
--

CREATE TABLE `pos_room` (
  `id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_no` varchar(10) NOT NULL,
  `room_desc` varchar(100) DEFAULT NULL,
  `floorplan_id` int(11) NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_ro_detail`
--

CREATE TABLE `pos_ro_detail` (
  `id` bigint(20) NOT NULL,
  `ro_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ro_detail_qty` float NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `ro_detail_status` enum('request','validated','take','cancel') NOT NULL DEFAULT 'request',
  `take_reff_detail_id` bigint(20) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  `take_reff_id` int(11) DEFAULT '0',
  `item_price` double DEFAULT '0',
  `item_hpp` double DEFAULT '0',
  `supplier_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_sales`
--

CREATE TABLE `pos_sales` (
  `id` mediumint(9) NOT NULL,
  `sales_name` char(100) NOT NULL,
  `sales_code` varchar(20) DEFAULT NULL,
  `sales_email` varchar(50) DEFAULT NULL,
  `sales_percentage` decimal(5,2) DEFAULT '0.00',
  `sales_price` double DEFAULT '0',
  `sales_contract_type` enum('unlimited_date','limited_date') DEFAULT 'unlimited_date',
  `sales_company` char(50) DEFAULT NULL,
  `sales_phone` char(20) DEFAULT NULL,
  `sales_address` char(100) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `createdby` char(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` char(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `sales_type` enum('before_tax','after_tax') DEFAULT 'after_tax',
  `source_from` enum('MERCHANT','WSM') DEFAULT 'MERCHANT',
  `sales_no` mediumint(9) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_salesorder`
--

CREATE TABLE `pos_salesorder` (
  `id` int(11) NOT NULL,
  `so_number` varchar(20) NOT NULL,
  `so_date` date NOT NULL,
  `so_memo` tinytext,
  `so_status` enum('progress','done','cancel') NOT NULL DEFAULT 'progress',
  `createdby` varchar(50) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `so_from` int(11) DEFAULT NULL,
  `so_customer_name` varchar(100) DEFAULT NULL,
  `so_customer_address` varchar(255) DEFAULT NULL,
  `so_customer_phone` varchar(20) DEFAULT NULL,
  `so_total_qty` float DEFAULT NULL,
  `so_sub_total` double DEFAULT '0',
  `so_discount` double DEFAULT '0',
  `so_tax` double DEFAULT '0',
  `so_shipping` double DEFAULT '0',
  `so_total_price` double DEFAULT '0',
  `so_payment` enum('cash','debit','credit','credit_ar') DEFAULT 'cash',
  `so_dp` double DEFAULT '0',
  `sales_id` mediumint(9) DEFAULT NULL,
  `sales_percentage` decimal(5,2) DEFAULT '0.00',
  `sales_price` double DEFAULT '0',
  `sales_type` char(20) DEFAULT NULL,
  `single_rate` tinyint(1) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `bank_id` int(1) DEFAULT '0',
  `card_no` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_salesorder_detail`
--

CREATE TABLE `pos_salesorder_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `so_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `sod_qty` float DEFAULT '0',
  `sod_status` tinyint(1) NOT NULL DEFAULT '0',
  `item_hpp` double DEFAULT '0',
  `sales_price` double DEFAULT '0',
  `sod_potongan` double DEFAULT '0',
  `sod_total` double DEFAULT NULL,
  `storehouse_id` int(11) DEFAULT NULL,
  `use_stok_kode_unik` tinyint(1) DEFAULT '0',
  `data_stok_kode_unik` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_stock`
--

CREATE TABLE `pos_stock` (
  `id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `trx_date` date NOT NULL,
  `trx_type` enum('in','out','sto') DEFAULT 'in',
  `trx_qty` float NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `trx_nominal` double NOT NULL DEFAULT '0',
  `trx_note` varchar(255) DEFAULT NULL,
  `trx_ref_data` varchar(100) NOT NULL,
  `trx_ref_det_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `storehouse_id` int(11) DEFAULT NULL,
  `is_sto` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_stock_koreksi`
--

CREATE TABLE `pos_stock_koreksi` (
  `id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `total_stock_awal` float DEFAULT NULL,
  `total_stock_koreksi` float DEFAULT NULL,
  `total_stock_akhir` float DEFAULT NULL,
  `trx_date` date NOT NULL,
  `storehouse_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `item_hpp` double DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `trx_type` enum('in','out') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_stock_opname`
--

CREATE TABLE `pos_stock_opname` (
  `id` int(11) NOT NULL,
  `sto_number` varchar(255) NOT NULL,
  `sto_date` date NOT NULL,
  `sto_memo` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `storehouse_id` int(11) DEFAULT NULL,
  `sto_status` enum('progress','done','cancel') DEFAULT 'progress'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_stock_opname_detail`
--

CREATE TABLE `pos_stock_opname_detail` (
  `id` bigint(20) NOT NULL,
  `sto_id` int(11) DEFAULT NULL,
  `jumlah_awal` float DEFAULT NULL,
  `jumlah_fisik` float DEFAULT NULL,
  `selisih` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `total_hpp_fifo` double DEFAULT NULL,
  `current_hpp_avg` double DEFAULT '0',
  `total_hpp_avg` double DEFAULT '0',
  `stod_status` tinyint(1) NOT NULL DEFAULT '0',
  `last_in` double DEFAULT '0',
  `total_last_in` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_stock_opname_detail_upload`
--

CREATE TABLE `pos_stock_opname_detail_upload` (
  `id` bigint(20) NOT NULL,
  `sto_id` int(11) DEFAULT NULL,
  `jumlah_awal` float DEFAULT NULL,
  `jumlah_fisik` float DEFAULT NULL,
  `selisih` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `total_hpp_fifo` double DEFAULT NULL,
  `current_hpp_avg` double DEFAULT NULL,
  `total_hpp_avg` double DEFAULT NULL,
  `stod_status` tinyint(1) NOT NULL DEFAULT '0',
  `last_in` double DEFAULT '0',
  `total_last_in` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_stock_rekap`
--

CREATE TABLE `pos_stock_rekap` (
  `id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `total_stock` float DEFAULT NULL,
  `total_stock_in` float DEFAULT NULL,
  `total_stock_out` float DEFAULT NULL,
  `trx_date` date NOT NULL,
  `storehouse_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `total_stock_kemarin` float DEFAULT NULL,
  `item_hpp` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_stock_unit`
--

CREATE TABLE `pos_stock_unit` (
  `id` bigint(20) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `item_id` bigint(20) NOT NULL,
  `total_stock` int(11) DEFAULT NULL,
  `total_stock_in` int(11) DEFAULT NULL,
  `total_stock_out` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_storehouse`
--

CREATE TABLE `pos_storehouse` (
  `id` int(6) UNSIGNED NOT NULL,
  `storehouse_code` varchar(10) NOT NULL,
  `storehouse_name` varchar(200) NOT NULL,
  `storehouse_desc` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_storehouse`
--

INSERT INTO `pos_storehouse` (`id`, `storehouse_code`, `storehouse_name`, `storehouse_desc`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `is_primary`) VALUES
(1, 'GU', 'Gudang Utama', 'Gudang Utama', 'system', '2017-05-05 05:57:37', 'admin', '2019-04-23 06:59:40', 1, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_storehouse_users`
--

CREATE TABLE `pos_storehouse_users` (
  `id` int(11) NOT NULL,
  `storehouse_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_retail_warehouse` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_storehouse_users`
--

INSERT INTO `pos_storehouse_users` (`id`, `storehouse_id`, `user_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `is_retail_warehouse`) VALUES
(1, 1, 2, 'administrator', '2017-05-08 14:32:01', 'administrator', '2017-05-08 14:32:09', 1, 0, 1),
(2, 1, 1, 'administrator', '2017-05-08 14:36:18', 'administrator', '2017-05-08 14:36:18', 1, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_supplier`
--

CREATE TABLE `pos_supplier` (
  `id` int(11) UNSIGNED NOT NULL,
  `supplier_code` varchar(20) DEFAULT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_contact_person` varchar(40) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `supplier_phone` varchar(100) DEFAULT NULL,
  `supplier_fax` varchar(100) DEFAULT NULL,
  `supplier_email` varchar(100) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `supplier_status` enum('ok','warning','blacklist') DEFAULT 'ok',
  `keterangan_blacklist` varchar(255) DEFAULT NULL,
  `source_from` enum('MERCHANT','WSM') DEFAULT 'MERCHANT',
  `supplier_no` mediumint(9) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_supplier`
--

INSERT INTO `pos_supplier` (`id`, `supplier_code`, `supplier_name`, `supplier_contact_person`, `supplier_address`, `supplier_phone`, `supplier_fax`, `supplier_email`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `supplier_status`, `keterangan_blacklist`, `source_from`, `supplier_no`) VALUES
(1, 'SP-001', 'Supplier Buah', 'Irfan Arifin', 'Cibeureum, Cisarua, Bogor, Jawa Barat 16750', '082116982479', '', 'irfan@bafageh.com', 'irfanarv', '2019-06-10 09:28:01', 'irfanarv', '2019-06-10 09:36:27', 1, 0, 'ok', '', 'MERCHANT', -1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_supplier_item`
--

CREATE TABLE `pos_supplier_item` (
  `id` int(11) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `item_price` double DEFAULT '0',
  `item_hpp` double DEFAULT '0',
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `last_in` double DEFAULT '0',
  `old_last_in` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_supplier_item`
--

INSERT INTO `pos_supplier_item` (`id`, `supplier_id`, `item_id`, `unit_id`, `item_price`, `item_hpp`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `last_in`, `old_last_in`) VALUES
(1, 1, 1, 4, 200000, 200000, 'irfanarv', '2019-06-10 09:36:24', 'irfanarv', '2019-06-10 09:36:24', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_table`
--

CREATE TABLE `pos_table` (
  `id` int(11) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `table_no` varchar(10) NOT NULL,
  `table_desc` varchar(100) DEFAULT NULL,
  `floorplan_id` int(11) NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  `room_id` int(11) DEFAULT '0',
  `kapasitas` smallint(6) DEFAULT '0',
  `table_tipe` enum('walkin','delivery','online','event') NOT NULL DEFAULT 'walkin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_table`
--

INSERT INTO `pos_table` (`id`, `table_name`, `table_no`, `table_desc`, `floorplan_id`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`, `room_id`, `kapasitas`, `table_tipe`) VALUES
(1, 'WALKIN', 'WALKIN', 'WALKIN', 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 'walkin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_table_inventory`
--

CREATE TABLE `pos_table_inventory` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `billing_no` varchar(15) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` enum('available','booked','reserved','not available') DEFAULT 'available',
  `created` datetime DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_table_inventory`
--

INSERT INTO `pos_table_inventory` (`id`, `table_id`, `billing_no`, `tanggal`, `status`, `created`, `createdby`, `updated`, `updatedby`, `is_active`, `is_deleted`) VALUES
(1, 1, NULL, '2019-06-09', 'available', '2019-06-09 23:58:14', 'Andri', '2019-06-09 23:58:14', 'Andri', 0, 0),
(2, 1, NULL, '2019-06-10', 'available', '2019-06-10 00:05:49', 'irfanarv', '2019-06-10 00:05:49', 'irfanarv', 0, 0),
(3, 1, NULL, '2019-08-12', 'available', '2019-08-12 18:22:46', 'Andri', '2019-08-12 18:22:46', 'Andri', 0, 0),
(4, 1, NULL, '2019-08-16', 'available', '2019-08-16 23:12:52', 'Andri', '2019-08-16 23:12:52', 'Andri', 0, 0),
(5, 1, NULL, '2019-08-27', 'available', '2019-08-27 14:33:15', 'Andri', '2019-08-27 14:33:15', 'Andri', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_unit`
--

CREATE TABLE `pos_unit` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_code` varchar(10) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_unit`
--

INSERT INTO `pos_unit` (`id`, `unit_code`, `unit_name`, `createdby`, `created`, `updatedby`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'pcs', 'Pieces', 'system', '2017-05-05 05:57:37', 'system', '2017-05-05 05:57:37', 1, 0),
(2, 'it', 'Item', 'admin', '2019-04-23 07:00:41', 'Andri', '2019-06-09 17:01:42', 1, 0),
(3, 'pak', 'Package', 'Andri', '2019-06-09 17:02:08', 'irfanarv', '2019-06-10 09:33:04', 1, 0),
(4, 'kg', 'Kilogram', 'irfanarv', '2019-06-10 09:33:14', 'irfanarv', '2019-06-10 09:33:14', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_usagewaste`
--

CREATE TABLE `pos_usagewaste` (
  `id` int(11) NOT NULL,
  `uw_number` varchar(20) NOT NULL,
  `uw_date` date NOT NULL,
  `uw_memo` tinytext,
  `uw_status` enum('progress','done','cancel') NOT NULL DEFAULT 'progress',
  `createdby` varchar(50) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `uw_from` int(11) DEFAULT NULL,
  `uw_sales` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_usagewaste_detail`
--

CREATE TABLE `pos_usagewaste_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uw_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `uwd_qty` float DEFAULT '0',
  `uwd_status` tinyint(1) NOT NULL DEFAULT '0',
  `item_hpp` double DEFAULT '0',
  `item_price` double DEFAULT '0',
  `uwd_tipe` enum('usage','waste') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_varian`
--

CREATE TABLE `pos_varian` (
  `id` int(11) NOT NULL,
  `varian_name` varchar(100) NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_varian_item`
--

CREATE TABLE `pos_varian_item` (
  `id` int(11) NOT NULL,
  `varian_name` varchar(100) NOT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `acc_account_payable`
--
ALTER TABLE `acc_account_payable`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ap_no` (`ap_no`);

--
-- Indeks untuk tabel `acc_account_receivable`
--
ALTER TABLE `acc_account_receivable`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ap_no` (`ar_no`);

--
-- Indeks untuk tabel `acc_autoposting`
--
ALTER TABLE `acc_autoposting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acc_autoposting_detail`
--
ALTER TABLE `acc_autoposting_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acc_invoice`
--
ALTER TABLE `acc_invoice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kb_no` (`invoice_no`);

--
-- Indeks untuk tabel `acc_invoice_detail`
--
ALTER TABLE `acc_invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acc_jurnal_header`
--
ALTER TABLE `acc_jurnal_header`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_registrasi` (`no_registrasi`);

--
-- Indeks untuk tabel `acc_kode_rekening`
--
ALTER TABLE `acc_kode_rekening`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acc_kontrabon`
--
ALTER TABLE `acc_kontrabon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kb_no` (`kb_no`);

--
-- Indeks untuk tabel `acc_kontrabon_detail`
--
ALTER TABLE `acc_kontrabon_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acc_mutasi_kas_bank`
--
ALTER TABLE `acc_mutasi_kas_bank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mkb_no` (`mkb_no`);

--
-- Indeks untuk tabel `acc_pelunasan_ap`
--
ALTER TABLE `acc_pelunasan_ap`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acc_pembayaran_ar`
--
ALTER TABLE `acc_pembayaran_ar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acc_penerimaan_kas`
--
ALTER TABLE `acc_penerimaan_kas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `km_no` (`km_no`);

--
-- Indeks untuk tabel `acc_pengeluaran_kas`
--
ALTER TABLE `acc_pengeluaran_kas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kk_no` (`kk_no`);

--
-- Indeks untuk tabel `acc_periode_laporan`
--
ALTER TABLE `acc_periode_laporan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `acc_tujuan_cashflow`
--
ALTER TABLE `acc_tujuan_cashflow`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_clients`
--
ALTER TABLE `apps_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rs_kode` (`client_code`);

--
-- Indeks untuk tabel `apps_clients_structure`
--
ALTER TABLE `apps_clients_structure`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_clients_unit`
--
ALTER TABLE `apps_clients_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_modules`
--
ALTER TABLE `apps_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_controller` (`module_controller`);

--
-- Indeks untuk tabel `apps_modules_method`
--
ALTER TABLE `apps_modules_method`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_modules_preload`
--
ALTER TABLE `apps_modules_preload`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_options`
--
ALTER TABLE `apps_options`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_roles`
--
ALTER TABLE `apps_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_roles_module`
--
ALTER TABLE `apps_roles_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_idi_group_rule_list` (`module_id`),
  ADD KEY `FK_idi_group_rule_list2` (`role_id`);

--
-- Indeks untuk tabel `apps_roles_widget`
--
ALTER TABLE `apps_roles_widget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_idi_group_rule_list` (`widget_id`),
  ADD KEY `FK_idi_group_rule_list2` (`role_id`);

--
-- Indeks untuk tabel `apps_supervisor`
--
ALTER TABLE `apps_supervisor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_supervisor_access`
--
ALTER TABLE `apps_supervisor_access`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_supervisor_log`
--
ALTER TABLE `apps_supervisor_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_users`
--
ALTER TABLE `apps_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_username` (`user_username`);

--
-- Indeks untuk tabel `apps_users_desktop`
--
ALTER TABLE `apps_users_desktop`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_users_quickstart`
--
ALTER TABLE `apps_users_quickstart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_users_shortcut`
--
ALTER TABLE `apps_users_shortcut`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `apps_widgets`
--
ALTER TABLE `apps_widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_controller` (`widget_controller`);

--
-- Indeks untuk tabel `pos_bank`
--
ALTER TABLE `pos_bank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bank_code_idx` (`bank_code`);

--
-- Indeks untuk tabel `pos_billing`
--
ALTER TABLE `pos_billing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `billing_no` (`billing_no`);

--
-- Indeks untuk tabel `pos_billing_additional_price`
--
ALTER TABLE `pos_billing_additional_price`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_billing_detail`
--
ALTER TABLE `pos_billing_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_billing_detail_split`
--
ALTER TABLE `pos_billing_detail_split`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_billing_log`
--
ALTER TABLE `pos_billing_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_closing`
--
ALTER TABLE `pos_closing`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_closing_inventory`
--
ALTER TABLE `pos_closing_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_closing_log`
--
ALTER TABLE `pos_closing_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_closing_purchasing`
--
ALTER TABLE `pos_closing_purchasing`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_closing_sales`
--
ALTER TABLE `pos_closing_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_customer`
--
ALTER TABLE `pos_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_discount`
--
ALTER TABLE `pos_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_discount_buyget`
--
ALTER TABLE `pos_discount_buyget`
  ADD PRIMARY KEY (`id`,`get_item`);

--
-- Indeks untuk tabel `pos_discount_product`
--
ALTER TABLE `pos_discount_product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_discount_voucher`
--
ALTER TABLE `pos_discount_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_distribution`
--
ALTER TABLE `pos_distribution`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `do_number_idx` (`dis_number`);

--
-- Indeks untuk tabel `pos_distribution_detail`
--
ALTER TABLE `pos_distribution_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_divisi`
--
ALTER TABLE `pos_divisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_floorplan`
--
ALTER TABLE `pos_floorplan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_items`
--
ALTER TABLE `pos_items`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_item_category`
--
ALTER TABLE `pos_item_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_category_code` (`item_category_code`);

--
-- Indeks untuk tabel `pos_item_kode_unik`
--
ALTER TABLE `pos_item_kode_unik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_item_kode_unik_log`
--
ALTER TABLE `pos_item_kode_unik_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_item_subcategory`
--
ALTER TABLE `pos_item_subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_notify_log`
--
ALTER TABLE `pos_notify_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_ooo_menu`
--
ALTER TABLE `pos_ooo_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_open_close_shift`
--
ALTER TABLE `pos_open_close_shift`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_order_note`
--
ALTER TABLE `pos_order_note`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_payment_type`
--
ALTER TABLE `pos_payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_po`
--
ALTER TABLE `pos_po`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `po_number_idx` (`po_number`),
  ADD KEY `fk_po_supplier` (`supplier_id`);

--
-- Indeks untuk tabel `pos_po_detail`
--
ALTER TABLE `pos_po_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_po_detail_po` (`po_id`),
  ADD KEY `fk_po_detail_barang` (`item_id`);

--
-- Indeks untuk tabel `pos_printer`
--
ALTER TABLE `pos_printer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_print_monitoring`
--
ALTER TABLE `pos_print_monitoring`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_product`
--
ALTER TABLE `pos_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_product_idx` (`product_code`);

--
-- Indeks untuk tabel `pos_production`
--
ALTER TABLE `pos_production`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pr_number_idx` (`pr_number`);

--
-- Indeks untuk tabel `pos_production_detail`
--
ALTER TABLE `pos_production_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_product_category`
--
ALTER TABLE `pos_product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_product_gramasi`
--
ALTER TABLE `pos_product_gramasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_product_package`
--
ALTER TABLE `pos_product_package`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_product_varian`
--
ALTER TABLE `pos_product_varian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_receive_detail`
--
ALTER TABLE `pos_receive_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_receive_receive_detail` (`receive_id`),
  ADD KEY `fk_barang_receive_detail` (`item_id`);

--
-- Indeks untuk tabel `pos_receiving`
--
ALTER TABLE `pos_receiving`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receiv_number_idx` (`receive_number`),
  ADD KEY `fk_receiving_supplier` (`supplier_id`);

--
-- Indeks untuk tabel `pos_retur`
--
ALTER TABLE `pos_retur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `retur_number_idx` (`retur_number`);

--
-- Indeks untuk tabel `pos_retur_detail`
--
ALTER TABLE `pos_retur_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_ro`
--
ALTER TABLE `pos_ro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ro_number_idx` (`ro_number`);

--
-- Indeks untuk tabel `pos_room`
--
ALTER TABLE `pos_room`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_ro_detail`
--
ALTER TABLE `pos_ro_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ro_detail_ro` (`ro_id`),
  ADD KEY `fk_ro_detail_barang` (`item_id`);

--
-- Indeks untuk tabel `pos_sales`
--
ALTER TABLE `pos_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_salesorder`
--
ALTER TABLE `pos_salesorder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pr_number_idx` (`so_number`);

--
-- Indeks untuk tabel `pos_salesorder_detail`
--
ALTER TABLE `pos_salesorder_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_stock`
--
ALTER TABLE `pos_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_stock_koreksi`
--
ALTER TABLE `pos_stock_koreksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_stock_opname`
--
ALTER TABLE `pos_stock_opname`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_stock_opname_detail`
--
ALTER TABLE `pos_stock_opname_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_stock_opname_detail_upload`
--
ALTER TABLE `pos_stock_opname_detail_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_stock_rekap`
--
ALTER TABLE `pos_stock_rekap`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_stock_unit`
--
ALTER TABLE `pos_stock_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_storehouse`
--
ALTER TABLE `pos_storehouse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gudang_code_idx` (`storehouse_code`);

--
-- Indeks untuk tabel `pos_storehouse_users`
--
ALTER TABLE `pos_storehouse_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_supplier`
--
ALTER TABLE `pos_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_supplier_item`
--
ALTER TABLE `pos_supplier_item`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_table`
--
ALTER TABLE `pos_table`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_table_inventory`
--
ALTER TABLE `pos_table_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_unit`
--
ALTER TABLE `pos_unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `satuan_code_idx` (`unit_code`);

--
-- Indeks untuk tabel `pos_usagewaste`
--
ALTER TABLE `pos_usagewaste`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pr_number_idx` (`uw_number`);

--
-- Indeks untuk tabel `pos_usagewaste_detail`
--
ALTER TABLE `pos_usagewaste_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_varian`
--
ALTER TABLE `pos_varian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pos_varian_item`
--
ALTER TABLE `pos_varian_item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `acc_account_payable`
--
ALTER TABLE `acc_account_payable`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_account_receivable`
--
ALTER TABLE `acc_account_receivable`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_autoposting`
--
ALTER TABLE `acc_autoposting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_autoposting_detail`
--
ALTER TABLE `acc_autoposting_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_invoice`
--
ALTER TABLE `acc_invoice`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_invoice_detail`
--
ALTER TABLE `acc_invoice_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_jurnal_header`
--
ALTER TABLE `acc_jurnal_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_kode_rekening`
--
ALTER TABLE `acc_kode_rekening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_kontrabon`
--
ALTER TABLE `acc_kontrabon`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_kontrabon_detail`
--
ALTER TABLE `acc_kontrabon_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_mutasi_kas_bank`
--
ALTER TABLE `acc_mutasi_kas_bank`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_pelunasan_ap`
--
ALTER TABLE `acc_pelunasan_ap`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_pembayaran_ar`
--
ALTER TABLE `acc_pembayaran_ar`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_penerimaan_kas`
--
ALTER TABLE `acc_penerimaan_kas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_pengeluaran_kas`
--
ALTER TABLE `acc_pengeluaran_kas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `acc_periode_laporan`
--
ALTER TABLE `acc_periode_laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `acc_tujuan_cashflow`
--
ALTER TABLE `acc_tujuan_cashflow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `apps_clients`
--
ALTER TABLE `apps_clients`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `apps_clients_structure`
--
ALTER TABLE `apps_clients_structure`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `apps_clients_unit`
--
ALTER TABLE `apps_clients_unit`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `apps_modules`
--
ALTER TABLE `apps_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT untuk tabel `apps_modules_method`
--
ALTER TABLE `apps_modules_method`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `apps_modules_preload`
--
ALTER TABLE `apps_modules_preload`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `apps_options`
--
ALTER TABLE `apps_options`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT untuk tabel `apps_roles`
--
ALTER TABLE `apps_roles`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `apps_roles_module`
--
ALTER TABLE `apps_roles_module`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=445;

--
-- AUTO_INCREMENT untuk tabel `apps_roles_widget`
--
ALTER TABLE `apps_roles_widget`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `apps_supervisor`
--
ALTER TABLE `apps_supervisor`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `apps_supervisor_access`
--
ALTER TABLE `apps_supervisor_access`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `apps_supervisor_log`
--
ALTER TABLE `apps_supervisor_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `apps_users`
--
ALTER TABLE `apps_users`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `apps_users_desktop`
--
ALTER TABLE `apps_users_desktop`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `apps_users_quickstart`
--
ALTER TABLE `apps_users_quickstart`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `apps_users_shortcut`
--
ALTER TABLE `apps_users_shortcut`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `apps_widgets`
--
ALTER TABLE `apps_widgets`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_bank`
--
ALTER TABLE `pos_bank`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `pos_billing`
--
ALTER TABLE `pos_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pos_billing_additional_price`
--
ALTER TABLE `pos_billing_additional_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_billing_detail`
--
ALTER TABLE `pos_billing_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pos_billing_detail_split`
--
ALTER TABLE `pos_billing_detail_split`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_billing_log`
--
ALTER TABLE `pos_billing_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_closing`
--
ALTER TABLE `pos_closing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_closing_inventory`
--
ALTER TABLE `pos_closing_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_closing_log`
--
ALTER TABLE `pos_closing_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_closing_purchasing`
--
ALTER TABLE `pos_closing_purchasing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_closing_sales`
--
ALTER TABLE `pos_closing_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_customer`
--
ALTER TABLE `pos_customer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_discount`
--
ALTER TABLE `pos_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pos_discount_buyget`
--
ALTER TABLE `pos_discount_buyget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_discount_product`
--
ALTER TABLE `pos_discount_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_discount_voucher`
--
ALTER TABLE `pos_discount_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_distribution`
--
ALTER TABLE `pos_distribution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_distribution_detail`
--
ALTER TABLE `pos_distribution_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_divisi`
--
ALTER TABLE `pos_divisi`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pos_floorplan`
--
ALTER TABLE `pos_floorplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_items`
--
ALTER TABLE `pos_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_item_category`
--
ALTER TABLE `pos_item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pos_item_kode_unik`
--
ALTER TABLE `pos_item_kode_unik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_item_kode_unik_log`
--
ALTER TABLE `pos_item_kode_unik_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_item_subcategory`
--
ALTER TABLE `pos_item_subcategory`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_notify_log`
--
ALTER TABLE `pos_notify_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_ooo_menu`
--
ALTER TABLE `pos_ooo_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_open_close_shift`
--
ALTER TABLE `pos_open_close_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_order_note`
--
ALTER TABLE `pos_order_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_payment_type`
--
ALTER TABLE `pos_payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pos_po`
--
ALTER TABLE `pos_po`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_po_detail`
--
ALTER TABLE `pos_po_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_printer`
--
ALTER TABLE `pos_printer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_print_monitoring`
--
ALTER TABLE `pos_print_monitoring`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_product`
--
ALTER TABLE `pos_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pos_production`
--
ALTER TABLE `pos_production`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_production_detail`
--
ALTER TABLE `pos_production_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_product_category`
--
ALTER TABLE `pos_product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pos_product_gramasi`
--
ALTER TABLE `pos_product_gramasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_product_package`
--
ALTER TABLE `pos_product_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_product_varian`
--
ALTER TABLE `pos_product_varian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_receive_detail`
--
ALTER TABLE `pos_receive_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_receiving`
--
ALTER TABLE `pos_receiving`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_retur`
--
ALTER TABLE `pos_retur`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_retur_detail`
--
ALTER TABLE `pos_retur_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_ro`
--
ALTER TABLE `pos_ro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_room`
--
ALTER TABLE `pos_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_ro_detail`
--
ALTER TABLE `pos_ro_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_sales`
--
ALTER TABLE `pos_sales`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_salesorder`
--
ALTER TABLE `pos_salesorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_salesorder_detail`
--
ALTER TABLE `pos_salesorder_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_stock`
--
ALTER TABLE `pos_stock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_stock_koreksi`
--
ALTER TABLE `pos_stock_koreksi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_stock_opname`
--
ALTER TABLE `pos_stock_opname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_stock_opname_detail`
--
ALTER TABLE `pos_stock_opname_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_stock_opname_detail_upload`
--
ALTER TABLE `pos_stock_opname_detail_upload`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_stock_rekap`
--
ALTER TABLE `pos_stock_rekap`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_stock_unit`
--
ALTER TABLE `pos_stock_unit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_storehouse`
--
ALTER TABLE `pos_storehouse`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_storehouse_users`
--
ALTER TABLE `pos_storehouse_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pos_supplier`
--
ALTER TABLE `pos_supplier`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_supplier_item`
--
ALTER TABLE `pos_supplier_item`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_table`
--
ALTER TABLE `pos_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pos_table_inventory`
--
ALTER TABLE `pos_table_inventory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pos_unit`
--
ALTER TABLE `pos_unit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pos_usagewaste`
--
ALTER TABLE `pos_usagewaste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_usagewaste_detail`
--
ALTER TABLE `pos_usagewaste_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_varian`
--
ALTER TABLE `pos_varian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_varian_item`
--
ALTER TABLE `pos_varian_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
