<?php
require '../../config/connect_db.php';

// Proses perhitungan SPK
$sqlAlter = "SELECT * FROM data_alternatif";
$alterSiswa = mysqli_query($koneksi_db, $sqlAlter);

$sqlKrit = mysqli_query($koneksi_db, "SELECT COUNT(ID_Kriteria) FROM data_kriteria");
$resRow = mysqli_fetch_row($sqlKrit);
$jumKrit = $resRow[0];

$sqlIDKrit = mysqli_query($koneksi_db, "SELECT ID_Kriteria, Nilai_Bobot, Atribut FROM data_kriteria");
$kriteria = [];
while ($resKrit = mysqli_fetch_assoc($sqlIDKrit)) {
    $IDkrit[] = $resKrit['ID_Kriteria'];
    $kriteria[$resKrit['ID_Kriteria']] = ['Nilai_Bobot' => $resKrit['Nilai_Bobot'], 'Atribut' => $resKrit['Atribut']];
}

// Menghapus data lama
mysqli_query($koneksi_db, "TRUNCATE TABLE hasil_normalisasi");
mysqli_query($koneksi_db, "TRUNCATE TABLE hasil_optimasi");
mysqli_query($koneksi_db, "TRUNCATE TABLE hasil_preferensi");

$alternatif = [];

// Perulangan nilai dalam kriteria
for ($i = 0; $i < $jumKrit; $i++) {
    $queryNilai = mysqli_query($koneksi_db, "SELECT data_penilaian.ID_Penilaian, data_penilaian.ID_Alter, data_alternatif.
    Nama_Siswa, data_penilaian.ID_Kriteria, data_kriteria.Atribut, data_kriteria.Nama_Kriteria, data_penilaian.Nilai 
    FROM data_penilaian INNER JOIN data_kriteria ON data_penilaian.ID_Kriteria = data_kriteria.ID_Kriteria INNER JOIN 
    data_alternatif ON data_penilaian.ID_Alter = data_alternatif.ID_Alter WHERE data_penilaian.ID_Kriteria = '$IDkrit[$i]'");

    $normalizedValues = [];
    $sumSquare = 0;

    while ($nilaiAlt = mysqli_fetch_assoc($queryNilai)) {
        $sumSquare += pow($nilaiAlt['Nilai'], 2);
        $normalizedValues[$nilaiAlt['ID_Alter']] = $nilaiAlt['Nilai'];
        $alternatif[$nilaiAlt['ID_Alter']] = $nilaiAlt['Nama_Siswa'];
    }

    $sqrtSumSquare = sqrt($sumSquare);

    foreach ($normalizedValues as $key => $value) {
        $normalizedValues[$key] /= $sqrtSumSquare;
    }

    foreach ($normalizedValues as $key => $value) {
        $insNorm = "INSERT INTO hasil_normalisasi (ID_Alter, ID_Kriteria, Hasil_Norm) VALUES ('$key', '$IDkrit[$i]', '$value')";
        mysqli_query($koneksi_db, $insNorm);

        // Menghitung hasil optimasi dan menyimpan ke dalam tabel hasil_optimasi
        $hasilOptimasi = $value * $kriteria[$IDkrit[$i]]['Nilai_Bobot'];
        $insOpt = "INSERT INTO hasil_optimasi (ID_Alter, ID_Kriteria, Hasil_Optimasi) 
                VALUES ('$key', '$IDkrit[$i]', '$hasilOptimasi')";
        mysqli_query($koneksi_db, $insOpt);
    }
}

$prefValues = [];

for ($i = 0; $i < $jumKrit; $i++) {
    // Retrieve optimized values for each criterion
    $queryOpt = mysqli_query($koneksi_db, "SELECT ID_Alter, ID_Kriteria, Hasil_Optimasi FROM hasil_optimasi WHERE ID_Kriteria = '$IDkrit[$i]'");

    while ($optValues = mysqli_fetch_assoc($queryOpt)) {
        $idKriteria = $optValues['ID_Kriteria'];

        if ($kriteria[$idKriteria]['Atribut'] == 'Benefit') {
            // Benefit
            if (!isset($prefValues[$optValues['ID_Alter']]['Benefit'])) {
                $prefValues[$optValues['ID_Alter']]['Benefit'] = 0;
            }
            $prefValues[$optValues['ID_Alter']]['Benefit'] += $optValues['Hasil_Optimasi'];
        } elseif ($kriteria[$idKriteria]['Atribut'] == 'Cost') {
            // Cost
            if (!isset($prefValues[$optValues['ID_Alter']]['Cost'])) {
                $prefValues[$optValues['ID_Alter']]['Cost'] = 0;
            }
            $prefValues[$optValues['ID_Alter']]['Cost'] += $optValues['Hasil_Optimasi'];
        }
    }
}

// Calculate the final score (Benefit - Cost) for each alternative
foreach ($prefValues as $key => $value) {
    $finalScore = $value['Benefit'] - $value['Cost'];
    $insPref = "INSERT INTO hasil_preferensi (ID_Alter, hasil_pref) VALUES ('$key', '$finalScore')";
    mysqli_query($koneksi_db, $insPref);
}

header('Location: ../../index.php?page=hasil_perhitungan');
exit;
?>
