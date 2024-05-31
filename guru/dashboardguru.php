<?php
require '../fungsi.php';
session_start();
// var_dump( $_SESSION["user"]);
$datauser = $_SESSION["user"];
if (!isset($_SESSION["login"])) {
    header("Location:../login/login.php");
    exit;
}elseif($datauser["Jabatan"] != "Guru") {
    header("Location:../murid/dashboardmurid.php");
    exit;
}


// Tabel Guru
$data = $datauser["NoPegawai"];
// Tabel Gaji
$gaji = $datauser["Gaji"];

//quey tabel guru 
$profil1 = mysqli_query($koneksi, "SELECT NamaGuru FROM guru where NoPegawai = '$data'");
$profil = mysqli_query($koneksi, "SELECT * FROM guru where NoPegawai = '$data'");
// query tabel gaji 
$gaji1 = mysqli_query($koneksi, "SELECT * FROM gaji where NoStruk = '$gaji'");




?>
<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edmin</title>
        <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="css/theme.css" rel="stylesheet">
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
            rel='stylesheet'>
    </head>
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                        <i class="icon-reorder shaded"></i></a><a class="brand" href="index.html"><img src="sdlogo.png" style="width:90px;height:80px;">      SD SUKAMAJU </a>
                    <div class="nav-collapse collapse navbar-inverse-collapse">
                        </button>
                        </form>
                        <ul class="nav pull-right">
                        <?php $i =1; ?>
                        <?php while( $jdwal2 = mysqli_fetch_assoc($profil1) ) : ?>
                        <li><a><h2>
                        <?= $jdwal2["NamaGuru"]?>  
                        </h2></a>
                        <?php $i++; ?>
                        <?php endwhile;?>
                        </li>
                        </ul>
                    </div>
                    <!-- /.nav-collapse -->
                </div>
            </div>
            <!-- /navbar-inner -->
        </div>
        <!-- /navbar -->
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="span3">
                        <div class="sidebar">
                            <ul class="widget widget-menu unstyled">
                                <li class="active"><a href="dashboardguru.php"><i class="menu-icon icon-dashboard"></i>Dashboard
                                </a></li>
                                <li class="active"><a href="dashboardmuridguru.php"><i class="menu-icon icon-group"></i>Murid
                                </a></li>
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li><a href="dashboardjadwal.php"><i class="menu-icon icon-table"></i>Jadwal Pelajaran</a></li>
                                <li><a href="inputnilai.php"><i class="menu-icon icon-bar-chart"></i>Input Nilai</a></li>
                            </ul>
                            <!--/.widget-nav-->
                            <ul class="widget widget-menu unstyled">
                                <li><a href="dashboardnilaisiswa.php"><i class="menu-icon icon-bar-chart"></i>Nilai Siswa</a></li>
                                <li><a href="../logout.php"><i class="menu-icon icon-signout"></i>Logout </a></li>
                            </ul>
                        </div>
                        <!--/.sidebar-->
                    </div>
                    <!--/.span3-->
                    <div class="span9">
                        <div class="content">
                            <div class="btn-controls">
                                <div class="btn-box-row row-fluid">
                                    <a href="dashboardjadwal.php" class="btn-box big span4"><i class=" icon-table"></i><b>JADWAL</b>
                                        <p class="text-muted">
                                            </p>
                                            <?php $i =1; ?>
                                            <?php while( $struk = mysqli_fetch_assoc($gaji1) ) : ?>
                                    <a href="dashboardgaji.php" class="btn-box big span4"><i class="icon-money"></i><b><?= $struk["Gaji"]?></b>
                                        <p class="text-muted">
                                            Gaji</p>
                                            <?php $i++; ?>
                                            <?php endwhile;?>
                                    </a>
                                    </a><a href="dashboardguru.php" class="btn-box big span4"><i class="icon-user"></i><b>PROFILE</b>
                                        <p class="text-muted">
                                            </p>
                                    </a>
                                </div>
                                
                            </div>
                            <!--/#btn-controls-->
                            <div class="module">
                                <div class="module-head">
                                    <h2>
                                        Profil Guru</h2>
                                </div>
                                <div class="thead-dark">
                                    <table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	 display"
                                        width="100%">
                                        <thead>
                                        <?php $i =1; ?>
      <?php while( $jdwal = mysqli_fetch_assoc($profil) ) : ?>
        <tr>
  <th>No Pegawai</th>
  <td><?= $jdwal["NoPegawai"]?></td>
 </tr>

 <tr>
 <th>Nama Guru</th>
  <td><?= $jdwal["NamaGuru"]?></td>
 </tr>

 <tr>
 <th>No Hp</th>
  <td><?= $jdwal["NoHP"]?></td> 
 </tr>

 <tr>
 <th>Alamat</th>
  <td><?= $jdwal["Alamat"]?></td> 
 </tr>

 <tr>
 <th>Wali Kelas</th>
  <td><?= $jdwal["WaliKelas"]?></td> 
 </tr>

          <?php $i++; ?>
        <?php endwhile;?>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <!--/.module-->
                        </div>
                        <!--/.content-->
                    </div>
                    <!--/.span9-->
                </div>
            </div>
            <!--/.container-->
        </div>
        <!--/.wrapper-->
        <div class="footer">
            <div class="container">
                <b class="copyright">&copy; 2021 Edmin - EGrappler.com </b>All rights reserved.
            </div>
        </div>
        <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
        <script src="scripts/common.js" type="text/javascript"></script>
      
    </body>
