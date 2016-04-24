-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2016 at 10:12 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `knn_classification`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_terms`
--

CREATE TABLE IF NOT EXISTS `all_terms` (
`id_term` int(10) NOT NULL,
  `term` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `all_terms`
--

INSERT INTO `all_terms` (`id_term`, `term`) VALUES
(451, '1000'),
(455, '12'),
(331, '200'),
(393, '2005'),
(456, '3'),
(452, '3000'),
(355, '4'),
(387, '4718'),
(458, '5'),
(332, '500'),
(362, '6'),
(280, '65-78'),
(276, '65-85'),
(262, '7'),
(457, '9'),
(278, '95-100'),
(160, 'ada'),
(59, 'adalah'),
(442, 'agglomerative'),
(179, 'akhir'),
(154, 'aktivitas'),
(351, 'alamat'),
(169, 'alami'),
(86, 'alat'),
(396, 'algoritma'),
(166, 'aman'),
(247, 'ambil'),
(97, 'analisis'),
(135, 'analsis'),
(385, 'antar'),
(282, 'apabila'),
(153, 'aplikasi'),
(165, 'arah'),
(13, 'artikel'),
(216, 'asli'),
(44, 'atas'),
(187, 'audio'),
(259, 'avr'),
(18, 'awal'),
(279, 'b'),
(11, 'bagai'),
(315, 'bagaimana'),
(206, 'bagi'),
(128, 'bahan'),
(263, 'bahasa'),
(105, 'baik'),
(228, 'balik'),
(459, 'banding'),
(359, 'bangun'),
(69, 'bantu'),
(6, 'banyak'),
(368, 'baru'),
(85, 'bas'),
(311, 'based'),
(305, 'baterai'),
(29, 'bawa'),
(294, 'bebas'),
(287, 'beda'),
(125, 'belakang'),
(367, 'belum'),
(168, 'benar'),
(106, 'bentuk'),
(281, 'beri'),
(14, 'berita'),
(158, 'besar'),
(369, 'biasa'),
(79, 'biaya'),
(438, 'bisecting'),
(81, 'bisnis'),
(209, 'bit'),
(9, 'blog'),
(341, 'blogging'),
(399, 'bobot'),
(260, 'borland'),
(338, 'browsing'),
(16, 'buah'),
(61, 'buat'),
(440, 'buckshot'),
(391, 'bulan'),
(356, 'butuh'),
(264, 'c'),
(42, 'cara'),
(45, 'cari'),
(226, 'cenderung'),
(328, 'cepat'),
(249, 'cetak'),
(339, 'chatting'),
(90, 'citra'),
(310, 'cluster'),
(425, 'cluster-based'),
(379, 'clustering'),
(453, 'coba'),
(258, 'code'),
(390, 'com'),
(444, 'complete'),
(235, 'computer'),
(55, 'dalam'),
(364, 'dampak'),
(54, 'dapat'),
(52, 'dasar'),
(167, 'data'),
(62, 'database'),
(118, 'dati'),
(308, 'dekat'),
(201, 'dekripsi'),
(261, 'delphi'),
(373, 'depan'),
(242, 'deteksi'),
(215, 'didekripsi'),
(91, 'digital'),
(430, 'dikluster'),
(197, 'dinusstego'),
(292, 'diri'),
(403, 'diujicobakan'),
(267, 'dokumen'),
(432, 'dokumen-dokuman'),
(130, 'domain'),
(346, 'dunia'),
(184, 'echo'),
(21, 'editor'),
(412, 'efektif'),
(329, 'efisien'),
(322, 'efisiensi'),
(386, 'eksperimen'),
(405, 'eksponensial'),
(213, 'ekstraksi'),
(88, 'elektron'),
(72, 'elektronik'),
(323, 'energy'),
(200, 'enkripsi'),
(448, 'f-measure'),
(413, 'faktor'),
(343, 'familiar'),
(372, 'fitur'),
(120, 'fourier'),
(53, 'frekuensi'),
(198, 'fungsi'),
(277, 'g'),
(241, 'gambar'),
(374, 'global'),
(113, 'guna'),
(350, 'habis'),
(335, 'hadap'),
(283, 'hal'),
(349, 'hampir'),
(43, 'harap'),
(378, 'harga'),
(333, 'hari'),
(218, 'hasil'),
(325, 'head'),
(77, 'hemat'),
(185, 'hiding'),
(441, 'hierarchical'),
(127, 'histogram'),
(270, 'hitam'),
(230, 'hitung'),
(420, 'hypothesis'),
(60, 'i'),
(336, 'ialah'),
(402, 'idf'),
(65, 'ii'),
(175, 'ilmu'),
(189, 'implementasi'),
(376, 'indonesia'),
(156, 'informasi'),
(4, 'internet'),
(170, 'intervensi'),
(358, 'ip'),
(353, 'ipv4'),
(361, 'ipv6'),
(1, 'iring'),
(48, 'isi'),
(131, 'jadi'),
(162, 'jaga'),
(80, 'jalan'),
(327, 'jalur'),
(357, 'jamin'),
(321, 'jarak'),
(288, 'jaring'),
(231, 'jasa'),
(121, 'jelas'),
(23, 'jenis'),
(210, 'jumlah'),
(392, 'juni'),
(439, 'k-mean'),
(397, 'k-means'),
(384, 'kait'),
(423, 'kaji'),
(345, 'kalang'),
(330, 'kali'),
(286, 'kamera'),
(219, 'kandung'),
(83, 'kantor'),
(147, 'kapasitans'),
(227, 'kapasitas'),
(324, 'karena'),
(28, 'kasus'),
(46, 'kata'),
(51, 'kategori'),
(371, 'kehandalan'),
(309, 'kelompok'),
(268, 'keluar'),
(3, 'kembang'),
(181, 'kena'),
(108, 'kenal'),
(319, 'kerja'),
(233, 'kertas'),
(64, 'keyword'),
(342, 'khusus'),
(19, 'kirim'),
(422, 'kluster'),
(433, 'klusternya'),
(428, 'koleksi'),
(389, 'kompas'),
(129, 'komposit'),
(32, 'komputer'),
(302, 'komunikasi'),
(285, 'kondisi'),
(144, 'konduktivitas'),
(317, 'konfigurasi'),
(199, 'kriptografi'),
(136, 'kristal'),
(134, 'kristalograti'),
(446, 'kriteria'),
(163, 'kualitas'),
(98, 'kuantitatif'),
(141, 'kuat'),
(137, 'kunci'),
(150, 'lain'),
(26, 'laku'),
(49, 'lalu'),
(67, 'langkah'),
(246, 'lanjut'),
(124, 'latar'),
(36, 'lebih'),
(365, 'lemah'),
(243, 'lembar'),
(93, 'lengkap'),
(143, 'lentur'),
(30, 'level'),
(326, 'lifetime'),
(221, 'lihat'),
(409, 'linear'),
(445, 'link'),
(148, 'listrik'),
(401, 'log-tf'),
(195, 'lunak'),
(12, 'macam'),
(149, 'magnit'),
(151, 'makalah'),
(5, 'makin'),
(255, 'maksimum'),
(164, 'maksud'),
(295, 'mampu'),
(234, 'manfaat'),
(102, 'manual'),
(27, 'manusia'),
(33, 'masalah'),
(411, 'matching'),
(104, 'matematika'),
(140, 'material'),
(107, 'maupun'),
(186, 'media'),
(142, 'mekanik'),
(73, 'mem'),
(301, 'memory'),
(348, 'mengakibatkankan'),
(103, 'metoda'),
(237, 'metode'),
(87, 'mikroskop'),
(111, 'mikroskopik'),
(272, 'milik'),
(363, 'minimal'),
(254, 'minimum'),
(39, 'mining'),
(190, 'mobile'),
(82, 'model'),
(25, 'mudah'),
(429, 'mula'),
(7, 'muncul'),
(110, 'mungkin'),
(196, 'nama'),
(212, 'nanti'),
(291, 'network'),
(223, 'nilai'),
(289, 'nirkabel'),
(293, 'node'),
(220, 'noise'),
(394, 'november'),
(217, 'objek'),
(123, 'obyek'),
(205, 'offset'),
(96, 'olah'),
(408, 'oleh'),
(84, 'on-line'),
(15, 'online'),
(381, 'operasi'),
(245, 'optocoupler'),
(76, 'orang'),
(133, 'orientasi'),
(31, 'otomasi'),
(112, 'otomatis'),
(159, 'pacu'),
(138, 'paham'),
(176, 'pakai'),
(145, 'panas'),
(417, 'panggil'),
(208, 'panjang'),
(314, 'papar'),
(68, 'paper'),
(447, 'parameter'),
(437, 'partitional'),
(265, 'pascal'),
(257, 'pemrograman'),
(298, 'pemrosesan'),
(37, 'pendek'),
(284, 'pengaruh'),
(132, 'penting'),
(94, 'perangkat'),
(418, 'percaya'),
(117, 'periodik'),
(75, 'perlu'),
(202, 'pesan'),
(2, 'pesat'),
(191, 'phone'),
(171, 'pihak'),
(239, 'piksel'),
(251, 'pikselnya'),
(22, 'pilah'),
(436, 'pilih'),
(109, 'pola'),
(416, 'polisemy'),
(303, 'power'),
(449, 'precision'),
(173, 'previleges'),
(232, 'printer'),
(114, 'program'),
(250, 'proses'),
(307, 'protocol'),
(366, 'protokol'),
(225, 'psnr'),
(172, 'punya'),
(404, 'purity'),
(229, 'purwarupa'),
(431, 'pusat'),
(421, 'query'),
(275, 'r'),
(274, 'range'),
(204, 'rata'),
(238, 'raw'),
(450, 'recall'),
(71, 'redaksi'),
(214, 'region'),
(24, 'relatif'),
(415, 'relevan'),
(316, 'rencana'),
(252, 'rentang'),
(192, 'representasi'),
(146, 'resistansi'),
(424, 'retrieval'),
(253, 'rgb'),
(273, 'rgbnya'),
(306, 'routing'),
(426, 'ruang'),
(377, 'rupa'),
(40, 'salah'),
(382, 'sama'),
(211, 'sample'),
(157, 'sangat'),
(41, 'satu'),
(406, 'sebab'),
(174, 'sebut'),
(10, 'sedia'),
(370, 'segi'),
(92, 'seluruh'),
(203, 'sembunyi'),
(34, 'sendiri'),
(244, 'sensor'),
(297, 'sensornode'),
(193, 'serta'),
(207, 'sesuai'),
(256, 'setpoint'),
(139, 'sifat'),
(434, 'similaritas'),
(299, 'simpan'),
(312, 'simulasi'),
(414, 'sinonim'),
(224, 'sinyal'),
(70, 'sistem'),
(8, 'situs'),
(360, 'standar'),
(177, 'steganografi'),
(398, 'stemming'),
(194, 'strategi'),
(116, 'struktur'),
(180, 'studi'),
(240, 'suatu'),
(407, 'sulit'),
(66, 'sumber'),
(304, 'supply'),
(340, 'surfing'),
(320, 'system'),
(56, 'tahap'),
(74, 'tahu'),
(334, 'takjub'),
(122, 'tampil'),
(183, 'teknik'),
(161, 'teknologi'),
(380, 'teks'),
(115, 'tekstur'),
(58, 'teliti'),
(383, 'temu'),
(50, 'tentu'),
(182, 'terap'),
(17, 'terbit'),
(296, 'terima'),
(400, 'term'),
(38, 'text'),
(313, 'tiap'),
(435, 'tinggi'),
(419, 'tingkat'),
(269, 'tinta'),
(300, 'tra'),
(119, 'transformasi'),
(178, 'tugas'),
(155, 'tukar'),
(57, 'tulis'),
(347, 'tumbuh'),
(95, 'tunjang'),
(152, 'tunjuk'),
(222, 'turun'),
(454, 'turut'),
(126, 'ubah'),
(266, 'uji'),
(101, 'ukur'),
(99, 'umum'),
(395, 'ungkap'),
(89, 'upa'),
(443, 'upgma'),
(344, 'user'),
(352, 'utama'),
(63, 'vector'),
(427, 'vektor'),
(354, 'versi'),
(248, 'video'),
(236, 'vision'),
(100, 'visual'),
(375, 'volume'),
(47, 'wakil'),
(78, 'waktu'),
(35, 'walaupun'),
(271, 'warna'),
(20, 'wartawan'),
(188, 'wav'),
(290, 'wireless'),
(410, 'word'),
(318, 'wsn'),
(388, 'www'),
(337, 'yanag');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
`id_class` int(5) NOT NULL,
  `class_name` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id_class`, `class_name`) VALUES
(2, 'image'),
(1, 'ir'),
(3, 'jarkom');

-- --------------------------------------------------------

--
-- Table structure for table `distance`
--

CREATE TABLE IF NOT EXISTS `distance` (
`id_distance` int(10) NOT NULL,
  `id_doc_training` int(10) NOT NULL,
  `id_doc_testing` int(10) NOT NULL,
  `distance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_training`
--

CREATE TABLE IF NOT EXISTS `document_training` (
`id_doc` int(10) NOT NULL,
  `id_class` int(5) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `abstract` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_training`
--

INSERT INTO `document_training` (`id_doc`, `id_class`, `title`, `abstract`) VALUES
(1, 1, 'PEMILAHAN ARTIKEL BERITA DENGAN TEXT MINING', 'Seiring pesatnya perkembangan internet, semakin banyak pula bermunculan  situs atau blog yang menyediakan berbagai macam artikel berita secara online.  Sebuah artikel, sebelum dapat diterbitkan, awalnya dikirim oleh wartawan ke  editor untuk dipilah. Pemilahan jenis berita relatif mudah dilakukan oleh manusia, tetapi jika kasus ini dibawa ke level pemilahan secara otomasi dengan komputer akan membawa permasalahan tersendiri, walaupun untuk berita yang lebih pendek. Text mining adalah salah satu cara yang diharapkan dapat mengatasi permasalahan di atas. Dengan text mining, dapat dicari kata-kata yang dapat mewakili isi dari artikel berita, lalu ditentukan kategorinya berdasarkan frekuensi kata-kata yang terdapat di dalamnya. Tahapan yang penulis lakukan pada penelitian ini adalah: (i) pembuatan database vector untuk keyword, (ii) pemilahan sumber berita berdasarkan database dari langkah (i). Paper ini diharapkan dapat membantu sistem redaksi elektronik untuk dapat memilah atau mengetahui kategori dari sebuah artikel berita tanpa memerlukan seorang editor sehingga menghemat waktu dan biaya dalam menjalankan bisnis pada model kantor berita elektronik on-line berbasis internet.'),
(2, 2, 'PENGOLAHAN CITRA DIGITAL DAN ANALISIS KUANTITATIF ', 'Banyak peralatan mikroskop elektron walaupun sudah berupa citra digital tetapi belum seluruhnya dilengkapi perangkat penunjang untuk melakukan pengolahan dan analisis citra secara kuantitatif. Umumnya analisis dilakukan secara visual dan pengukuran dilakukan secara manual. Perkembangan metoda matematika baik untuk analisis bentuk maupun untuk pengenalan pola, memungkinkan dapat dilakukan analisis citra mikroskopik secara otomatis menggunakan komputer. Program pengolahan citra dapat digunakan untuk analisis tekstur atau struktur periodik daTi citra dengan menggunakan transformasi Fourier. Untuk memperjelas tampilan obyek terhadap latar belakang dapat dilakukan dengan mengubah histogram citra. Dengan berkembangnya bahan-bahan komposit, analisis Fourier dalam domain frekuensi menjadi penting yaitu untuk mengukur orientasi kristalograti Analsis struktur periodik dan orientasi kristal adalah kunci untuk memahami banyak sifat-sifat material seperti kekuatan mekanik, kelenturan, konduktivitas panas, resistansi, kapasitansi dan sifat-sifat listrik dan magnit bahan lainnya. Dalam makalah ini akan ditunjukkan aplikasi dari program pengolahan dan analisis citra digital pada citra mikroskopik.'),
(3, 3, 'PENGAMANAN PESAN TEXT DENGAN METODE KRIPTOGRAFI AD', 'Aktivitas pertukaran informasi yang sangat besar memacu adanya pengembangan teknologi informasi untuk bisa menjaga kualitas pengiriman informasi. Kualitas yang dimaksud mengarah kepada keamanan sewaktu pengiriman informasi sehingga data yang dipertukarkan benar-benar tidak mengalami intervensi dari pihak lain yang tidak mempunyai previleges akan data tersebut. Salah satu ilmu yang dipakai sebagai dasar untuk mengembangkan teknologi pengamanan pengiriman data adalah steganografi. Pada Tugas Akhir ini dilakukan studi mengenai penerapan steganografi dengan teknik Echo data Hiding pada media audio WAV yang diimplementasikan diatas perangkat mobile phone. Oleh karena itu diperlukan juga studi terhadap representasi dan struktur WAV tersebut beserta strategi penerapannya pada perangkat mobile phone . Perangkat lunak yang dikembangkan pada Tugas Akhir ini bernama DinusStego yang berfungsi untuk melakukan steganografi pada media audio WAV. Pada Tugas Akhir ini, implementasi steganografi akan disertai dengan penerapan kriptografi berupa enkripsi dan dekripsi. Pesan yang sudah dienkripsi terlebih dahulu akan disembunyikan secara merata pada setiap offset pada WAV . Pembagian ini akan disesuaikan dengan panjang bit pesan beserta struktur dan jumlah sample yang ada. Pesan yang nantinya diekstraksi dari region harus didekripsi lagi agar mendapatkan pesan asli. Objek steganografi yang dihasilkan mengandung noise yang terlihat dari penurunan nilai kekuatan sinyal sehingga nilai PSNR cenderung menurun jika kapasitas pesan yang disembunyikan semakin besar dan sebaliknya.'),
(4, 2, 'KOMPRESI CITRA BERWARNA MENGGUNAKAN METODE POHON B', 'aktivitas pertukaran informasi yang sangat besar memacu adanya pengembangan teknologi informasi untuk bisa menjaga kualitas pengiriman informasi. Kualitas yang dimaksud mengarah kepada keamanan sewaktu pengiriman informasi sehingga data yang dipertukarkan'),
(5, 2, 'PURWARUPA PENGHITUNG JASA PEMAKAIAN PRINTER MENGGU', 'Telah dibuat purwarupa penghitung jasa pemakaian printer menggunakan penerapan pengolahan pengolahan citra digital. Sistem penghitung jasa kertas ini dibuat dengan memanfaatkan computer vision . Metode yang digunakan dalam sistem ini adalah dengan RAW piksel suatu gambar. Sebelum dilakukan pengolahan citra , tahapan yang dilakukan adalah pendeteksian lembar kertas dengan menggunakan sensor optocoupler, dilanjutkan dengan pengambilan video hasil cetakan kertas. Pada pengolahan citra , video akan diproses dan diubah dalam bentuk gambar. Gambar ini akan dideteksi RAW pikselnya dan diukur rentang nilai RGB minimum dan maksimum gambar tersebut. Nilai RGB dari kertas akan dijadikan setpoint sebagai pendeteksian hasil cetakan kertas. Pemrograman yang digunakan dalam pembuatan purwarupa ini adalah Code Vision AVR dan menggunakan Borland Delphi 7. Bahasa pemrograman yang digunakan adalah C++ dan pascal. Pengujian dilakukan dengan mencetak dokumen kedalam bentuk kertas dengan menggunakan printer. Kertas yang keluar akan dideteksi berupa kertas dengan tinta hitam atau warna lainnya. Hasil cetakan yang digunakan memiliki warna hitam dengan nilai RGBnya berada di range R(65-85),G(95-100),B(65-78). Dari hasil pengujian, metode menggunakan RAW piksel dapat memberikan hasil yang terbaik apabila hasil cetak dari printer juga baik. Hal-hal yang berpengaruh terhadap metode ini antara lain kondisi kamera, range RGB hasil cetakan setiap warna. Hasil akhir dari sistem ini adalah pembedaan warna kertas dan hasil jasa pemakaian printer.'),
(6, 3, 'SIMULASI ROUTING PROTOKOL PADA JARINGAN SENSOR NIR', 'Jaringan Sensor Nirkabel (Wireless Sensor Network) terdiri atas sejumlah besar sensor node yang bebas. Setiap node memiliki kemampuan untuk mengirim, menerima dan mendeteksi. Selain itu sensornode juga di lengkapi dengan peralatan pemrosesan data, penyimpanan data sementra atau memory, peralatan komunikasi dan power supply atau baterai. Pada paper ini akan dijelaskan sebuah routing protocol pada Wireless Sensor Network dengan menggunakan pendekatan secara pengelompokan (cluster based). Routing yang akan disimulasikan, dibuat berdasarkan cluster tiap node. Masalah yang akan dipaparkan yaitu bagaimana perencanaan konfigurasi, simulasi implementasi cluster based routing pada WSN serta bagaimana pengaruh metode ini terhadap kinerja system. Pada metode cluster based routing perhitungan didasarkan pada jarak dan efisiensi energy yang digunakan, dikarenakan node mengirim informasi melalui cluster head, maka energy dapat dihemat untuk memperpanjang lifetime jaringan tersebut. Hasil yang diharapkan pada paper ini adalah membuat sebuah jalur routing yang cepat dan efisien pada penggunaan energy, energy yang diperlukan satu node untuk satu kali pengiriman data sebesar 200â€“500 bit'),
(7, 3, 'PERBANDINGAN INTERNET PROTOCOL VERSI 4 DAN VERSI 6', 'Perkembangan Internet semakin hari semakin menakjubkan, tiap hari kita dihadapkan oleh berbagai macam informasi, baik secara tertulis maupun visual. Salah satunya ialah Internet yanag dapat melakukan berbagai macam aktivitas bagi kita seperti browsing, chatting, surfing, blogging dan lain sebagainya. Terkhususnya untuk Internet yang semakin familiar dengan para user dari berbagai macam kalangan diseluruh dunia. Pertumbuhan Internet yang begitu cepat mengakibatkankan hampir habisnya alamat terutama alamat IPv4 (Internet protocol versi 4) serta membutuhkan keamanan yang lebih terjamin pada IP level ini, untuk itu dibangunlah sebuah protocol dan standar yang dikenal sebagai IPv6 (Internet Protocol versi 6) untuk meminimalkan dampak atau kelemahan dari protokol versi sebelumnya, untuk itu para pemakai baru harus dapat membiasakan dan membedakan baik dari segi kehandalan, fitur, kelemahan,dari dua macam Internet protokol utama ini yang akan diterapkan pada penggunaan kedepan yang semakin global. '),
(8, 1, 'Clustering Berita Berbahasa Indonesia', 'Volume berita elektronik berbahasa Indonesia yang semakin besar merupakan sumber informasi yang berharga. Clustering dokumen teks adalah salah satu operasi pada text mining untuk mengelompokkan dokumen yang memiliki kesamaan isi. Clustering dapat diaplikasikan untuk menemukan keterkaitan antar berita. Eksperimen dalam paper ini menggunakan 4718 berita dari situs www.kompas.com yang diambil pada bulan Juni 2005 sampai dengan November 2005. Hasil dari eksperimen menunjukkan clustering dapat mengungkapkan keterkaitan antar berita yang sebelumnya tidak terlihat. Clustering pada eksperimen ini menggunakan algoritma K-means. Penggunaan stemming, pembobotan term log-tf dan log-tf.idf juga diujicobakan untuk melihat pengaruhnya terhadap kualitas cluster yang diukur dengan purity.'),
(9, 1, 'TEMU KEMBALI INFORMASI BERBASIS KLUSTER UNTUK SIST', 'Volume informasi teks yang berkembang eksponensial menyebabkan kesulitan dalam proses temu kembali informasi, utamanya pada model perolehan informasi linear berbasis word matching yang umumnya tidak efektif. Faktor sinonim dari kata menjadi penyebab munculnya dokumen tidak relevan dalam perolehan, sebaliknya faktor polisemy menyebabkan banyak dokumen yang relevan tidak terpanggil. Penerapan clustering dokumen dipercaya dapat meningkatkan kinerja berdasar satu hypothesis bahwa dokumen yang relevan terhadap suatu query cenderung berada dalam kluster yang sama.  Penelitian ini melakukan kajian penerapan clustering dokumen untuk meningkatkan perolehan informasi dengan cara melakukan retrieval berbasis kluster (cluster-based retrieval) dengan model ruang vektor. Koleksi dokumen mula-mula dikluster dan representasi kluster digunakan vektor pusat kluster. Dokumen-dokuman dalam kluster yang pusat klusternya memiliki similaritas tertinggi terhadap query dipilih sebagai perolehan.  Metode clustering yang dipilih adalah metode partitional, yaitu algoritma Bisecting K-Mean dan Buckshot, dan metode hierarchical agglomerative dengan algoritma perhitungan similaritas kluster UPGMA dan Complete Link. Kriteria kinerja perolehan informasi diukur dengan parameter F-measure yang diturunkan dari Precision dan Recall dari retrieval. Koleksi dokumen yang digunakan adalah 1000 dokumen berita yang telah diketahui struktur klusternya dan 3000 dokumen berita dengan struktur kluster belum diketahui. Hasil penelitian menunjukkan bahwa pada koleksi yang dicobakan terjadi peningkatan kinerja perolehan informasi berbasis kluster sebesar berturut-turut 12.3% dan 9.5% dibandingkan dengan perolehan linear berbasis word â€“matching.');

--
-- Triggers `document_training`
--
DELIMITER //
CREATE TRIGGER `delete_term` BEFORE DELETE ON `document_training`
 FOR EACH ROW DELETE FROM all_terms WHERE id_term IN 
    (
	SELECT id_term 
	FROM term_freq 
	WHERE id_term IN(
		SELECT a.id_term
		FROM (SELECT * from term_freq) as a INNER JOIN (SELECT * FROM all_terms) AS b 
		ON a.id_term=b.id_term
		GROUP BY a.`id_term`
		HAVING COUNT(a.`id_term`) = 1
		)
	AND id_doc = OLD.id_doc
	)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `term_freq`
--

CREATE TABLE IF NOT EXISTS `term_freq` (
`id_freq` int(10) NOT NULL,
  `id_doc` int(10) NOT NULL,
  `id_term` int(10) NOT NULL,
  `freq` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=650 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `term_freq`
--

INSERT INTO `term_freq` (`id_freq`, `id_doc`, `id_term`, `freq`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 2),
(5, 1, 5, 1),
(6, 1, 6, 1),
(7, 1, 7, 1),
(8, 1, 8, 1),
(9, 1, 9, 1),
(10, 1, 10, 1),
(11, 1, 11, 1),
(12, 1, 12, 1),
(13, 1, 13, 4),
(14, 1, 14, 7),
(15, 1, 15, 1),
(16, 1, 16, 2),
(17, 1, 17, 1),
(18, 1, 18, 1),
(19, 1, 19, 1),
(20, 1, 20, 1),
(21, 1, 21, 2),
(22, 1, 22, 4),
(23, 1, 23, 1),
(24, 1, 24, 1),
(25, 1, 25, 1),
(26, 1, 26, 2),
(27, 1, 27, 1),
(28, 1, 28, 1),
(29, 1, 29, 2),
(30, 1, 30, 1),
(31, 1, 31, 1),
(32, 1, 32, 1),
(33, 1, 33, 2),
(34, 1, 34, 1),
(35, 1, 35, 1),
(36, 1, 36, 1),
(37, 1, 37, 1),
(38, 1, 38, 2),
(39, 1, 39, 2),
(40, 1, 40, 1),
(41, 1, 41, 1),
(42, 1, 42, 1),
(43, 1, 43, 2),
(44, 1, 44, 2),
(45, 1, 45, 1),
(46, 1, 46, 2),
(47, 1, 47, 1),
(48, 1, 48, 1),
(49, 1, 49, 1),
(50, 1, 50, 1),
(51, 1, 51, 2),
(52, 1, 52, 2),
(53, 1, 53, 1),
(54, 1, 54, 1),
(55, 1, 55, 1),
(56, 1, 56, 1),
(57, 1, 57, 1),
(58, 1, 58, 1),
(59, 1, 59, 1),
(60, 1, 60, 2),
(61, 1, 61, 1),
(62, 1, 62, 2),
(63, 1, 63, 1),
(64, 1, 64, 1),
(65, 1, 65, 1),
(66, 1, 66, 1),
(67, 1, 67, 1),
(68, 1, 68, 1),
(69, 1, 69, 1),
(70, 1, 70, 1),
(71, 1, 71, 1),
(72, 1, 72, 2),
(73, 1, 73, 1),
(74, 1, 74, 1),
(75, 1, 75, 1),
(76, 1, 76, 1),
(77, 1, 77, 1),
(78, 1, 78, 1),
(79, 1, 79, 1),
(80, 1, 80, 1),
(81, 1, 81, 1),
(82, 1, 82, 1),
(83, 1, 83, 1),
(84, 1, 84, 1),
(85, 1, 85, 1),
(86, 2, 3, 2),
(87, 2, 6, 2),
(88, 2, 26, 5),
(89, 2, 32, 1),
(90, 2, 35, 1),
(91, 2, 53, 1),
(92, 2, 86, 1),
(93, 2, 87, 1),
(94, 2, 88, 1),
(95, 2, 89, 1),
(96, 2, 90, 8),
(97, 2, 91, 2),
(98, 2, 92, 1),
(99, 2, 93, 1),
(100, 2, 94, 1),
(101, 2, 95, 1),
(102, 2, 96, 3),
(103, 2, 97, 7),
(104, 2, 98, 1),
(105, 2, 99, 1),
(106, 2, 100, 1),
(107, 2, 101, 2),
(108, 2, 102, 1),
(109, 2, 103, 1),
(110, 2, 104, 1),
(111, 2, 105, 1),
(112, 2, 106, 1),
(113, 2, 107, 1),
(114, 2, 108, 1),
(115, 2, 109, 1),
(116, 2, 110, 1),
(117, 2, 111, 2),
(118, 2, 112, 1),
(119, 2, 113, 3),
(120, 2, 114, 2),
(121, 2, 115, 1),
(122, 2, 116, 2),
(123, 2, 117, 2),
(124, 2, 118, 1),
(125, 2, 119, 1),
(126, 2, 120, 2),
(127, 2, 121, 1),
(128, 2, 122, 1),
(129, 2, 123, 1),
(130, 2, 124, 1),
(131, 2, 125, 1),
(132, 2, 126, 1),
(133, 2, 127, 1),
(134, 2, 128, 2),
(135, 2, 129, 1),
(136, 2, 130, 1),
(137, 2, 131, 1),
(138, 2, 132, 1),
(139, 2, 133, 2),
(140, 2, 134, 1),
(141, 2, 135, 1),
(142, 2, 136, 1),
(143, 2, 137, 1),
(144, 2, 138, 1),
(145, 2, 139, 2),
(146, 2, 140, 1),
(147, 2, 141, 1),
(148, 2, 142, 1),
(149, 2, 143, 1),
(150, 2, 144, 1),
(151, 2, 145, 1),
(152, 2, 146, 1),
(153, 2, 147, 1),
(154, 2, 148, 1),
(155, 2, 149, 1),
(156, 2, 150, 1),
(157, 2, 151, 1),
(158, 2, 152, 1),
(159, 2, 153, 1),
(160, 3, 3, 3),
(161, 3, 5, 1),
(162, 3, 19, 3),
(163, 3, 26, 2),
(164, 3, 36, 1),
(165, 3, 40, 1),
(166, 3, 41, 1),
(167, 3, 44, 1),
(168, 3, 52, 1),
(169, 3, 54, 1),
(170, 3, 75, 1),
(171, 3, 78, 1),
(172, 3, 89, 1),
(173, 3, 94, 3),
(174, 3, 116, 2),
(175, 3, 141, 1),
(176, 3, 154, 1),
(177, 3, 155, 2),
(178, 3, 156, 4),
(179, 3, 157, 1),
(180, 3, 158, 2),
(181, 3, 159, 1),
(182, 3, 160, 1),
(183, 3, 161, 2),
(184, 3, 162, 1),
(185, 3, 163, 2),
(186, 3, 164, 1),
(187, 3, 165, 1),
(188, 3, 166, 2),
(189, 3, 167, 4),
(190, 3, 168, 1),
(191, 3, 169, 1),
(192, 3, 170, 1),
(193, 3, 171, 1),
(194, 3, 172, 1),
(195, 3, 173, 1),
(196, 3, 174, 2),
(197, 3, 175, 1),
(198, 3, 176, 1),
(199, 3, 177, 5),
(200, 3, 178, 3),
(201, 3, 179, 3),
(202, 3, 180, 2),
(203, 3, 181, 1),
(204, 3, 182, 3),
(205, 3, 183, 1),
(206, 3, 184, 1),
(207, 3, 185, 1),
(208, 3, 186, 2),
(209, 3, 187, 2),
(210, 3, 188, 4),
(211, 3, 189, 2),
(212, 3, 190, 2),
(213, 3, 191, 2),
(214, 3, 192, 1),
(215, 3, 193, 3),
(216, 3, 194, 1),
(217, 3, 195, 1),
(218, 3, 196, 1),
(219, 3, 197, 1),
(220, 3, 198, 1),
(221, 3, 199, 1),
(222, 3, 200, 2),
(223, 3, 201, 1),
(224, 3, 202, 5),
(225, 3, 203, 2),
(226, 3, 204, 1),
(227, 3, 205, 1),
(228, 3, 206, 1),
(229, 3, 207, 1),
(230, 3, 208, 1),
(231, 3, 209, 1),
(232, 3, 210, 1),
(233, 3, 211, 1),
(234, 3, 212, 1),
(235, 3, 213, 1),
(236, 3, 214, 1),
(237, 3, 215, 1),
(238, 3, 216, 1),
(239, 3, 217, 1),
(240, 3, 218, 1),
(241, 3, 219, 1),
(242, 3, 220, 1),
(243, 3, 221, 1),
(244, 3, 222, 2),
(245, 3, 223, 2),
(246, 3, 224, 1),
(247, 3, 225, 1),
(248, 3, 226, 1),
(249, 3, 227, 1),
(250, 3, 228, 1),
(251, 4, 3, 1),
(252, 4, 19, 2),
(253, 4, 78, 1),
(254, 4, 154, 1),
(255, 4, 155, 2),
(256, 4, 156, 4),
(257, 4, 157, 1),
(258, 4, 158, 1),
(259, 4, 159, 1),
(260, 4, 160, 1),
(261, 4, 161, 1),
(262, 4, 162, 1),
(263, 4, 163, 2),
(264, 4, 164, 1),
(265, 4, 165, 1),
(266, 4, 166, 1),
(267, 4, 167, 1),
(268, 5, 26, 3),
(269, 5, 55, 1),
(270, 5, 56, 1),
(271, 5, 61, 3),
(272, 5, 70, 3),
(273, 5, 89, 1),
(274, 5, 90, 3),
(275, 5, 91, 1),
(276, 5, 96, 4),
(277, 5, 101, 1),
(278, 5, 105, 2),
(279, 5, 106, 2),
(280, 5, 113, 9),
(281, 5, 126, 1),
(282, 5, 131, 1),
(283, 5, 150, 1),
(284, 5, 160, 1),
(285, 5, 174, 1),
(286, 5, 176, 2),
(287, 5, 179, 1),
(288, 5, 182, 1),
(289, 5, 218, 9),
(290, 5, 223, 3),
(291, 5, 229, 2),
(292, 5, 230, 2),
(293, 5, 231, 3),
(294, 5, 232, 4),
(295, 5, 233, 9),
(296, 5, 234, 1),
(297, 5, 235, 1),
(298, 5, 236, 2),
(299, 5, 237, 3),
(300, 5, 238, 3),
(301, 5, 239, 2),
(302, 5, 240, 1),
(303, 5, 241, 4),
(304, 5, 242, 4),
(305, 5, 243, 1),
(306, 5, 244, 1),
(307, 5, 245, 1),
(308, 5, 246, 1),
(309, 5, 247, 1),
(310, 5, 248, 2),
(311, 5, 249, 6),
(312, 5, 250, 1),
(313, 5, 251, 1),
(314, 5, 252, 1),
(315, 5, 253, 3),
(316, 5, 254, 1),
(317, 5, 255, 1),
(318, 5, 256, 1),
(319, 5, 257, 2),
(320, 5, 258, 1),
(321, 5, 259, 1),
(322, 5, 260, 1),
(323, 5, 261, 1),
(324, 5, 262, 1),
(325, 5, 263, 1),
(326, 5, 264, 1),
(327, 5, 265, 1),
(328, 5, 266, 2),
(329, 5, 267, 1),
(330, 5, 268, 1),
(331, 5, 269, 1),
(332, 5, 270, 2),
(333, 5, 271, 4),
(334, 5, 272, 1),
(335, 5, 273, 1),
(336, 5, 274, 2),
(337, 5, 275, 1),
(338, 5, 276, 1),
(339, 5, 277, 1),
(340, 5, 278, 1),
(341, 5, 279, 1),
(342, 5, 280, 1),
(343, 5, 281, 1),
(344, 5, 282, 1),
(345, 5, 283, 1),
(346, 5, 284, 1),
(347, 5, 285, 1),
(348, 5, 286, 1),
(349, 5, 287, 1),
(350, 6, 16, 2),
(351, 6, 19, 3),
(352, 6, 33, 1),
(353, 6, 41, 2),
(354, 6, 43, 1),
(355, 6, 44, 1),
(356, 6, 49, 1),
(357, 6, 52, 2),
(358, 6, 61, 2),
(359, 6, 68, 2),
(360, 6, 75, 1),
(361, 6, 77, 1),
(362, 6, 86, 2),
(363, 6, 93, 1),
(364, 6, 113, 3),
(365, 6, 121, 1),
(366, 6, 156, 1),
(367, 6, 158, 2),
(368, 6, 167, 3),
(369, 6, 174, 1),
(370, 6, 189, 1),
(371, 6, 208, 1),
(372, 6, 209, 1),
(373, 6, 210, 1),
(374, 6, 218, 1),
(375, 6, 230, 1),
(376, 6, 237, 2),
(377, 6, 242, 1),
(378, 6, 244, 4),
(379, 6, 272, 1),
(380, 6, 284, 1),
(381, 6, 288, 2),
(382, 6, 289, 1),
(383, 6, 290, 2),
(384, 6, 291, 2),
(385, 6, 292, 1),
(386, 6, 293, 5),
(387, 6, 294, 1),
(388, 6, 295, 1),
(389, 6, 296, 1),
(390, 6, 297, 1),
(391, 6, 298, 1),
(392, 6, 299, 1),
(393, 6, 300, 1),
(394, 6, 301, 1),
(395, 6, 302, 1),
(396, 6, 303, 1),
(397, 6, 304, 1),
(398, 6, 305, 1),
(399, 6, 306, 5),
(400, 6, 307, 1),
(401, 6, 308, 1),
(402, 6, 309, 1),
(403, 6, 310, 5),
(404, 6, 311, 3),
(405, 6, 312, 2),
(406, 6, 313, 1),
(407, 6, 314, 1),
(408, 6, 315, 2),
(409, 6, 316, 1),
(410, 6, 317, 1),
(411, 6, 318, 1),
(412, 6, 319, 1),
(413, 6, 320, 1),
(414, 6, 321, 1),
(415, 6, 322, 1),
(416, 6, 323, 4),
(417, 6, 324, 1),
(418, 6, 325, 1),
(419, 6, 326, 1),
(420, 6, 327, 1),
(421, 6, 328, 1),
(422, 6, 329, 1),
(423, 6, 330, 1),
(424, 6, 331, 1),
(425, 6, 332, 1),
(426, 7, 3, 1),
(427, 7, 4, 7),
(428, 7, 5, 4),
(429, 7, 11, 4),
(430, 7, 12, 4),
(431, 7, 16, 1),
(432, 7, 26, 1),
(433, 7, 30, 1),
(434, 7, 36, 1),
(435, 7, 40, 1),
(436, 7, 41, 1),
(437, 7, 57, 1),
(438, 7, 92, 1),
(439, 7, 100, 1),
(440, 7, 105, 2),
(441, 7, 107, 1),
(442, 7, 108, 1),
(443, 7, 113, 1),
(444, 7, 154, 1),
(445, 7, 156, 1),
(446, 7, 166, 1),
(447, 7, 176, 1),
(448, 7, 182, 1),
(449, 7, 287, 1),
(450, 7, 307, 3),
(451, 7, 313, 1),
(452, 7, 328, 1),
(453, 7, 333, 2),
(454, 7, 334, 1),
(455, 7, 335, 1),
(456, 7, 336, 1),
(457, 7, 337, 1),
(458, 7, 338, 1),
(459, 7, 339, 1),
(460, 7, 340, 1),
(461, 7, 341, 1),
(462, 7, 342, 1),
(463, 7, 343, 1),
(464, 7, 344, 1),
(465, 7, 345, 1),
(466, 7, 346, 1),
(467, 7, 347, 1),
(468, 7, 348, 1),
(469, 7, 349, 1),
(470, 7, 350, 1),
(471, 7, 351, 2),
(472, 7, 352, 2),
(473, 7, 353, 1),
(474, 7, 354, 3),
(475, 7, 355, 1),
(476, 7, 356, 1),
(477, 7, 357, 1),
(478, 7, 358, 1),
(479, 7, 359, 1),
(480, 7, 360, 1),
(481, 7, 361, 1),
(482, 7, 362, 1),
(483, 7, 363, 1),
(484, 7, 364, 1),
(485, 7, 365, 2),
(486, 7, 366, 2),
(487, 7, 367, 1),
(488, 7, 368, 1),
(489, 7, 369, 1),
(490, 7, 370, 1),
(491, 7, 371, 1),
(492, 7, 372, 1),
(493, 7, 373, 1),
(494, 7, 374, 1),
(495, 8, 5, 1),
(496, 8, 8, 1),
(497, 8, 14, 4),
(498, 8, 38, 1),
(499, 8, 39, 1),
(500, 8, 40, 1),
(501, 8, 41, 1),
(502, 8, 48, 1),
(503, 8, 66, 1),
(504, 8, 68, 1),
(505, 8, 72, 1),
(506, 8, 101, 1),
(507, 8, 113, 3),
(508, 8, 152, 1),
(509, 8, 153, 1),
(510, 8, 156, 1),
(511, 8, 158, 1),
(512, 8, 163, 1),
(513, 8, 218, 1),
(514, 8, 221, 2),
(515, 8, 247, 1),
(516, 8, 263, 1),
(517, 8, 267, 2),
(518, 8, 272, 1),
(519, 8, 284, 1),
(520, 8, 309, 1),
(521, 8, 310, 1),
(522, 8, 367, 1),
(523, 8, 375, 1),
(524, 8, 376, 1),
(525, 8, 377, 1),
(526, 8, 378, 1),
(527, 8, 379, 4),
(528, 8, 380, 1),
(529, 8, 381, 1),
(530, 8, 382, 1),
(531, 8, 383, 1),
(532, 8, 384, 2),
(533, 8, 385, 2),
(534, 8, 386, 3),
(535, 8, 387, 1),
(536, 8, 388, 1),
(537, 8, 389, 1),
(538, 8, 390, 1),
(539, 8, 391, 1),
(540, 8, 392, 1),
(541, 8, 393, 2),
(542, 8, 394, 1),
(543, 8, 395, 1),
(544, 8, 396, 1),
(545, 8, 397, 1),
(546, 8, 398, 1),
(547, 8, 399, 1),
(548, 8, 400, 1),
(549, 8, 401, 2),
(550, 8, 402, 1),
(551, 8, 403, 1),
(552, 8, 404, 1),
(553, 9, 3, 1),
(554, 9, 6, 1),
(555, 9, 7, 1),
(556, 9, 14, 2),
(557, 9, 26, 2),
(558, 9, 41, 1),
(559, 9, 42, 1),
(560, 9, 46, 1),
(561, 9, 52, 1),
(562, 9, 58, 2),
(563, 9, 74, 2),
(564, 9, 82, 2),
(565, 9, 85, 4),
(566, 9, 99, 1),
(567, 9, 101, 1),
(568, 9, 113, 2),
(569, 9, 116, 2),
(570, 9, 131, 2),
(571, 9, 152, 1),
(572, 9, 156, 6),
(573, 9, 158, 1),
(574, 9, 160, 1),
(575, 9, 182, 2),
(576, 9, 192, 1),
(577, 9, 218, 1),
(578, 9, 222, 1),
(579, 9, 226, 1),
(580, 9, 228, 1),
(581, 9, 230, 1),
(582, 9, 237, 3),
(583, 9, 240, 1),
(584, 9, 250, 1),
(585, 9, 267, 9),
(586, 9, 272, 1),
(587, 9, 319, 3),
(588, 9, 352, 1),
(589, 9, 375, 1),
(590, 9, 379, 3),
(591, 9, 380, 1),
(592, 9, 382, 1),
(593, 9, 383, 1),
(594, 9, 396, 2),
(595, 9, 405, 1),
(596, 9, 406, 3),
(597, 9, 407, 1),
(598, 9, 408, 7),
(599, 9, 409, 2),
(600, 9, 410, 2),
(601, 9, 411, 2),
(602, 9, 412, 1),
(603, 9, 413, 2),
(604, 9, 414, 1),
(605, 9, 415, 3),
(606, 9, 416, 1),
(607, 9, 417, 1),
(608, 9, 418, 1),
(609, 9, 419, 3),
(610, 9, 420, 1),
(611, 9, 421, 2),
(612, 9, 422, 8),
(613, 9, 423, 1),
(614, 9, 424, 3),
(615, 9, 425, 1),
(616, 9, 426, 1),
(617, 9, 427, 2),
(618, 9, 428, 3),
(619, 9, 429, 1),
(620, 9, 430, 1),
(621, 9, 431, 2),
(622, 9, 432, 1),
(623, 9, 433, 2),
(624, 9, 434, 2),
(625, 9, 435, 1),
(626, 9, 436, 2),
(627, 9, 437, 1),
(628, 9, 438, 1),
(629, 9, 439, 1),
(630, 9, 440, 1),
(631, 9, 441, 1),
(632, 9, 442, 1),
(633, 9, 443, 1),
(634, 9, 444, 1),
(635, 9, 445, 1),
(636, 9, 446, 1),
(637, 9, 447, 1),
(638, 9, 448, 1),
(639, 9, 449, 1),
(640, 9, 450, 1),
(641, 9, 451, 1),
(642, 9, 452, 1),
(643, 9, 453, 1),
(644, 9, 454, 1),
(645, 9, 455, 1),
(646, 9, 456, 1),
(647, 9, 457, 1),
(648, 9, 458, 1),
(649, 9, 459, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_terms`
--
ALTER TABLE `all_terms`
 ADD PRIMARY KEY (`id_term`), ADD UNIQUE KEY `term` (`term`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
 ADD PRIMARY KEY (`id_class`), ADD UNIQUE KEY `class_name` (`class_name`);

--
-- Indexes for table `distance`
--
ALTER TABLE `distance`
 ADD PRIMARY KEY (`id_distance`), ADD KEY `fk_doc_train` (`id_doc_training`), ADD KEY `fk_doc_test` (`id_doc_testing`);

--
-- Indexes for table `document_training`
--
ALTER TABLE `document_training`
 ADD PRIMARY KEY (`id_doc`), ADD KEY `fk_class` (`id_class`);

--
-- Indexes for table `term_freq`
--
ALTER TABLE `term_freq`
 ADD PRIMARY KEY (`id_freq`), ADD KEY `fk_doc` (`id_doc`), ADD KEY `fk_all_terms` (`id_term`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_terms`
--
ALTER TABLE `all_terms`
MODIFY `id_term` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=460;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
MODIFY `id_class` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `distance`
--
ALTER TABLE `distance`
MODIFY `id_distance` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `document_training`
--
ALTER TABLE `document_training`
MODIFY `id_doc` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `term_freq`
--
ALTER TABLE `term_freq`
MODIFY `id_freq` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=650;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `distance`
--
ALTER TABLE `distance`
ADD CONSTRAINT `fk_doc_train` FOREIGN KEY (`id_doc_training`) REFERENCES `document_training` (`id_doc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `document_training`
--
ALTER TABLE `document_training`
ADD CONSTRAINT `fk_class` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `term_freq`
--
ALTER TABLE `term_freq`
ADD CONSTRAINT `fk_all_terms` FOREIGN KEY (`id_term`) REFERENCES `all_terms` (`id_term`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_doc` FOREIGN KEY (`id_doc`) REFERENCES `document_training` (`id_doc`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
