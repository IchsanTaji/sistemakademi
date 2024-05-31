﻿<?php
require '../fungsi.php';
session_start();
// var_dump( $_SESSION["user"]);
$datauser = $_SESSION["user"];

if (!isset($_SESSION["login"])) {
    header("Location:login.php");
    exit;
}elseif($datauser["Jabatan"] != "Murid") {
    header("Location:../guru/dashboardguru.php");
    exit;
}
//
//var_dump($datauser)
$kelas = $datauser["Kelas"];
$nis = $datauser["NIS"];
$result = mysqli_query($koneksi, "select NIS,MataPelajaran,nilai.kelas,Nilai from matapelajaran Left Join nilai On matapelajaran.id = nilai.Mapel WHERE NIS ='$nis' ");
//var_dump(mysqli_fetch_assoc($result));
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mata Pelajaran</title>
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
                        <i class="icon-reorder shaded"></i></a><a class="brand" href="index.html"><img src="logo.png" style="width:130px;height:80px;">                  SD SUKAMAJU </a>
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
                                <li class="active"><a href="dashboardmurid.php"><i class="menu-icon icon-dashboard"></i>Dashboard
                                </a></li>
                                </li>
                                <li><a href="matapelajaran.php"><i class="menu-icon icon-inbox"></i>Mata Pelajaran</a></li>
                                <li><a href="jadwal.php"><i class="menu-icon icon-tasks"></i>Jadwal</a></li>
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                            <!--/.widget-nav-->
                            <ul class="widget widget-menu unstyled">
                                <li><a class="collapsed" data-toggle="collapse" href="#togglePages"><i class="menu-icon icon-cog">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>More Pages </a>
                                    <ul id="togglePages" class="collapse unstyled">
                                        <li><a href="other-user-profile.php"><i class="icon-inbox"></i>Profile </a></li>
                                    </ul>
                                </li>
                                <li><a href="../logout.php"><i class="menu-icon icon-signout"></i>Logout</a></li>
                            </ul>
                        </div>
                        <!--/.sidebar-->
                    </div>
                    <!--/.span3-->
                    <div class="span9">
                        <div class="content">
                            
                            <!-- .module-->
                            <div class="module hide">
                                <div class="module-head">
                                    <h3>
                                        Adjust Budget Range</h3>
                                </div>
                                <div class="module-body">
                                    <div class="form-inline clearfix">
                                        <a href="#" class="btn pull-right">Update</a>
                                        <label for="amount">
                                            Price range:</label>
                                        &nbsp;
                                        <input type="text" id="amount" class="input-" />
                                    </div>
                                    <hr />
                                    <div class="slider-range">
                                    </div>
                                </div>
                            </div>
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Mata Pelajaran</h3>
                                </div>
                                <div class="module-body table">
                                    <table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped  display"
                                        width="100%">

                             <table class="table">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th>NIS</th>
                                        <th>Mata Pelajaran</th>
                                        <th>Nilai</th>
                                    </tr>

                                    <?php $i=1; ?>
                                    <?php while( $jdwal = mysqli_fetch_assoc($result) ) : ?>
                                     <tr>
                                        <td><?= $jdwal["NIS"]?></td>
                                        <td><?= $jdwal["MataPelajaran"]?></td>
                                        <td><?= $jdwal["Nilai"]?></td>
                                     </tr>

                            <?php $i++; ?>
                            <?php endwhile;?>
                                </table>

                                            </tr>
                                        </tbody>
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
            </div>
        </div>
        <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
        <script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="scripts/common.js" type="text/javascript"></script>
      
    </body>