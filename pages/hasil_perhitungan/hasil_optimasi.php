<?php  
$optimasi = mysqli_query($koneksi_db, "SELECT hasil_optimasi.ID_Optimasi, hasil_optimasi.ID_Alter, data_alternatif.Nama_Siswa, 
    hasil_optimasi.Hasil_Optimasi, hasil_optimasi.ID_Kriteria FROM hasil_optimasi 
    INNER JOIN data_alternatif ON hasil_optimasi.ID_Alter = data_alternatif.ID_Alter");

$siswa = mysqli_query($koneksi_db, "SELECT ID_Alter, Nama_Siswa FROM data_alternatif");
$kriteria = mysqli_query($koneksi_db, "SELECT ID_Kriteria, Nama_Kriteria FROM data_kriteria");

// Inisialisasi array untuk menyimpan nilai optimasi sesuai dengan kriteria
$dataOptimasi = [];

// Menggabungkan data hasil optimasi dengan data kriteria
while ($rowOptimasi = mysqli_fetch_assoc($optimasi)) {
    $dataOptimasi[$rowOptimasi['ID_Alter']][$rowOptimasi['ID_Kriteria']] = $rowOptimasi['Hasil_Optimasi'];
}
?>

<div class="card-header bg-white py-3 d-flex align-items-center justify-content-between">
    <h6 class="m-0 text-gray-800">Hasil Optimasi</h6>
</div>
<div class="card-body">
    <div class="table-responsive">
        <table class="table table-bordered" width="100%" cellspacing="0">
            <thead>
                <tr>
                    <th class="text-nowrap">No</th>
                    <th class="text-nowrap">Alternatif</th>
                    <?php  
                        while ($krit = mysqli_fetch_assoc($kriteria)) :
                    ?>
                        <th class="text-nowrap"><?= $krit['Nama_Kriteria']; ?></th>
                    <?php endwhile; ?>
                </tr>
            </thead>
            <tbody>
                <?php
                    $no = 0;   
                    while ($sis = mysqli_fetch_assoc($siswa)) :
                    $no++;
                ?>
                <tr>
                    <td class="text-nowrap"><?= $no; ?></td>
                    <td class="text-nowrap"><?= $sis['Nama_Siswa']; ?></td>
                    <?php  
                        // Menampilkan nilai optimasi sesuai dengan kriteria
                        foreach ($kriteria as $krit) :
                            $idKriteria = $krit['ID_Kriteria'];
                            $nilaiOptimasi = isset($dataOptimasi[$sis['ID_Alter']][$idKriteria]) ? $dataOptimasi[$sis['ID_Alter']][$idKriteria] : '';
                    ?>
                        <td class="text-nowrap"><?= $nilaiOptimasi; ?></td>
                    <?php endforeach; ?>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</div>