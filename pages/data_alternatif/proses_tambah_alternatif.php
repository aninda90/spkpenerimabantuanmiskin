<?php
  session_start();
	require '../../config/connect_db.php';

	// proses tambah
  $siswa = htmlspecialchars($_POST['nama_siswa']);
  $jk = htmlspecialchars($_POST['jenis_kelamin']);
  $kelas = htmlspecialchars($_POST['kelas']);	
  $alamat = htmlspecialchars($_POST['alamat']);


  $sql = "INSERT INTO data_alternatif VALUES ('', '$siswa', '$jk', '$kelas', '$alamat')";
  $send = mysqli_query($koneksi_db, $sql);

  if ($send) {
    $_SESSION['pesan'] = 'Alternatif berhasil tersimpan!';
    $_SESSION['status'] = 'success';
    header('Location: ../../index.php?page=data_siswa');
    exit;
  } 
  else {
    $_SESSION['pesan'] = 'Alternatif gagal tersimpan!';
    $_SESSION['status'] = 'danger';
    header('Location: ../../index.php?page=data_siswa');
    exit;
  }
  
?>