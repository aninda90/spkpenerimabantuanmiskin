<?php  
    if (@$_GET['page'] == 'dashboard') {
        $activ1 = 'active';
        $activ2 = '';
        $activ3 = '';
        $activ4 = '';
        $activ5 = '';
        $activ6 = '';
        $activ7 = '';
    } else if (@$_GET['page'] == 'menu_data') {
        $activ1 = '';
        $activ2 = 'active';
        $activ3 = '';
        $activ4 = '';
        $activ5 = '';
        $activ6 = '';
        $activ7 = '';
    } else if (@$_GET['page'] == 'data_penilaian') {
        $activ1 = '';
        $activ2 = '';
        $activ3 = 'active';
        $activ4 = '';
        $activ5 = '';
        $activ6 = '';
        $activ7 = ''; 
    } else if (@$_GET['page'] == 'proses_perhitungan') {
        $activ1 = '';
        $activ2 = '';
        $activ3 = '';
        $activ4 = 'active';
        $activ5 = '';
        $activ6 = '';
        $activ7 = '';
    } else if (@$_GET['page'] == 'hasil_perhitungan') {
        $activ1 = '';
        $activ2 = '';
        $activ3 = '';
        $activ4 = '';
        $activ5 = 'active';
        $activ6 = '';
        $activ7 = '';
    } else {
        $activ1 = '';
        $activ2 = '';
        $activ3 = '';
        $activ4 = '';
        $activ5 = '';
        $activ6 = '';
        $activ7 = '';
    }
?>

<!-- Nav Item - Dashboard -->
<li class="nav-item <?= $activ1 ?>">
    <a class="nav-link" href="index.php?page=dashboard">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Dashboard</span></a>
</li>

<!-- Nav Item - Pages Collapse Menu -->
<li class="nav-item <?= $activ2 ?>">
    <a class="nav-link collapsed" href="?page=menu_data" data-toggle="collapse" data-target="#collapseTwo"
        aria-expanded="true" aria-controls="collapseTwo">
        <i class="fas fa-fw fa-list-ul"></i>
        <span>Menu Data</span>
    </a>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded-0">
            <h6 class="collapse-header">Master Menu</h6>
            <a class="collapse-item" href="index.php?page=data_kriteria">Data Kriteria</a>
            <a class="collapse-item" href="index.php?page=data_siswa">Data Alternatif</a>
            <a class="collapse-item" href="index.php?page=sub_kriteria">Sub Kriteria</a>
        </div>
    </div>
</li>

<!-- Nav Item - Utilities Collapse Menu -->
<li class="nav-item <?= $activ3 ?>">
    <a class="nav-link collapsed" href="index.php?page=data_penilaian"
        aria-expanded="true" aria-controls="collapseUtilities">
        <i class="fas fa-fw fa-tasks"></i>
        <span>Penilaian Awal</span>
    </a>
</li>

<!-- Nav Item - Utilities Collapse Menu -->
<li class="nav-item <?= $activ4 ?>">
    <a class="nav-link collapsed" href="index.php?page=proses_perhitungan"
        aria-expanded="true" aria-controls="collapseUtilities">
        <i class="fas fa-fw fa-calculator"></i>
        <span>Proses Perhitungan</span>
    </a>
</li>

<!-- Nav Item - Pages Collapse Menu -->
<li class="nav-item <?= $activ5 ?>">
    <a class="nav-link collapsed" href="index.php?page=hasil_perhitungan"
        aria-expanded="true" aria-controls="collapsePages">
        <i class="fas fa-fw fa-table"></i>
        <span>Hasil Perhitungan</span>
    </a>
</li>