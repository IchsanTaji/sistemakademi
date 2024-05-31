<?php

session_start();
// var_dump( $_SESSION["user"]);
$datauser = $_SESSION["user"];

if (!isset($_SESSION["login"])) {
    header("Location:../login/login.php");
    exit;
}elseif($datauser["Jabatan"] != "Murid") {
    header("Location:../murid/dashboardguru.php");
    exit;
}
echo "hehe";
echo $datauser["nama"];

?>



