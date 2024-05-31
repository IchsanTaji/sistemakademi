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
$berhasilkirim = FALSE;
// var_dump($datauser);
$Kelas = $datauser["WaliKelas"];
// var_dump($Kelas);

// ambil data URL
$id = $_GET["id"];

// query data siswa berdasarkan id
$siswa1 = query("select  matapelajaran.id as mapelid,nilai.id,NIS,MataPelajaran,nilai.kelas,nilai.semester,Nilai,matapelajaran.KodeMapel from matapelajaran Left Join nilai On matapelajaran.id = nilai.Mapel where nilai.id = '$id'")[0];
// var_dump($siswa1);
// var_dump($id);

$murid = query("SELECT * FROM murid WHERE Kelas='$Kelas'");
$matapelajaran = query("SELECT * FROM matapelajaran WHERE Kelas='$Kelas'");
// var_dump($murid);

if (isset($_POST["kirim"])){
    $iddata = $_POST["id"]; 
	$semester = $_POST["semester"];
    $kelas = $_POST["kelas"];
	$nilai = $_POST["nilai"];
    $siswa = $_POST["siswa"];
    $mapel = $_POST["mapel"];
    $sql = "UPDATE nilai SET NIS='$siswa',Mapel='$mapel',Nilai='$nilai',kelas='$kelas',semester='$semester' WHERE id = '$iddata'";
	var_dump($sql);
    $kirim = mysqli_query($koneksi,$sql);
	if ($kirim) {
            $berhasilkirim = TRUE;
		}else{
            $gagalkirim = FALSE;
        }
};
// Tabel Guru
$data = $datauser["NoPegawai"];
//quey tabel guru 
$profil1 = mysqli_query($koneksi, "SELECT NamaGuru FROM guru where NoPegawai = '$data'");
?>
<!DOCTYPE html>
<html lang="en">


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edmin</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>
<?php if (isset($gagalkirim)): ?>
<script> alert("Masukan Data Yang Benar");
		document.location.href='dashboardnilaisiswa.php'</script>;

<?php elseif ($berhasilkirim): ?>
<script> alert("Data Berhasil Dikirim");
		document.location.href='dashboardnilaisiswa.php'</script>;
<?php endif;?>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

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
				</div><!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->



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

					</div><!--/.sidebar-->
				</div><!--/.span3-->


				<div class="span9">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h2>Nilai Siswa</h2>
							</div>
							<div class="module-body">
									<form class="form-horizontal row-fluid" method="POST" >
										<div class="control-group">
											<label class="control-label" for="basicinput">Kelas</label>
											<div class="controls">
												<input type="text" id="basicinput" placeholder="<?= $datauser["WaliKelas"]?>"  class="span8" disabled>
                                                <input type="hidden" value="<?= $siswa1["id"]?>" name = "id">
                                                <input type="hidden" id="basicinput"  name= "kelas" value = "<?= $datauser["WaliKelas"]?>"  class="span8">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="basicinput">Siswa</label>
											<div class="controls">
												<select name = "siswa" tabindex="1" data-placeholder="<?=$siswa1['NIS'] ?>" class="span8" required>
													<option value="<?=$siswa1['NIS'] ?>"><?=$siswa1['NIS'] ?></option>
                                                    <?php for ($i=0; $i < count($murid) ; $i++) { 
                                                        
                                                     ?>
                                                    <option value="<?=$murid[$i]['NIS'] ?>"><?=$murid[$i]['NIS'] ?> - <?=$murid[$i]['Nama'] ?></option>
												
                                                <?php } ?>
                                                </select>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Semester</label>
											<div class="controls">
												<select name = "semester" tabindex="1" data-placeholder="<?=$siswa1['semester'] ?>" class="span8" required>
													<option value="<?=$siswa1['semester'] ?>"><?=$siswa1['semester'] ?></option>
                                                    <?php for ($i=1; $i <= 12 ; $i++) { 
                                                        
                                                    ?>
                                                    <option value="<?=$i?>"><?=$i ?></option>
												
                                                <?php } ?>
                                                </select>
											</div>
										</div>
                                        
                                        <div class="control-group">
											<label class="control-label" for="basicinput">Mata Pelajaran</label>
											<div class="controls">
												<select name = "mapel" tabindex="1" data-placeholder="<?=$siswa1['MataPelajaran'] ?>" class="span8" required>
													<option value="<?=$siswa1['mapelid'] ?>"><?=$siswa1['MataPelajaran'] ?></option>
                                                    <?php for ($i=0; $i < count($matapelajaran) ; $i++) { 
                                                        
                                                    ?>
                                                    <option value="<?=$matapelajaran[$i]['id'] ?>"><?=$matapelajaran[$i]['KodeMapel'] ?> - <?=$matapelajaran[$i]['MataPelajaran'] ?></option>
												
                                                <?php } ?>
                                                </select>
											</div>
										</div>




                                        <div class="control-group">
											<label class="control-label" for="nilai">Nilai</label>
											<div class="controls">
												<input value = "<?=$siswa1['Nilai'] ?>"type="text" id="nilai" name = "nilai" placeholder="<?=$siswa1['Nilai'] ?>" class="span8">
												<span class="help-inline">Minimum 5 Characters</span>
											</div>
										</div>
										<div class="control-group">
											<div class="controls">
												<button type="submit" class="btn" name = "kirim" href="dashboardnilaisiswa.php" >Ubaha Data</button>
											</div>
										</div>
									</form>
							</div>
						</div>

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; 2014 Edmin - EGrappler.com </b> All rights reserved.
		</div>
	</div>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
</body>
</html>