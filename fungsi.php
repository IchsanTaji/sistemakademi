<?php
$koneksi = mysqli_connect("127.0.0.1", "root", "", "sdsukamaju");

function query($query){
    global $koneksi;
    $hasil = mysqli_query($koneksi,$query);
    $nilaiakhir = [];
    while ($n = mysqli_fetch_assoc($hasil)){
        $nilaiakhir[] = $n;
    }
    return $nilaiakhir;
};

function hapus($idhapus) {
    global $koneksi;
    mysqli_query($koneksi,"delete  from nilai where id='$idhapus'");
    return mysqli_affected_rows($koneksi);

};

?>