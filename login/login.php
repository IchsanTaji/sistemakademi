<?php
require '../fungsi.php';
session_start();

if (isset($_SESSION["login"])) {
    $datauser = $_SESSION["user"];
    if($datauser["Jabatan"] == "Guru") {
        header("Location:../guru/dashboardguru.php");
        exit;
    }elseif($datauser["Jabatan"] == "Murid") {
        header("Location:../murid/dashboardmurid.php");
        exit;
    }
}



if (isset($_POST["login"])){
        $username = $_POST["username"];
        $password = $_POST["password"];

        $cekmurid = mysqli_query($koneksi,"SELECT * FROM murid WHERE NIS = '$username'");
        $cekguru = mysqli_query($koneksi,"SELECT * FROM guru WHERE NoPegawai = '$username'");

        
        // var_dump(mysqli_num_rows($cekuser));
if  (mysqli_num_rows($cekmurid) == 1) {
            $datamurid = mysqli_fetch_assoc($cekmurid);
            if ($password == $datamurid["Password"]) {
                if ($datamurid["Jabatan"] == "Murid") {
                    $_SESSION["user"] = $datamurid;
                    $_SESSION["login"] = true;
                    header("Location: ../murid/dashboardmurid.php");
                    exit;
                }

            }else {
            $gagallogin = true;
        }
        }elseif(mysqli_num_rows($cekguru) == 1){
            $dataguru = mysqli_fetch_assoc($cekguru);
            if ($password == $dataguru["Password"]) {
                if ($dataguru["Jabatan"] == "Guru") {
                    $_SESSION["login"] = true;
                    $_SESSION["user"] = $dataguru;
                    header("Location: ../guru/dashboardguru.php");
                    exit;
                }
            }else {
                $gagallogin = true;
            }
        }else {
            $gagallogin = true;
        }
        
        
    }
?>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Selamat datang</title>
</head>
<body>
<?php if (isset($gagallogin)):?>
        <script> alert("Username/Password Salah");</script>;
    <?php endif;?>
    <div class="container-fluid">
        <div class="formlogin"  style="width:50%;height:50%;background-color:white;margin:auto;margin-top:10%;padding:20px;">
            <div class="logo">
            <img src="logo.png" style="display:block; min-width:150px;min-height:100px;width:20%;height:20%;margin:auto;">
            </div>  
            <h1 style="text-align:center;">Login</h1>

            <form method="POST">
                <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Masukan Username" name="username">
                <small id="emailHelp" class="form-text text-muted">Username NIS untuk siswa dan NP untuk pegawai</small>
                </div>
                <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
                </div>
                <button type="submit" class="btn btn-primary" name="login">Login</button>
            </form>
        
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>