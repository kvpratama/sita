-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2011 at 05:29 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `cita`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorize`
--

CREATE TABLE IF NOT EXISTS `authorize` (
  `role_id` varchar(4) NOT NULL,
  `f_id` varchar(4) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `f_id` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorize`
--

INSERT INTO `authorize` (`role_id`, `f_id`) VALUES
('0001', '1002'),
('0002', '1001'),
('0001', '1003'),
('0001', '1004');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE IF NOT EXISTS `dosen` (
  `id_dosen` varchar(3) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama_dosen`) VALUES
('101', 'Alfandi Nugroho Yahya'),
('102', 'Adi Suryaputra'),
('103', 'Alfon Wicaksi'),
('104', 'Caecillia Citra'),
('105', 'Egawati Panjei'),
('106', 'Rinabi Tanamal');

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE IF NOT EXISTS `feature` (
  `f_id` varchar(4) NOT NULL,
  `f_name` varchar(20) NOT NULL,
  `uri` varchar(30) NOT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`f_id`, `f_name`, `uri`) VALUES
('1001', 'register ta', 'registerTA.jsp'),
('1002', 'manage user status', 'manageUser.jsp'),
('1003', 'see logging data', 'showLog.jsp'),
('1004', 'manage final project', 'manageTA.jsp');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE IF NOT EXISTS `jurusan` (
  `id_jurusan` varchar(3) NOT NULL,
  `department` varchar(20) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `department`, `jurusan`) VALUES
('201', 'Teknik', 'Teknologi Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama_mahasiswa` varchar(60) NOT NULL,
  `angkatan` varchar(4) NOT NULL,
  `id_jurusan` varchar(3) NOT NULL,
  PRIMARY KEY (`nim`),
  KEY `id_jurusan` (`id_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama_mahasiswa`, `angkatan`, `id_jurusan`) VALUES
('20101010', 'awicaksi', '2001', '201'),
('20108009', 'Nyoto', '2008', '201'),
('20109001', 'Danur Prabowo', '2009', '201'),
('20109007', 'Kristanto Sean', '2009', '201'),
('20109008', 'Kevin Pratama', '2009', '201'),
('20109009', 'Michael Go', '2009', '201'),
('20109010', 'Bobby Iswandi', '2009', '201'),
('20109011', 'Andry Adithya', '2009', '201'),
('20109019', 'Edward Leonarto', '2009', '201'),
('20109026', 'Yuliani Suhartono', '2009', '201'),
('20109027', 'Daud Agus', '2009', '201'),
('20109028', 'Jacky Hoeny', '2009', '201'),
('20109030', 'Axel Filbert', '2009', '201'),
('20109038', 'Christian Hartanto', '2009', '201'),
('20109039', 'Ahmad Nugroho', '2009', '201'),
('20109040', 'Hadianto Karnanta', '2009', '201'),
('20109080', 'Akbar Bonai', '2009', '201'),
('20109089', 'Wendy Sigura', '2009', '201'),
('20109999', 'kevn', '2009', '201');

-- --------------------------------------------------------

--
-- Table structure for table `pembimbing`
--

CREATE TABLE IF NOT EXISTS `pembimbing` (
  `nim` varchar(10) NOT NULL,
  `id_dosen` varchar(3) NOT NULL,
  KEY `id_dosen` (`id_dosen`),
  KEY `nim` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembimbing`
--

INSERT INTO `pembimbing` (`nim`, `id_dosen`) VALUES
('20109008', '101'),
('20109008', '102'),
('20109009', '104'),
('20109009', '106'),
('20109007', '102'),
('20109007', '105'),
('20109010', '104'),
('20109010', '101'),
('20109011', '102'),
('20109011', '105'),
('20109001', '101'),
('20109001', '106'),
('20109019', '106'),
('20109019', '104'),
('20109026', '102'),
('20109026', '106'),
('20109027', '103'),
('20109027', '104'),
('20109028', '105'),
('20109028', '104'),
('20109030', '106'),
('20109030', '102'),
('20109038', '106'),
('20109038', '104'),
('20109039', '103'),
('20109039', '104'),
('20109040', '105'),
('20109040', '102'),
('20101010', '101'),
('20101010', '106'),
('20109080', '101'),
('20109080', '102'),
('20108009', '103'),
('20108009', '103');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` varchar(4) NOT NULL,
  `role_name` varchar(10) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
('0001', 'admin'),
('0002', 'mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `ta`
--

CREATE TABLE IF NOT EXISTS `ta` (
  `nim` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `abstrak` text NOT NULL,
  `path` varchar(100) NOT NULL,
  `status` varchar(8) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ta`
--

INSERT INTO `ta` (`nim`, `judul`, `tahun`, `abstrak`, `path`, `status`) VALUES
('20101010', 'Rancang Bangun Detektor Satelit', '2012', ' "After almost a decade of sending monitors to classrooms across the state to check on teachers'' articulation, the NY Times'' Marc Lacey reports that a federal investigation of possible civil rights violations has prompted Arizona to call off its accent police. The teachers who were found to have strong accents were not fired, but their school districts were required to work with them to improve their speech. Interestingly, one person''s civil rights violation is another''s ''wonderful little phenomenon'', which is how PBS described the accent neutralization classes attended by Bangalore call center workers who worked for the likes of IBM and Microsoft. On its website, IBM Daksh notes that ''To make sure that customers all over the world can understand the way our people speak, every new hire is trained in what we call voice and accent neutralization.''. So, is accent monitoring and neutralization a civil right violation, as the U.S. Depts. of Justice and Education suggest, or is it an ''innovation'', as IBM argues?"\r\n\r\n\r\nKeywords: Sistem Informasi, Pengolahan Citra Digital, Artificial Intelligent', 'androidevilplus-300x267.jpg', 'active'),
('20108009', 'Liburku', '1991', ' hfhufua097v9tvc8d8s7aodsapi', 'Desert.jpg', 'active'),
('20109001', 'Peranan android Multimedia Dalam Pembelajaran Matematika Tingkat SD', '2010', ' ''Multimedia adalah penggunaan komputer untuk menyajikan dan menggabungkan teks, suara, gambar, animasi dan video dengan alat bantu (tool) dan koneksi (link) sehingga pengguna dapat melakukan navigasi, berinteraksi, berkarya dan berkomunikasi. Multimedia sering digunakan dalam dunia hiburan. Selain dari dunia hiburan, Multimedia juga diadopsi oleh dunia game.\r\nMultimedia dimanfaatkan juga dalam dunia pendidikan dan bisnis. Di dunia pendidikan, multimedia digunakan sebagai media pengajaran, baik dalam kelas maupun secara sendiri-sendiri. Di dunia bisnis, multimedia digunakan sebagai media profil perusahaan, profil produk, bahkan sebagai media kios informasi dan pelatihan dalam sistem e-learning.\r\nPada awalnya multimedia hanya mencakup media yang menjadi konsumsi indra penglihatan (gambar diam, teks, gambar gerak video, dan gambar gerak rekaan/animasi), dan konsumsi indra pendengaran (suara). Dalam perkembangannya multimedia mencakup juga kinetik (gerak) dan bau yang merupakan konsupsi indra penciuman. Multimedia mulai memasukkan unsur kinetik sejak diaplikasikan pada pertunjukan film 3 dimensi yang digabungkan dengan gerakan pada kursi tempat duduk penonton. Kinetik dan film 3 dimensi membangkitkan sense realistis.\r\nBau mulai menjadi bagian dari multimedia sejak ditemukan teknologi reproduksi bau melalui telekomunikasi. Dengan perangkat input pendeteksi bau, seorang operator dapat mengirimkan hasil digitizing bau tersebut melalui internet. Komputer penerima harus menyediakan perangkat output berupa mesin reproduksi bau. Mesin reproduksi bau ini mencampurkan berbagai jenis bahan bau yang setelah dicampur menghasilkan output berupa bau yang mirip dengan data yang dikirim dari internet. Dengan menganalogikan dengan printer, alat ini menjadikan feromon-feromor bau sebagai pengganti tinta. Output bukan berupa cetakan melainkan aroma. Android', 'cupcake.jpg', 'active'),
('20109007', 'Penggunaan Android Blogger Sebagai Penyambung Pers', '2012', ' Pada 23 Agustus 1999, Blogger diluncurkan oleh Pyra Labs. Sebagai salah satu perangkat publikasi blog pertama di dunia, Blogger berperan dalam mempopulerkan format blog di dunia. Pada Februari 2003, Pyra Labs diakusisi oleh Google, membuat sejumlah fitur premium Blogger yang sebelumnya dikomersialkan Pyra Labs menjadi layanan yang sepenuhnya gratis. Pada Oktober 2004, salah satu pendiri Pyra Labs, Evan Williams, mengundurkan diri dari Google.\r\nPada tahun 2004, Google membeli Picasa, dan mengintegrasikannya dengan Blogger sehingga pengguna Picasa dapat mempublikasikan koleksi foto miliknya ke situs blognya.\r\nPada 9 Mei 2004, Blogger memperkenalkan beberapa perubahan besar pada sistem publikasi blognya, menambahkan fitur seperti templat yang memenuhi standar web, halaman arsip individual untuk masing-masing posting dan komentar, serta fitur posting melalui email.\r\nPada 14 Agustus 2006, Blogger meluncurkan versi terbarunya dalam tahap beta, yang diberi nama kode "Invader". Versi terbaru ini memigrasikan pengguna Blogger ke server milik Google dan menambahkan beberapa fitur baru. Pada Desember 2006, versi baru ini keluar dari tahap beta. Mei 2007, Blogger selesai memigrasikan semua data penggunanya ke server Google.', 'donut.jpg', 'inactive'),
('20109008', 'Aplikasi Android Untuk Mengatasi Kemacetan', '2010', 'Pengujian oleh Nokia Siemens Networks menunjukkan software iPhone terbaru mendukung "Network Controlled Fast Dormancy."\r\n\r\nFitur ini membuat jaringan dan handset bekerja sama menciptakan kondisi-kondisi terbaik agar ponsel cerdas dapat bekerja cepat, namun memiliki daya tahan baterai yang panjang dan mengurangi kemacetan jaringan.\r\n\r\n"Network Controlled Fast Dormancy" juga didukung oleh rilis software broadband bergerak terbaru dari Nokia Siemens Networks (RU20). Pengujian mengindikasikan bahwa kedua rilis tersebut kompatibel.\r\n\r\n"Network Controlled Fast Dormancy" sangat membantu dalam mengatasi kemacetan jaringan yang disebabkan oleh ponsel pintar. Masalahnya terletak pada besarnya pensinyalan yang dihasilkan oleh ponsel cerdas, hingga 8 kali pensinyalan laptop yang menggunakan dongle. \r\n\r\nKetika  tidak digunakan untuk beberapa saat, ponsel cerdas akan masuk ke kondisi "idle." Untuk ''membangunkan'' kembali ponsel diperlukan sekitar 30 pertukaran sinyal dengan jaringan sampai ponsel itu bisa digunakan.\r\n\r\nPensinyalan ini memerlukan waktu, hingga 2 detik. Untuk menghindari keterlambatan yang  membuat pengguna frustrasi, beberapa jaringan menjaga agar ponsel itu tetap dalam mode aktif untuk mengurangi waktu respon. \r\n\r\nNamun hal ini membuat baterai boros, sehingga produsen handset mengembangkan piranti lunak Fast Dormancy yang mengembalikan ponsel cerdas ke kondisi "idle" yang hemat baterai dengan sangat cepat.\r\n\r\nMasalahnya adalah banyak aplikasi ponsel cerdas diset untuk terkoneksi ke jaringan setiap beberapa detik, seperti untuk aplikasi email yang mengecek pesan-pesan baru. Pensinyalan meningkat ketika ponsel cerdas tersebut sering berubah dari satu kondisi ke kondisi lain dan hal ini menghabiskan kapasitas jaringan, sehingga kadang-kadang membuat ponsel lain tidak dapat melakukan panggilan.\r\n\r\nNokia Siemens Networks mengatasi masalah ini dengan pendekatan berbeda. Handset dipertahakankan dalam kondisi yang disebut Cell_PHC. Kondisi ini tidak menggunakan baterai lebih banyak dari kondisi "idle" dan hanya memerlukan antara 3 hingga 12 sinyal untuk berpindah ke kondisi aktif untuk mengirim data. Lebih sedikit sinyal berarti keterlambatan bagi pengguna dipangkas menjadi setengah detik, kemacetan jaringan dihilangkan dan baterai ponsel pintar tahan lebih lama.', 'eclair.gif', 'active'),
('20109009', 'Pembuatan Jaringan Android Untuk Mempermudah Memasak', '2011', 'Masalahnya adalah banyak aplikasi ponsel cerdas diset untuk terkoneksi ke jaringan setiap beberapa detik, seperti untuk aplikasi email yang mengecek pesan-pesan baru. Pensinyalan meningkat ketika ponsel cerdas tersebut sering berubah dari satu kondisi ke kondisi lain dan hal ini menghabiskan kapasitas jaringan, sehingga kadang-kadang membuat ponsel lain tidak dapat melakukan panggilan.\r\n\r\nNokia Siemens Networks mengatasi masalah ini dengan pendekatan berbeda. Handset dipertahakankan dalam kondisi yang disebut Cell_PHC. Kondisi ini tidak menggunakan baterai lebih banyak dari kondisi "idle" dan hanya memerlukan antara 3 hingga 12 sinyal untuk berpindah ke kondisi aktif untuk mengirim data. Lebih sedikit sinyal berarti keterlambatan bagi pengguna dipangkas menjadi setengah detik, kemacetan jaringan dihilangkan dan baterai ponsel pintar tahan lebih lama.\r\n\r\nNetwork Controlled Fast Dormancy membantu handset menggunakan Cell_PCH atau Fast Dormancy, tergantung pada jaringan, untuk memaksimalkan daya tahan baterai dan meminimalkan pensinyalan. Nokia mengimplementasikan fitur yang sama dalam ponsel cerdasnya pada Kuartal II 2010. \r\n\r\nRilis software baru dari Apple merupakan upaya besar lain yang dilakukan oleh industri untuk mengurangi trafik pensinyalan dalam jaringan, yang merupakan berita baik bagi operator. \r\n\r\nNokia Siemens Networks juga mengelola Radio Network Controllers (RNCs). RNCs mengelola koneksi dan mobilitas data, secara efisien, sehingga mengurangi kemungkinan terjadinya overload jaringan dan pengalaman pengguna yang buruk. \r\n\r\nUntuk lebih meningkatkan daya tahan baterai, Nokia Siemens Networks juga menggunakan konektivitas paket kontinyu (continuous packet connectivity/CPC) yang mematikan pemancar dan penerima sinyal ponsel cerdas dalam fase idle untuk mengurangi konsumsi daya. \r\n\r\nTeknologi Nokia Siemens Networks juga memungkinkan pengguna membuat panggilan suara dan data secara bersamaan ketika menggunakan jaringan GSM. Hal ini menghindari panggilan langsung ke voicemail ketika koneksi data aktif. Teknologi itu dilengkapi berbagai layanan dan solusi lain yang membantu membuat pengalaman menggunakan ponsel cerdas lebih baik bagi pengguna dan mengurangi biaya bagi operator.\r\n\r\nSalah satu operator di Timur Tengah mengungkapkan ponsel cerdas dalam jaringan yang dipasok oleh Nokia Siemens Networks menghasilkan daya tahan baterai 11 jam. Lebih lama dibandingkan dengan jaringan pesaing yang hanya 6 jam. \r\n\r\nSementara pengujian di Amerika Utara menunjukkan bahwa jaringan yang dipasok Nokia Siemens Networks menghasilkan pensinyalan 50% lebih sedikit.', 'froyo.png', 'active'),
('20109010', 'Pembuatan Toko Online Android Menggunakan Aplikasi Joomla', '2012', ' Secara garis besar dan gamblang, Joomla! terdiri dari 3 elemen dasar, yaitu server web (webserver), skrip PHP dan basisdata MySQL. Server web diasumsikan terhubung dengan Internet/Intranet yang berfungsi sebagai penyedia layanan situs. Skrip PHP terdiri dari kode program dalam bahasa PHP dan basisdata merupakan tempat penyimpanan konten. Joomla menggunakan Apache sebagai server web dan MySQL untuk basisdatanya.\r\nPertamakali, pengguna meminta akses terhadap halaman Joomla dengan mengeksekusi URL pada browser web yang kemudian terhubung dengan server web. Permintaan ini yang dalam istilah teknis lebih dikenal dengan query string selain terdapat URL juga mengandung parameter konten (section, category, ID article dan lain-lain). Berdasarkan parameter tersebut, sistem skrip Joomla melakukan kontak dengan basisdata dan mengambil konten yang dimaksud berdasarkan parameternya. Terakhir, konten dan templat (template) digabung bersama dan kembali sebagai halaman html, gambar, css dan javascript.\r\nPaket Joomla! terdiri dari beberapa bagian yang terpisah dan termodul yang sangat fleksibel, dapat dengan mudah dikembangkan dan diintegrasikan. Sebagai contoh "plugins" WikiBot yang memperbolehkan penulis di Joomla menggunakan "Wikitags" pada bagian artikel yang fungsinya secara otomatis membuat pranala dinamis ke artikel Wikipedia pada saat ditampilkan. Ada lebih tersedia 1,700 "plugins" yang secara resmi didelegasikan oleh OpenSourceMatters tersedia di http://extensions.joomla.org/ dan saat ini secara resmi dipindahkan ke http://joomlacode.org dengan dukungan server yang lebih lengkap.', 'gingerbread.jpg', 'active'),
('20109011', 'Hubungan android, Network dan OS', '2013', ' Jaringan wilayah lokal (bahasa Inggris: local area network biasa disingkat LAN) adalah jaringan komputer yang jaringannya hanya mencakup wilayah kecil; seperti jaringan komputer kampus, gedung, kantor, dalam rumah, sekolah atau yang lebih kecil. Saat ini, kebanyakan LAN berbasis pada teknologi IEEE 802.3 Ethernet menggunakan perangkat switch, yang mempunyai kecepatan transfer data 10, 100, atau 1000 Mbit/s. Selain teknologi Ethernet, saat ini teknologi 802.11b (atau biasa disebut Wi-fi) juga sering digunakan untuk membentuk LAN. Tempat-tempat yang menyediakan koneksi LAN dengan teknologi Wi-fi biasa disebut hotspot.\r\nPada sebuah LAN, setiap node atau komputer mempunyai daya komputasi sendiri, berbeda dengan konsep dump terminal. Setiap komputer juga dapat mengakses sumber daya yang ada di LAN sesuai dengan hak akses yang telah diatur. Sumber daya tersebut dapat berupa data atau perangkat seperti printer. Pada LAN, seorang pengguna juga dapat berkomunikasi dengan pengguna yang lain dengan menggunakan aplikasi yang sesuai.', 'gladosiri.jpg', 'active'),
('20109019', 'Logistik Android Militer dan Aplikasinya dalam Bisnis IT', '2009', ' Dalam ilmu militer, menjaga agar jalur suplai sambil mengganggu jalur musuh amatlah krusial ? Napoleon bahkan mengatakan logistik adalah faktor terpenting ? dalam strategi militer, karena sebuah angkatan bersenjata tanpa sumber daya dan transportasi itu tidak berdaya. Kekalahan Inggris di Perang Kemerdekaan Amerika dan kekalahan Poros di medan Afrika Perang Dunia II semua disebabkan oleh kegagalan logistik. Pemimpin bersejarah speerti Hannibal Barca, Alexander the Great, dan Duke Wellington dianggap sebagai jenius dalam logistik.\r\nILS Integrated Logistics Support adalah disiplin yang digunakan oleh tentara/militer untuk memastikan sistem pendukung yang kuat dengan layanan perbekalan (logistik) konsep pemikirannya adalah biaya terendah dan sesuai dengan kebutuhan, handal, persediaan yang mencukupi, maintainability dan lain-lain sebagai persyaratan yang ditetapkan untuk itu.\r\nDalam logistik militer, perwira logistik mengatur bagaimana dan kapan memindahkan sumber daya ke tempat dimana mereka dibutuhkan. Manajemen rantai suplai di logistik militer biasanya bersinggungan dengan variabel-variabel tertentu untuk memprediksi biaya, penurunan kualitas, konsumsi dan permintaan masa depan. Pengelompokan kategori AD AS yaitu klasifikasi suplai dikembangkan sedemikian rupa sehingga suplai dengan kategori konsumsi yang mirip dikelompokan menjadi grup-grup tersendiri untuk kegunaan perencanaan lebih lanjut. Contohnya, konsumsi pada masa damai untuk amunisi dan bahan bakar akan lebih sedikit dibandingkan pada masa peperangan, dimana suplai lainya seperti makanan dan baju memiliki rasio konsumsi yang konstan tanpa menghiraukan perang maupun damai. Pasukan akan selalu membutuhkan seragam dan makanan, lebih banyak pasukan berarti kebutuhan makanan dan seragam akan lebih banyak.', 'honeycomb.jpg ', 'active'),
('20109026', 'Iphone, android dan Implikasinya Pada Dunia Komunikasi', '2007', ' iPhone adalah telepon genggam revolusioner yang diproduksi oleh Apple Inc. yang memiliki fungsi kamera, pemutar multimedia, SMS, dan voicemail.\r\nSelain itu telepon ini juga dapat dihubungkan dengan jaringan internet, untuk melakukan berbagai aktivitas misalnya mengirim/menerima email, menjelajah web, dan lain-lain. Antarmuka dengan pengguna menggunakan layar sentuh multi-touch (atau bisa juga disebut dengan layar sentuh kapasitif) dengan papan ketik virtual dan tombol.\r\nKamera yang terpasang memiliki resolusi 2 megapixel untuk generasi iPhone pertama dan iPhone 3G, dan 3,2 megapixel untuk iPhone 3GS. Namun, iPhone generasi pertama dan 3G tidak dapat merekam video. Tetapi dengan bantuan pihak ketiga yang banyak membuat aplikasi, hampir semua kekurangan tadi dapat diatasi. Selain itu telepon ini juga memiliki perangkat lunak yang dapat mengunggah foto. iPhone dapat memainkan video, sehingga pengguna dapat menonton televisi atau film. iPhone memiliki lebih dari 425 ribu aplikasi yang dijual di iTunes di computer, maupun di Apps Store langsung di iPhone. Para pengguna iPhone bahkan dapat langsung membeli dan mengunduh aplikasi yang dijual di Apps Store, asalkan tidak melebihi 10MB. Sistem operasi iPhone adalah versi ringan Mac OS X tanpa berbagai komponen yang tidak diperlukan. Sistem operasi ini memakan ruang kurang lebih sebanyak 250MB. Sistem operasi dapat diupdate berkala melalui iTunes secara gratis.', 'icecreamsandwich.png', 'active'),
('20109027', 'Pembangunan android Web Aplikasi Menggunakan Keunggulan Servlet', '2008', 'Servlet adalah kelas bahasa pemrograman Java digunakan untuk memperluas kemampuan server yang diakses melalui aplikasi host model pemrograman request-respon. Meskipun servlet dapat menanggapi setiap jenis permintaan, mereka umumnya digunakan untuk memperluas aplikasi host oleh server Web. Dengan demikian, dapat dianggap sebagai Java Applet yang berjalan pada server bukan browser [1]. \r\nServlet adalah kelas Java dalam Java EE yang sesuai dengan Java Servlet API, sebuah protokol di mana kelas Java mungkin merespon permintaan. Mereka tidak terikat pada sebuah protokol client-server tertentu, tetapi yang paling sering digunakan dengan protokol HTTP. Oleh karena itu, kata "Servlet" sering digunakan dalam arti "HTTP Servlet" [2] Dengan demikian, seorang pengembang perangkat lunak dapat menggunakan servlet untuk menambahkan konten dinamis ke server Web menggunakan platform Java.. Konten yang dihasilkan umumnya HTML, tetapi mungkin data lain seperti XML. Servlets adalah mitra Java untuk non-teknologi Java konten web yang dinamis seperti CGI dan ASP.NET. Servlets dapat mempertahankan negara dalam variabel sesi transaksi di banyak server dengan menggunakan HTTP cookie, atau URL menulis ulang. \r\nUntuk menyebarkan dan menjalankan Servlet, wadah Web harus digunakan. Sebuah kontainer Web dasarnya komponen dari sebuah Web server yang berinteraksi dengan servlet. Wadah Web bertanggung jawab untuk mengelola siklus hidup servlet, pemetaan URL ke servlet tertentu dan memastikan bahwa URL pemohon memiliki hak akses yang benar. \r\nAPI servlet, yang terkandung dalam hierarki javax.servlet paket Java, mendefinisikan interaksi yang diharapkan dari wadah Web dan servlet. [2] \r\nServlet adalah sebuah objek yang menerima permintaan dan menghasilkan respon yang didasarkan pada permintaan itu. Paket servlet mendefinisikan dasar untuk mewakili objek Java servlet permintaan dan tanggapan, serta benda-benda untuk mencerminkan konfigurasi servlet parameter dan lingkungan eksekusi. Paket javax.servlet.http HTTP mendefinisikan spesifik subclass dari elemen servlet generik, termasuk objek manajemen sesi yang melacak beberapa permintaan dan respon antara server Web dan klien. Servlets dapat dikemas dalam file WAR sebagai aplikasi Web.', 'mac_picasso_logo.gif', 'active'),
('20109028', 'Menghitung android Kecepatan Pembangunan Sebuah Negri Menggunakan Statistika dan Java Programming', '2009', ' Penggunaan istilah statistika berakar dari istilah istilah dalam bahasa latin modern statisticum collegium ("dewan negara") dan bahasa Italia statista ("negarawan" atau "politikus").\r\nGottfried Achenwall (1749) menggunakan Statistik dalam bahasa Jerman untuk pertama kalinya sebagai nama bagi kegiatan analisis data kenegaraan, dengan mengartikannya sebagai "ilmu tentang negara (state)". Pada awal abad ke-19 telah terjadi pergeseran arti menjadi "ilmu mengenai pengumpulan dan klasifikasi data". Sir John Sinclair memperkenalkan nama (Statistics) dan pengertian ini ke dalam bahasa Inggris. Jadi, statistika secara prinsip mula-mula hanya mengurus data yang dipakai lembaga-lembaga administratif dan pemerintahan. Pengumpulan data terus berlanjut, khususnya melalui sensus yang dilakukan secara teratur untuk memberi informasi kependudukan yang berubah setiap saat.\r\nPada abad ke-19 dan awal abad ke-20 statistika mulai banyak menggunakan bidang-bidang dalam matematika, terutama peluang. Cabang statistika yang pada saat ini sangat luas digunakan untuk mendukung metode ilmiah, statistika inferensi, dikembangkan pada paruh kedua abad ke-19 dan awal abad ke-20 oleh Ronald Fisher (peletak dasar statistika inferensi), Karl Pearson (metode regresi linear), dan William Sealey Gosset (meneliti problem sampel berukuran kecil). Penggunaan statistika pada masa sekarang dapat dikatakan telah menyentuh semua bidang ilmu pengetahuan, mulai dari astronomi hingga linguistika. Bidang-bidang ekonomi, biologi dan cabang-cabang terapannya, serta psikologi banyak dipengaruhi oleh statistika dalam metodologinya. Akibatnya lahirlah ilmu-ilmu gabungan seperti ekonometrika, biometrika (atau biostatistika), dan psikometrika.\r\nMeskipun ada pihak yang menganggap statistika sebagai cabang dari matematika, tetapi sebagian pihak lainnya menganggap statistika sebagai bidang yang banyak terkait dengan matematika melihat dari sejarah dan aplikasinya. Di Indonesia, kajian statistika sebagian besar masuk dalam fakultas matematika dan ilmu pengetahuan alam, baik di dalam departemen tersendiri maupun tergabung dengan matematika.', 'podfather_small.png', 'active'),
('20109030', 'Pemanfaatan Sistem androiD Game Online Dalam Pembelajaran Siswa TK', '2006', ' Permainan daring mulai muncul di Indonesia pada tahun 2001, dengan diluncurkannya Nexia Online, sebuah permainan RPG keluaran BolehGame dengan grafik sederhana berbasis 2D.[4] Nexia hanya membutuhkan spesifikasi komputer yang cukup kecil, bahkan bisa dimainkan di Pentium 2 dengan minimal grafik 3D. Permainan keluaran Korea ini berhasil memperkenalkan bermain game dan chat pertama di Indonesia. Sayangnya, permainan ini ditutup pada tahun 2004 karena lisensi yang tidak diperpanjang. Semenjak itu, dunia permainan daring di Indonesia semakin berkembang dengan masuknya beberapa provider game baru, seperti Redmoon (2002), Laghaim pada awal 2003, Ragnarok Online (RO) pada pertengahan 2003, dan Gunbound pada tahun 2004.\r\nRagnarok Online (RO) merupakan salah satu permainan daring yang menghebohkan di ranah dunia permainan daring Indonesia. Permainan yang keluar pada bulan Mei tahun 2003 ini, memang telah dinantikan kedatangannya dengan penuh antusiasme dari banyak gamer, dan telah lebih dulu mem-booming di ranah mancanegara. Permainan ini langsung diserbu oleh banyak orang dan berhasil membuat permainan daring mencapai titik puncak penggunaan hingga sempat membuat koneksi internet Indonesia kacau karena bandwidth yang tersedia pada saat itu belum memadai.[5]\r\nSementara permainan GunBound merupakan permainan daring bergenre action pertama di Indonesia dan merupakan permainan daring pertama yang menganut sistem Item Mall, di mana pemain dapat membeli item atau avatar untuk menghias karakter mereka dalam permainan tersebut. Pembelian item melalui voucher yang diterbitkan oleh BolehGame. Permainan ini juga merupakan permainan daring yang bersifat gratis pertama di Indonesia, di mana pemain tidak harus membayar atau membeli voucher untuk memainkannya (kecuali untuk membeli item tambahan).\r\nSeiring dengan meningkatnya kuantitas pemain permainan daring di Indonesia, tidak mengherankan jika komunitas maya akibat permainan daring pun cukup menjamur. Biasanya komunitas ini terbentuk karena sering berinteraksi dalam sebuah permainan, dan kemudian bermain bersama. Selain bertemu di ranah virtual, suatu komunitas biasanya melakukan gathering atau pertemuan anggota pada waktu-waktu tertentu.', 'machine.png', 'active'),
('20109038', 'Aplikasi IT AndroiD Dalam Hubungannya Dengan Manajemen Rantai Suplai Pada Bisnis Kopi Luwak', '2009', 'Manajemen Rantai Suplai (Supply chain management) adalah sebuah ?proses payung? di mana produk diciptakan dan disampaikan kepada konsumen dari sudut struktural. Sebuah supply chain (rantai suplai) merujuk kepada jaringan yang rumit dari hubungan yang mempertahankan organisasi dengan rekan bisnisnya untuk mendapatkan sumber produksi dalam menyampaikan kepada konsumen. (Kalakota, 2000, h197)\r\nTujuan yang hendak dicapai dari setiap rantai suplai adalah untuk memaksimalkan nilai yang dihasilkan secara keseluruhan (Chopra, 2001, h5). Rantai suplai yang terintegrasi akan meningkatkan keseluruhan nilai yang dihasilkan oleh rantai suplai tersebut.\r\nManajemen rantai suplai ialah pendekatan antar-fungsi (cross functional) untuk mengatur pergerakan material mentah kedalam sebuah organisasi dan pergerakan dari barang jadi keluar organisasi menuju konsumen akhir. Sebagaimana korporasi lebih fokus dalam kompetensi inti dan lebih fleksibel, mereka harus mengurangi kepemilikan mereka atas sumber material mentah dan kanal distribusi. Fungsi ini meningkat menjadi kekurangan sumber ke perusahaan lain yang terlibat dalam memuaskan permintaan konsumen, sementara mengurangi kontrol manajemen dari logistik harian. Pengendalian lebih sedikit dan partner rantai suplai menuju ke pembuatan konsep rantai suplai. Tujuan dari manajemen rantai suplai ialah meningkatkan ke[percayaan dan kolaborasi di antara rekanan rantai suplai, dan meningkatkan inventaris dalam kejelasannya dan meningkatkan percepatan inventori.\r\nSecara garis besar, fungsi manajemen ini bisa dibagi tiga, yaitu distribusi, jejaring dan perencaan kapasitas, dan pengembangan rantai suplai.[1]\r\nbeberapa model telah diajukan untuk memahami aktivitas yang dibutuhkan untuk mengatur pergerakan material di organisasi dan batasan fungsional. SCOR adalah model manajemen rantai suplai yang dipromosikan oleh Majelis Manajemen Rantai Suplai. Model lain ialah SCM yang diajukan oleh Global Supply Chain Forum (GSCF). Aktivitas suplai rantai bisa dikelompokan ke tingkat strategi, taktis, dan operasional.', 'replacement.gif', 'active'),
('20109039', 'Pembuatan Database MySQL Menggunakan Linux', '2011', ' MySQL atau PostgreSQL adalah keputusan sulit yang banyak orang harus ambil ketika memilih database relasional sistem manajemen yang bersifat open source. Keduanya telah terbukti sebagai solusi yang bersaing sangat ketat dengan software database proprietary. MySQL telah lama dianggap lebih cepat tetapi memiliki fitur yang kurang lengkap, sedangkan PostgreSQL diasumsikan menjadi sistem database yang lebih padat fitur sering digambarkan sebagai versi open source dari Oracle. MySQL telah populer di antara berbagai proyek perangkat lunak karena kecepatan dan kemudahan penggunaan, sementara PostgreSQL mengikuti tidak jauh dibelakang dengan pengembang yang datang dari latar belakang Oracle atau SQL Server.\r\n\r\nAsumsi-asumsi ini, kebanyakan telah usang dan tidak benar. MySQL telah menambahkan berbagai fungsionalitas canggih sementara PostgreSQL secara dramatis meningkatkan kecepatan dalam rilis besar terakhir. Namun, banyak yang tidak menyadari konvergensi dan masih berpegang pada stereotip berbasis pada MySQL 4.1 dan PostgreSQL 7.4. Versi saat ini adalah MySQL 5.6 dan PostgreSQL 9.1.\r\nPostgreSQL dan MySQL memiliki jajaran fitur yang meningkatkan integritas data, fungsi, dan kinerja. Fitur yang termasuk dalam database dapat membantu meningkatkan kinerja, kemudahan penggunaan, fungsionalitas atau stabilitas. \r\n\r\nMySQL mendukung ''INSERT IGNORE'' dan ''REPLACE'' pernyataan yang menyisipkan sebuah baris jika tidak ada data yang sama dan mengabaikan jika data yang sama telah ada. Sedangkan ''REPLACE'' menggantikan baris yang ada saat ini.\r\n\r\nSaat ini PostgreSQL tidak mendukung kedua pernyataan ini. \r\n\r\nSebuah fitur yang serupa MySQL INSERT ... ON UPDATE juga tidak ada di PostgreSQL.\r\n\r\nPostgreSQL akan menampilkan klausul MERGE dalam versi masa depan [5], kemungkinan besar di 9.1, yang mengikuti SQL: 2008 standar. Hal ini dapat melakukan hal yang sama seperti non-standar MySQL ''INSERT IGNORE'', ''REPLACE'' dan ''INSERT ...ON DUPLICATE UPDATE ''. \r\n\r\nPostgreSQL dan MySQL mendukung Not-Null, unique, Primary key. Foreign Key juga didukung oleh PostgreSQL dan MySQL InnoDB engine, namun tidak engine yang lain. Namun MySQL mengabaikan constrain ''CHECK'' yang telah didukung oleh PostgreSQL dalam waktu yang lama. ', 'idea.png', 'active'),
('20109040', 'Panduan Memilih Database Management System Yang Baik', '2007', ' MySQL memicu juga tidak diaktifkan oleh cascading update dan menghapus bahkan ketika disebabkan oleh pernyataan SQL (ini adalah terhadap standar), karena mereka adalah sebuah fitur dari mesin InnoDB daripada database sebagai keseluruhan. Dalam kasus ini, MySQL diam-diam mengabaikan memicu tanpa mengeluarkan peringatan (yaitu di lain dbms itu Anda harus ekstra hati-hati untuk tidak pop memicu sengaja, di MySQL Anda harus ekstra hati-hati bahwa banyak dari pernyataan Anda tidak akan mengaktifkan pemicu, seperti cascades , dll).\r\n\r\nPostgreSQL juga mendukung "aturan," yang memungkinkan operasi pada pohon sintaks query, dan dapat melakukan beberapa operasi lebih sederhana yang secara tradisional dilakukan oleh pemicu.\r\n\r\nSintaks untuk definisi pemicu di PostgreSQL tidak sesederhana di MySQL. PostgreSQL membutuhkan definisi terpisah dari fungsi dengan tipe data tertentu dikembalikan (ini adalah perilaku umum dari PostgreSQL = lebih ketat vs MySQL = kurang ketat Sintaks itu sendiri. Sebagai langsung tetapi pelaksanaannya yang ketat dan jauh lebih kuat (setiap fungsi pengguna) , sehingga agak sulit untuk belajar).\r\n\r\nMySQL TIDAK mendukung memicu beberapa dari jenis yang sama (yaitu maksimum satu ON UPDATE SEBELUM dan SETELAH UPDATE ON salah satu pemicu) di meja yang sama, sedangkan PostgreSQL tidak (Jika memicu beberapa dari jenis yang sama didefinisikan untuk acara yang sama, mereka akan dipecat dalam urutan abjad nama> dari manual)..\r\n\r\nPostgreSQL, pada 9,1, mendukung PEMICU pada pandangan, MySQL tidak. \r\n\r\nBaik MySQL dan PostgreSQL subqueries dukungan. Dukungan untuk mereka adalah lebih baru di MySQL dan kinerja yang masih baik untuk beberapa jenis dari subquery yang mungkin telah dioptimalkan dalam PostgreSQL. Hal ini juga harus dicatat bahwa MySQL tidak memungkinkan untuk subquery dalam tampilan. Fitur ini telah dihapus setelah 4,1 dan pada 5,5 itu masih tidak tersedia. Workarounds termasuk pandangan bersarang, bergabung dan hacking kode sumber.\r\nNamun, itu harus sangat jelas bahwa masih banyak subqueries dasar dengan masalah optimasi utama dalam versi MySQL saat ini (5.5.x), yang HARUS bekerja di sekitar ..\r\nJuga, hati-hati sebagai cara "TIDAK DI" bekerja adalah tidak sama di DBMS (yaitu Anda perlu memeriksa nilai null dalam / luar di mysql, mereka terintegrasi dalam postgresql, dll). ', 'original_apple_logo.gif', 'active'),
('20109080', 'Sepak Bola Yang Dimainkan Oleh Robot Pintar', '2002', 'Banyak pihak menunjuk Wim Rijsbergen sebagai biang keladi terpuruknya timnas Indonesia di Kualifikasi Piala Dunia 2014. Tapi menurut Bambang Pamungkas, kesalahan tak cuma milik Wim namun merupakan tanggung jawab semua pihak.\r\n\r\nDirektur olahraga AS Roma Walter Sabatini memastikan pihaknya akan terjun di bursa transfer paruh kedua Januari nanti atas permintaan pelatih Luis Enrique.Roma masih kesulitan menembus ke papan atas Serie A pada awal musim ini. I Giallorossi\r\n\r\nIndonesia berhasil memastikan tiket ke semifinal cabang sepakbola SEA Gamas XXVI setelah menekuk sembilan pemain Thailand 3-1 di Stadion Gelora Bung Karno, Minggu (13/11).Kemenangan ini membuat pasukan Rahmad Darmawan mengemas poin sempurna dari tiga.', 'unix.jpg', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `t_log`
--

CREATE TABLE IF NOT EXISTS `t_log` (
  `log_date` varchar(24) NOT NULL,
  `log_level` varchar(5) NOT NULL,
  `log_location` varchar(64) NOT NULL,
  `log_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_log`
--

INSERT INTO `t_log` (`log_date`, `log_level`, `log_location`, `log_message`) VALUES
('2011-11-03 16:02:39,013', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-03 16:03:00,848', 'TRACE', 'sita.controller.login;84', 'Username 20109008 try to login'),
('2011-11-03 16:03:00,966', 'TRACE', 'sita.controller.login;99', 'Username 20109008 fail to login'),
('2011-11-03 16:03:20,711', 'TRACE', 'sita.controller.login;84', 'Username 20109008 try to login'),
('2011-11-03 16:03:20,786', 'TRACE', 'sita.controller.login;88', 'Username 20109008 success to login'),
('2011-11-03 16:03:40,453', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-03 16:04:14,183', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 20109050 try to create account'),
('2011-11-03 16:04:14,393', 'TRACE', 'sita.controller.createAccount;87', 'Guest with nim 20109050 success to create account'),
('2011-11-03 16:04:50,548', 'TRACE', 'sita.controller.login;84', 'Username 20109050 try to login'),
('2011-11-03 16:04:50,623', 'TRACE', 'sita.controller.login;88', 'Username 20109050 success to login'),
('2011-11-03 16:04:55,196', 'TRACE', 'sita.controller.logout;64', 'Username 20109050 logout'),
('2011-11-03 16:05:59,026', 'TRACE', 'sita.controller.login;84', 'Username 20109008 try to login'),
('2011-11-03 16:05:59,093', 'TRACE', 'sita.controller.login;88', 'Username 20109008 success to login'),
('2011-11-03 16:06:07,303', 'TRACE', 'sita.controller.changePassword;82', 'User 20109008 try to change password'),
('2011-11-03 16:06:07,473', 'TRACE', 'sita.controller.changePassword;87', 'User 20109008 sucess to change password'),
('2011-11-03 16:06:20,913', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-03 21:06:02,101', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 21:06:02,894', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 21:07:03,284', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 21:07:03,439', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 21:15:41,209', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-03 21:15:58,294', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-03 21:15:58,361', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-03 21:16:03,546', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-03 21:19:22,883', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 21:19:22,960', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 21:19:25,971', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-03 21:19:33,881', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-03 21:19:33,951', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-03 21:19:50,612', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-03 21:28:04,297', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 21:28:04,354', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 21:31:13,302', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-03 21:31:20,425', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 21:31:20,554', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 21:33:26,767', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 21:33:26,909', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 21:58:21,123', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-03 21:58:33,912', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-03 21:58:34,047', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-03 21:58:53,851', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-03 22:00:08,806', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 22:00:08,951', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 22:00:19,855', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-03 22:00:25,740', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-03 22:00:25,810', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-03 22:00:34,371', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-03 22:05:14,523', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-03 22:05:14,592', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-03 22:49:23,054', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 22:49:23,193', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 22:52:45,831', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 22:52:45,988', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 23:10:58,039', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-03 23:11:07,772', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 23:11:07,849', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 23:11:23,509', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-03 23:11:31,490', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 23:11:31,562', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 23:13:17,558', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-03 23:13:25,210', 'TRACE', 'sita.controller.login;83', 'Username 20109041 try to login'),
('2011-11-03 23:13:25,278', 'TRACE', 'sita.controller.login;107', 'Username 20109041 fail to login'),
('2011-11-03 23:13:30,559', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-03 23:13:30,617', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-03 23:13:39,188', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-03 23:13:45,505', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 23:13:45,578', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 23:16:04,349', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 23:16:04,420', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 23:16:19,479', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 23:16:19,575', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-03 23:16:21,930', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-03 23:16:29,639', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-03 23:16:29,774', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-04 10:09:33,729', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-04 10:09:34,437', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-04 10:13:15,972', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-04 10:15:53,702', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-04 10:15:53,909', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-04 11:49:55,259', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-04 11:50:06,552', 'TRACE', 'sita.controller.login;83', 'Username 20109009 try to login'),
('2011-11-04 11:50:06,624', 'TRACE', 'sita.controller.login;107', 'Username 20109009 fail to login'),
('2011-11-04 11:58:58,637', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-04 11:58:58,819', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-04 11:59:51,272', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-04 12:11:54,819', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-04 12:11:54,897', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-04 12:13:43,589', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-04 12:13:51,299', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-04 12:13:51,359', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-04 12:14:08,642', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-04 12:15:24,902', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-04 12:15:24,967', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-04 12:15:35,604', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-04 12:15:45,859', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-04 12:15:45,924', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-04 12:20:41,799', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-04 12:23:32,952', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-04 12:23:33,014', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-04 12:23:43,327', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-04 12:48:40,642', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-04 12:48:40,712', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-09 21:27:53,586', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-09 21:27:53,859', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-09 21:40:33,784', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-09 21:40:41,753', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-09 21:40:41,896', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-09 22:12:39,431', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-09 22:14:28,115', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-09 22:14:28,365', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-10 19:55:56,420', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-10 19:55:57,243', 'TRACE', 'sita.controller.login;109', 'Username admin fail to login'),
('2011-11-10 19:56:02,867', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-10 19:56:02,970', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-10 20:24:28,218', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-10 20:24:40,286', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guesttry to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:27:01,536', 'TRACE', 'sita.filter.AdminFilter;128', 'username guestsuccess to accesshttp://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:33:25,580', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guesttry to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:33:25,824', 'TRACE', 'sita.filter.AdminFilter;131', 'username guestsuccess to accesshttp://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:34:09,586', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guesttry to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:34:09,772', 'TRACE', 'sita.filter.AdminFilter;131', 'username guestfail to accesshttp://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:36:29,619', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-10 20:36:29,791', 'TRACE', 'sita.filter.AdminFilter;131', 'username guest fail to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-10 20:39:06,814', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-10 20:39:06,896', 'TRACE', 'sita.filter.AdminFilter;131', 'username guest fail to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-10 20:39:41,578', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-10 20:39:41,783', 'TRACE', 'sita.filter.AdminFilter;131', 'username guest fail to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-10 20:40:02,544', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:40:02,918', 'TRACE', 'sita.filter.AdminFilter;131', 'username guest fail to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:40:11,302', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-10 20:40:11,428', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-10 20:40:24,778', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:40:24,848', 'TRACE', 'sita.filter.AdminFilter;131', 'username guest fail to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:40:34,980', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-10 20:40:35,175', 'TRACE', 'sita.filter.AdminFilter;131', 'username guest fail to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-10 20:40:42,192', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-10 20:40:42,284', 'TRACE', 'sita.filter.AdminFilter;131', 'username guest fail to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-10 20:40:46,333', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-10 20:40:46,410', 'TRACE', 'sita.filter.AdminFilter;131', 'username guest fail to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-10 20:40:52,335', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-10 20:41:03,232', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-10 20:41:03,314', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-10 20:41:19,815', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:41:19,897', 'TRACE', 'sita.filter.AdminFilter;137', 'username guest success to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 20:41:26,328', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-10 20:41:26,396', 'TRACE', 'sita.filter.AdminFilter;137', 'username guest success to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-10 20:41:43,160', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-10 20:41:43,262', 'TRACE', 'sita.filter.AdminFilter;137', 'username guest success to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-10 20:41:55,475', 'TRACE', 'sita.filter.AdminFilter;122', 'Username guest try to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-10 20:41:55,540', 'TRACE', 'sita.filter.AdminFilter;137', 'username guest success to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-10 21:13:55,852', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-10 21:13:55,923', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-10 21:50:11,859', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-10 21:50:23,281', 'TRACE', 'sita.filter.AdminFilter;124', 'Username guest try to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 21:50:23,406', 'TRACE', 'sita.filter.AdminFilter;133', 'username guest fail to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-10 21:50:32,036', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-10 21:50:32,219', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-14 20:18:27,226', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-14 20:18:27,571', 'TRACE', 'sita.filter.AdminFilter;139', 'Username guest fail to access http://localhost:8081/SITA/adminHome.jsp'),
('2011-11-14 20:19:12,274', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:19:12,348', 'TRACE', 'sita.filter.AdminFilter;139', 'Username guest fail to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:20:12,333', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:20:12,515', 'TRACE', 'sita.filter.AdminFilter;139', 'Username guest fail to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:20:32,268', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-14 20:20:32,332', 'TRACE', 'sita.filter.AdminFilter;139', 'Username guest fail to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-14 20:20:42,883', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-14 20:20:42,946', 'TRACE', 'sita.filter.AdminFilter;139', 'Username guest fail to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-14 20:20:51,678', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-14 20:20:51,752', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-14 20:21:00,018', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:21:00,080', 'TRACE', 'sita.filter.AdminFilter;145', 'Username guest success to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:21:31,844', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:21:31,902', 'TRACE', 'sita.filter.AdminFilter;145', 'Username guest success to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:21:41,893', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-14 20:21:42,058', 'TRACE', 'sita.filter.AdminFilter;145', 'Username guest success to access http://localhost:8081/SITA/manageTA.jsp'),
('2011-11-14 20:21:53,459', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-14 20:21:53,534', 'TRACE', 'sita.filter.AdminFilter;145', 'Username guest success to access http://localhost:8081/SITA/showLog.jsp'),
('2011-11-14 20:24:31,226', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:24:31,441', 'TRACE', 'sita.filter.AdminFilter;139', 'Username guest fail to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:24:58,264', 'TRACE', 'sita.controller.login;83', 'Username 20109041 try to login'),
('2011-11-14 20:24:58,359', 'TRACE', 'sita.controller.login;109', 'Username 20109041 fail to login'),
('2011-11-14 20:25:04,265', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:25:04,349', 'TRACE', 'sita.filter.AdminFilter;139', 'Username guest fail to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:26:15,285', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:26:15,442', 'TRACE', 'sita.filter.AdminFilter;141', 'Username guest fail to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:26:29,014', 'TRACE', 'sita.controller.login;83', 'Username 20109042 try to login'),
('2011-11-14 20:26:29,096', 'TRACE', 'sita.controller.login;109', 'Username 20109042 fail to login'),
('2011-11-14 20:26:39,650', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-14 20:26:39,725', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-14 20:26:45,669', 'TRACE', 'sita.filter.AdminFilter;130', 'Username guest try to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:26:45,738', 'TRACE', 'sita.filter.AdminFilter;147', 'Username guest success to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:31:10,906', 'TRACE', 'sita.filter.AdminFilter;129', 'Username guest try to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:31:11,038', 'TRACE', 'sita.filter.AdminFilter;140', 'Username guest fail to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:41:41,674', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-14 20:41:48,378', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-14 20:41:48,548', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-14 20:41:51,447', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-14 20:42:01,464', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-14 20:42:01,533', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-14 20:42:36,308', 'TRACE', 'sita.filter.AdminFilter;129', 'Username guest try to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:42:36,357', 'TRACE', 'sita.filter.AdminFilter;148', 'Username guest success to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:48:06,749', 'TRACE', 'sita.filter.AdminFilter;129', 'Username guest try to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:48:06,941', 'TRACE', 'sita.filter.AdminFilter;142', 'Username guest fail to access http://localhost:8081/SITA/manageUser.jsp'),
('2011-11-14 20:48:25,256', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-14 20:48:30,266', 'TRACE', 'sita.filter.AdminFilter;129', 'Username guest try to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:48:30,335', 'TRACE', 'sita.filter.AdminFilter;142', 'Username guest fail to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-14 20:49:50,507', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-14 20:49:50,703', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-14 20:49:54,133', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-14 20:55:52,400', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 20109090 try to create account'),
('2011-11-14 20:55:52,587', 'TRACE', 'sita.controller.createAccount;93', 'Guest with nim 20109090 fail to create account'),
('2011-11-14 21:00:10,471', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 20109090 try to create account'),
('2011-11-14 21:00:10,634', 'TRACE', 'sita.controller.createAccount;93', 'Guest with nim 20109090 fail to create account'),
('2011-11-14 21:00:53,227', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 20109080 try to create account'),
('2011-11-14 21:00:53,419', 'TRACE', 'sita.controller.createAccount;87', 'Guest with nim 20109080 success to create account'),
('2011-11-14 21:02:30,222', 'TRACE', 'sita.controller.login;83', 'Username 20109080 try to login'),
('2011-11-14 21:02:30,314', 'TRACE', 'sita.controller.login;89', 'Username 20109080 success to login'),
('2011-11-14 21:05:34,738', 'TRACE', 'sita.controller.RegisterTA;95', 'Username 20109080 try to register TA'),
('2011-11-14 21:05:34,819', 'TRACE', 'sita.controller.RegisterTA;107', 'Username 20109080 fail to register TA'),
('2011-11-14 21:08:12,586', 'TRACE', 'sita.controller.RegisterTA;95', 'Username 20109080 try to register TA'),
('2011-11-14 21:08:12,983', 'TRACE', 'sita.controller.RegisterTA;101', 'Username 20109080 success to register TA'),
('2011-11-15 13:48:03,129', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-15 13:48:03,281', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-15 13:48:30,289', 'TRACE', 'sita.filter.AdminFilter;129', 'Username guest try to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-15 13:48:30,421', 'TRACE', 'sita.filter.AdminFilter;142', 'Username guest fail to access http://localhost:8081/SITA/registerTA.jsp'),
('2011-11-15 13:48:39,876', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-15 19:22:40,098', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 1111111111111111111 try to create account'),
('2011-11-15 19:22:40,311', 'TRACE', 'sita.controller.createAccount;93', 'Guest with nim 1111111111111111111 fail to create account'),
('2011-11-15 19:30:05,736', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 30000000000000000000 try to create account'),
('2011-11-15 19:31:10,233', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 30000000000000000000 try to create account'),
('2011-11-15 19:31:50,433', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 222222222222222222222222 try to create account'),
('2011-11-15 19:33:15,608', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 222222222222222222 try to create account'),
('2011-11-15 19:33:44,313', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 222222222222222222 try to create account'),
('2011-11-15 19:34:21,073', 'TRACE', 'sita.controller.createAccount;81', 'Guest with nim 2222222222222222 try to create account'),
('2011-11-15 19:37:25,903', 'TRACE', 'sita.controller.createAccount;39', 'Guest with nim 11111111111111111111111111 try to create account'),
('2011-11-15 19:37:26,006', 'TRACE', 'sita.controller.createAccount;58', 'Guest with nim 11111111111111111111111111 fail to create account'),
('2011-11-15 20:14:36,621', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-15 20:14:36,766', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-15 21:06:00,831', 'TRACE', 'sita.controller.createAccount;41', 'Guest with nim  2001000100010  try to create account'),
('2011-11-15 21:06:00,938', 'TRACE', 'sita.controller.createAccount;60', 'Guest with nim  2001000100010  fail to create account'),
('2011-11-15 21:09:10,876', 'TRACE', 'sita.controller.login;83', 'Username 20109010 try to login'),
('2011-11-15 21:09:11,031', 'TRACE', 'sita.controller.login;89', 'Username 20109010 success to login'),
('2011-11-15 21:09:19,058', 'TRACE', 'sita.controller.logout;64', 'Username 20109010 logout'),
('2011-11-15 21:09:27,311', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-15 21:09:27,373', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-15 21:11:46,496', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-15 21:14:04,321', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-15 21:14:04,391', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-15 21:14:14,133', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-15 21:19:31,198', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-15 21:19:31,263', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-15 21:19:38,778', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-15 21:19:46,688', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-15 21:19:46,751', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-15 21:19:58,441', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-15 21:23:05,133', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-15 21:23:05,208', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-15 21:26:45,086', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-15 21:28:58,138', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-15 21:28:58,226', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-15 21:29:19,938', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-16 18:56:50,930', 'TRACE', 'sita.controller.createAccount;40', 'Guest with nim 20109088 try to create account'),
('2011-11-16 18:56:51,917', 'TRACE', 'sita.controller.createAccount;46', 'Guest with nim 20109088 success to create account'),
('2011-11-16 18:57:02,162', 'TRACE', 'sita.controller.login;83', 'Username 20109088 try to login'),
('2011-11-16 18:57:02,242', 'TRACE', 'sita.controller.login;89', 'Username 20109088 success to login'),
('2011-11-16 18:57:45,005', 'TRACE', 'sita.controller.RegisterTA;60', 'Username 20109088 try to register TA'),
('2011-11-16 18:57:45,567', 'TRACE', 'sita.controller.RegisterTA;66', 'Username 20109088 success to register TA'),
('2011-11-16 18:58:01,150', 'TRACE', 'sita.controller.logout;64', 'Username 20109088 logout'),
('2011-11-16 18:58:06,685', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-16 18:58:06,760', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-16 18:58:44,487', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-16 18:58:53,880', 'TRACE', 'sita.controller.login;83', 'Username 20109088 try to login'),
('2011-11-16 18:58:53,947', 'TRACE', 'sita.controller.login;109', 'Username 20109088 fail to login'),
('2011-11-16 18:59:00,760', 'TRACE', 'sita.controller.login;83', 'Username 20109088 try to login'),
('2011-11-16 18:59:00,832', 'TRACE', 'sita.controller.login;109', 'Username 20109088 fail to login'),
('2011-11-16 18:59:33,592', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-16 18:59:33,655', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-16 18:59:43,472', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-16 18:59:48,755', 'TRACE', 'sita.controller.login;83', 'Username 20109088 try to login'),
('2011-11-16 18:59:48,832', 'TRACE', 'sita.controller.login;89', 'Username 20109088 success to login'),
('2011-11-16 18:59:56,317', 'TRACE', 'sita.controller.changePassword;82', 'User 20109088 try to change password'),
('2011-11-16 18:59:56,430', 'TRACE', 'sita.controller.changePassword;87', 'User 20109088 sucess to change password'),
('2011-11-16 18:59:58,705', 'TRACE', 'sita.controller.logout;64', 'Username 20109088 logout'),
('2011-11-16 19:00:07,032', 'TRACE', 'sita.controller.login;83', 'Username 20109088 try to login'),
('2011-11-16 19:00:07,105', 'TRACE', 'sita.controller.login;109', 'Username 20109088 fail to login'),
('2011-11-16 19:00:13,232', 'TRACE', 'sita.controller.login;83', 'Username 20109088 try to login'),
('2011-11-16 19:00:13,300', 'TRACE', 'sita.controller.login;89', 'Username 20109088 success to login'),
('2011-11-16 19:00:15,487', 'TRACE', 'sita.controller.logout;64', 'Username 20109088 logout'),
('2011-11-16 19:00:21,770', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-16 19:00:21,835', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-16 19:00:46,720', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-18 10:49:57,728', 'TRACE', 'sita.controller.createAccount;40', 'Guest with nim 2009878789 try to create account'),
('2011-11-18 10:49:58,388', 'TRACE', 'sita.controller.createAccount;59', 'Guest with nim 2009878789 fail to create account'),
('2011-11-18 10:50:09,595', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-18 10:50:09,768', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-18 10:50:28,658', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-18 10:51:09,093', 'TRACE', 'sita.controller.createAccount;40', 'Guest with nim 20108009 try to create account'),
('2011-11-18 10:51:09,325', 'TRACE', 'sita.controller.createAccount;46', 'Guest with nim 20108009 success to create account'),
('2011-11-18 10:51:20,660', 'TRACE', 'sita.controller.login;83', 'Username 20108009 try to login'),
('2011-11-18 10:51:20,723', 'TRACE', 'sita.controller.login;89', 'Username 20108009 success to login'),
('2011-11-18 10:52:48,050', 'TRACE', 'sita.controller.RegisterTA;60', 'Username 20108009 try to register TA'),
('2011-11-18 10:52:48,465', 'TRACE', 'sita.controller.RegisterTA;66', 'Username 20108009 success to register TA'),
('2011-11-18 10:54:13,630', 'TRACE', 'sita.controller.RegisterTA;60', 'Username 20108009 try to register TA'),
('2011-11-18 10:54:13,743', 'TRACE', 'sita.controller.RegisterTA;72', 'Username 20108009 fail to register TA'),
('2011-11-18 10:54:55,753', 'TRACE', 'sita.controller.RegisterTA;60', 'Username 20108009 try to register TA'),
('2011-11-18 10:54:55,823', 'TRACE', 'sita.controller.RegisterTA;72', 'Username 20108009 fail to register TA'),
('2011-11-18 10:55:06,923', 'TRACE', 'sita.controller.logout;64', 'Username 20108009 logout'),
('2011-11-18 10:55:17,908', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-18 10:55:17,983', 'TRACE', 'sita.controller.login;109', 'Username admin fail to login'),
('2011-11-18 10:55:27,663', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-18 10:55:27,730', 'TRACE', 'sita.controller.login;109', 'Username admin fail to login'),
('2011-11-18 10:55:35,740', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-18 10:55:35,808', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-18 10:57:48,978', 'TRACE', 'sita.controller.changePassword;82', 'User admin try to change password'),
('2011-11-18 10:58:08,558', 'TRACE', 'sita.controller.logout;64', 'Username admin logout'),
('2011-11-18 10:58:15,325', 'TRACE', 'sita.controller.login;83', 'Username 20108009 try to login'),
('2011-11-18 10:58:15,395', 'TRACE', 'sita.controller.login;89', 'Username 20108009 success to login'),
('2011-11-18 10:58:35,240', 'TRACE', 'sita.controller.changePassword;82', 'User 20108009 try to change password'),
('2011-11-18 10:58:55,378', 'TRACE', 'sita.controller.changePassword;82', 'User 20108009 try to change password'),
('2011-11-18 10:58:55,515', 'TRACE', 'sita.controller.changePassword;87', 'User 20108009 sucess to change password'),
('2011-11-18 10:59:48,215', 'TRACE', 'sita.controller.logout;64', 'Username 20108009 logout'),
('2011-11-18 11:00:40,350', 'TRACE', 'sita.controller.createAccount;40', 'Guest with nim 20109999 try to create account'),
('2011-11-18 11:00:40,505', 'TRACE', 'sita.controller.createAccount;46', 'Guest with nim 20109999 success to create account'),
('2011-11-18 11:00:51,070', 'TRACE', 'sita.controller.login;83', 'Username 20109999 try to login'),
('2011-11-18 11:00:51,135', 'TRACE', 'sita.controller.login;89', 'Username 20109999 success to login'),
('2011-11-18 11:16:00,825', 'TRACE', 'sita.controller.changePassword;82', 'User 20109999 try to change password'),
('2011-11-18 11:17:13,300', 'TRACE', 'sita.controller.logout;64', 'Username 20109999 logout'),
('2011-11-18 11:17:28,855', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-18 11:17:28,930', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-18 11:17:45,280', 'TRACE', 'sita.controller.changePassword;82', 'User 20109008 try to change password'),
('2011-11-18 11:18:16,355', 'TRACE', 'sita.controller.changePassword;82', 'User 20109008 try to change password'),
('2011-11-18 11:18:16,505', 'TRACE', 'sita.controller.changePassword;87', 'User 20109008 sucess to change password'),
('2011-11-18 11:19:21,293', 'TRACE', 'sita.controller.changePassword;82', 'User 20109008 try to change password'),
('2011-11-18 11:19:21,525', 'TRACE', 'sita.controller.changePassword;87', 'User 20109008 sucess to change password'),
('2011-11-18 11:19:30,585', 'TRACE', 'sita.controller.changePassword;82', 'User 20109008 try to change password'),
('2011-11-18 11:19:30,638', 'TRACE', 'sita.controller.changePassword;94', 'User 20109008 fail to change password'),
('2011-11-18 11:32:55,698', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-18 11:39:07,455', 'TRACE', 'sita.controller.login;83', 'Username 20108009 try to login'),
('2011-11-18 11:39:08,053', 'TRACE', 'sita.controller.login;109', 'Username 20108009 fail to login'),
('2011-11-18 11:39:16,965', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-18 11:39:17,043', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-18 11:41:56,790', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-18 11:45:31,726', 'TRACE', 'sita.controller.login;83', 'Username 20109008 try to login'),
('2011-11-18 11:45:32,451', 'TRACE', 'sita.controller.login;89', 'Username 20109008 success to login'),
('2011-11-18 11:45:50,429', 'TRACE', 'sita.controller.logout;64', 'Username 20109008 logout'),
('2011-11-18 11:59:52,596', 'TRACE', 'sita.controller.createAccount;40', 'Guest with nim 20109089 try to create account'),
('2011-11-18 11:59:52,884', 'TRACE', 'sita.controller.createAccount;46', 'Guest with nim 20109089 success to create account'),
('2011-11-18 12:00:20,786', 'TRACE', 'sita.controller.login;83', 'Username 20108089 try to login'),
('2011-11-18 12:00:20,921', 'TRACE', 'sita.controller.login;109', 'Username 20108089 fail to login'),
('2011-11-18 12:00:42,066', 'TRACE', 'sita.controller.login;83', 'Username 20109089 try to login'),
('2011-11-18 12:00:42,141', 'TRACE', 'sita.controller.login;89', 'Username 20109089 success to login'),
('2011-11-18 12:00:58,214', 'TRACE', 'sita.controller.changePassword;82', 'User 20109089 try to change password'),
('2011-11-18 12:00:58,336', 'TRACE', 'sita.controller.changePassword;87', 'User 20109089 sucess to change password'),
('2011-11-18 12:01:10,171', 'TRACE', 'sita.controller.logout;64', 'Username 20109089 logout'),
('2011-11-18 12:01:20,919', 'TRACE', 'sita.controller.login;83', 'Username admin try to login'),
('2011-11-18 12:01:20,984', 'TRACE', 'sita.controller.login;89', 'Username admin success to login'),
('2011-11-18 12:02:23,069', 'TRACE', 'sita.controller.logout;64', 'Username admin logout');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(10) NOT NULL,
  `password` varchar(40) NOT NULL,
  `role` varchar(4) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `role`, `status`) VALUES
('20101010', '123', '0002', 'active'),
('20108009', 'q1w2e3', '0002', 'active'),
('20109001', '1234', '0002', 'active'),
('20109007', '1234', '0002', 'active'),
('20109008', '1234', '0002', 'active'),
('20109009', '1234', '0002', 'inactive'),
('20109010', '1234', '0002', 'inactive'),
('20109011', '1234', '0002', 'active'),
('20109019', '1234', '0002', 'active'),
('20109026', '1234', '0002', 'active'),
('20109027', '1234', '0002', 'active'),
('20109028', '1234', '0002', 'active'),
('20109030', '1234', '0002', 'active'),
('20109038', '1234', '0002', 'active'),
('20109039', '1234', '0002', 'active'),
('20109040', '1234', '0002', 'active'),
('20109080', '1234', '0002', 'active'),
('20109089', '123', '0002', 'active'),
('20109999', 'kevin', '0002', 'active'),
('admin', '1234', '0001', 'active');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorize`
--
ALTER TABLE `authorize`
  ADD CONSTRAINT `authorize_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  ADD CONSTRAINT `authorize_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `feature` (`f_id`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `pembimbing`
--
ALTER TABLE `pembimbing`
  ADD CONSTRAINT `pembimbing_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `pembimbing_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `ta` (`nim`);

--
-- Constraints for table `ta`
--
ALTER TABLE `ta`
  ADD CONSTRAINT `ta_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`NIM`);
