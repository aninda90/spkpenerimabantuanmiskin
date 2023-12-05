<?php
  session_start();
	require '../../config/connect_db.php';

	// proses edit
	$id = $_GET['id'];  
  $siswa = htmlspecialchars($_POST['nama_siswa']);
  $jk = htmlspecialchars($_POST['jenis_kelamin']);
  $kelas = htmlspecialchars($_POST['kelas']);	
  $alamat = htmlspecialchars($_POST['alamat']);


  $sql = "UPDATE data_alternatif SET Nama_Siswa = '$siswa', JK = '$jk', Kelas = '$kelas', Alamat = '$alamat'
  WHERE ID_Alter = '$id'";
  $send = mysqli_query($koneksi_db, $sql);

  if ($send) {
    $_SESSION['pesan'] = 'Alternatif berhasil terubah!';
    $_SESSION['status'] = 'success';
    header('Location: ../../index.php?page=data_siswa');
    exit;
  } 
  else {
    $_SESSION['pesan'] = 'Alternatif gagal terubah!';
    $_SESSION['status'] = 'danger';
    header('Location: ../../index.php?page=data_siswa');
    exit;
  }
  
?>