<?php

require "../fungsi.php";

$idhapus = $_GET["id"];

if( hapus($idhapus) > 0 ) {
    echo "Data Berhasil Dihapus!";
    echo "<meta http-equiv=refresh content=2;URL='dashboardnilaisiswa.php'>";
} else { 
    echo $idhapus;
    echo "Data Gagal Dihapus!";
    echo "<meta http-equiv=refresh content=2;URL='dashboardnilaisiswa.php'>";        
    
}

?>
