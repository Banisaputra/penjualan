<?php
session_start();
include "../config/koneksi.php";
include "../config/library.php";
include "../config/session_member.php";

$module = $_GET['module'];
$act = $_GET['act'];
$id = $_GET['id'];
$kd = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM produk where kode_produk='$id'"));
$idpr = $kd['id_produk'];

if ($module == 'keranjang' and $act == 'tambah') {
    $sid = $_SESSION['namauser'];
    $in = mysqli_fetch_array(mysqli_query($conn, "SELECT a.id_produk, sum(a.jumlah) as masuk FROM produk_pembelian a where a.id_produk='$idpr'"));
    $out = mysqli_fetch_array(mysqli_query($conn, "SELECT a.id_produk, sum(a.jumlah) as keluar FROM orders_detail a where a.id_produk='$idpr'"));
    $stok = $in['masuk'] - $out['keluar'];

    $st = mysqli_fetch_array(mysqli_query($conn, "SELECT sum(jumlah) as jumlah FROM orders_temp WHERE id_produk='$idpr'"));

    if ($stok <= 0) {
        if ($_GET['cust'] == '') {
            echo "<script>window.alert('Maaf, Stok Produk Habis ".$total_stok."..');
			window.location=('media.php?module=keranjangbelanja&stat=".$_GET['stat']."')</script>";
        } else {
            echo "<script>window.alert('Maaf, Stok Produk Habis ".$total_stok."..');
			window.location=('media.php?module=keranjangbelanja&stat=".$_GET['stat']."&cust=".$_GET['cust']."')</script>";
        }
    } elseif ($stok < $st['jumlah']) {
        if ($_GET['cust'] == '') {
            echo "<script>window.alert('Maaf, Stok Produk Tidak Mencukupi..');
			window.location=('media.php?module=keranjangbelanja&stat=".$_GET['stat']."')</script>";
        } else {
            echo "<script>window.alert('Maaf, Stok Produk Tidak Mencukupi..');
			window.location=('media.php?module=keranjangbelanja&stat=".$_GET['stat']."&cust=".$_GET['cust']."')</script>";
        }
    } else {
        // check if the product is already
        // in cart table for this session
        $sql = mysqli_query($conn, "SELECT id_produk FROM orders_temp WHERE id_produk='$idpr' AND id_session='$sid'");
        $ketemu = mysqli_num_rows($sql);
        if ($ketemu == 0) {
            // put the product in cart table
            mysqli_query($conn, "INSERT INTO orders_temp (id_produk, jumlah, id_session, tgl_order_temp, jam_order_temp)
				VALUES ('$idpr', 1, '$sid', '$tgl_sekarang', '$jam_sekarang')");
        } else {
            // update product quantity in cart table
            mysqli_query($conn, "UPDATE orders_temp SET jumlah = jumlah + 1 WHERE id_session ='$sid' AND id_produk='$idpr'");
        }
        header('location:media.php?module=keranjangbelanja&stat=' . $_GET['stat'] . '&cust=' . $_GET['cust'] . '');
    }
} elseif ($module == 'keranjang' and $act == 'hapus') {
    mysqli_query($conn, "DELETE FROM orders_temp WHERE id_orders_temp='$id'");
    if ($_GET['cust'] == '') {
        header('location:media.php?module=keranjangbelanja&stat=' . $_GET['stat'] . '');
    } else {
        header('location:media.php?module=keranjangbelanja&stat=' . $_GET['stat'] . '&cust=' . $_GET['cust'] . '');
    }
} elseif ($module == 'keranjang' and $act == 'update') {
    $id = $_POST['id'];
    $jml_data = count($id);
    $stok = $_POST['stok'];
    $jumlah = $_POST['jml']; // quantity
    for ($i = 1; $i <= $jml_data; $i++) {
        if ($jumlah[$i] > $stok[$i]) {
            echo "<script>window.alert('Maaf, Stok Produk Tidak Mencukupi..');
        			window.location=('keranjang-belanja-".$_GET['stat'].".html')</script>";
        } else {
            mysql_query($conn, "UPDATE orders_temp SET jumlah = '" . $jumlah[$i] . "'
                                      WHERE id_orders_temp = '" . $id[$i] . "'");
        }
    }
    if ($_GET['cust'] == '') {
        header('Location:media.php?module=keranjangbelanja&stat=' . $_GET['stat'] . '');
    } else {
        header('Location:media.php?module=keranjangbelanja&stat=' . $_GET['stat'] . '&cust=' . $_GET['cust'] . '');
    }
}
