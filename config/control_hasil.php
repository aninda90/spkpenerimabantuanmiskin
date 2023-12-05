<?php  
	// koneksi db  
	require 'connect_db.php';

	if (isset($_GET['hasil'])) {
		$pages = $_GET['hasil'];

		if ($pages === 'normalisasi') {
			include 'pages/hasil_perhitungan/hasil_normalisasi.php';
		}
		else if ($pages === 'optimasi') {
			include 'pages/hasil_perhitungan/hasil_optimasi.php';
		}
		else if ($pages === 'akhir') {
			include 'pages/hasil_perhitungan/hasil_akhir.php';
		}
		else if ($pages === 'perankingan') {
			include 'pages/hasil_perhitungan/perankingan.php';
		}
	}
	else {
		include 'pages/hasil_perhitungan/hasil_normalisasi.php';
	}

?>