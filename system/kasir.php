<?php
if ($_GET['module'] == 'kasir') {
    $tampil = mysqli_query($conn, "SELECT * FROM users ORDER BY username");
    echo "<h3>Manajemen User / Kasir</h3>";

    echo "<a href='media.php?module=tambahkasir'><input type='button' value='Tambah Kasir'></a>
		<table width=100% cellpadding='7'>
			<a style='float:right;' target='_BALNK' href='print-members.php'>Cetak laporan Kasir</a>
      <tr class='data'>
        <th class='data'>No</th>
        <th class='data'>Username</th>
        <th class='data'>Nama Lengkap</th>
        <th class='data'>Alamat Email</th>
        <th class='data'>No.Telpon</th>
        <th class='data' align='center' width='40px'>Action</th>
		  </tr>";
    $no = 1;

    while ($r = mysqli_fetch_array($tampil)) {
        $username = $r['username'];
        $namalengkap = $r['nama_lengkap'];
        $email = $r['email'];
        $notelp = $r['no_telp'];
        $id_sess = $r['id_session'];

        if (($no % 2) == 0) {
            $warna = "#ffffff";
        } else { $warna = "#E1E1E1";}
        if ($r['level'] == 'admin') {
            echo "<tr class='data'>";
        } else {
            echo "<tr class='data'>";
        }
        echo "<td class='data'>" . $no . "</td>
             <td class='data'>" . $username . "</td>
             <td class='data'>" . $namalengkap . "</td>
			 <td class='data'>" . $email . "</td>
		         <td class='data'>" . $notelp . "</td>
             <td class='data'><a href=media.php?module=editkasir&id=" . $id_sess . "><center>Edit</center></a></td>
		</tr>";
        $no++;
    }
    echo "</table>";
} elseif ($_GET['module'] == 'tambahkasir') {
    echo "
    <h3>Tambahkan Kasir Baru.</h3>
		  <div class='h_line'></div>
        <form method=POST action='media.php?module=aksitambahkasir'>
          <table width='100%'>
            <tr>
              <td width=100px>Username</td>
              <td> : <input type=text name='username'></td>
            </tr>
            <tr>
              <td>Password</td>
              <td> : <input type=text name='password'> </td>
            </tr>
            <tr>
              <td>Nama Lengkap</td>
              <td> : <input type=text name='nama_lengkap' size=30></td>
            </tr>
            <tr>
              <td>E-mail</td>
              <td> : <input type=text name='email' size=30></td>
            </tr>
            <tr>
              <td>No.Telp/HP</td>
              <td> : <input type=text name='no_telp' size=30></td>
            </tr>
            <tr>
              <td colspan=2>
                <input type=submit value=Submit>
                <input type=button value=Batal onclick=self.history.back()>
              </td>
            </tr>
          </table>
        </form>";

} elseif ($_GET['module'] == 'aksitambahkasir') {
    $username = $POST['username'];
    $namalengkap = $POST['nama_lengkap'];
    $email = $POST['email'];
    $notelp = $POST['no_telp'];

    $pass = md5($_POST['password']);
    mysqli_query($conn, "INSERT INTO users (username, password, nama_lengkap, email, no_telp, aktif, id_session) VALUES ('$username','$pass','$namalengkap','$email','$notelp','Y','$pass')");
    header('location:kasir.html');
} elseif ($_GET['module'] == 'editkasir') {
    $id = $_GET['id'];
    $edit = mysqli_query($conn, "SELECT * FROM users WHERE id_session='$id'");
    $r = mysqli_fetch_array($edit);
    $id_sess = $r['id_session'];
    $username = $r['username'];
    $namalengkap = $r['nama_lengkap'];
    $email = $r['email'];
    $notelp = $r['no_telp'];

    echo "
    <h3>Edit Data Kasir.</h3>
		  <div class='h_line'></div>
        <form method=POST action='media.php?module=aksieditkasir'>
          <input type=hidden name=id value='$id_sess'>
          <table width='100%'>
            <tr>
              <td width=100px>Username</td>
              <td>:<input type=text name='username' value='$username' disabled> **)</td>
            </tr>
            <tr>
              <td>Password</td>
              <td>:<input type=text name='password'> *)</td>
            </tr>
            <tr>
              <td>Nama Lengkap</td>
              <td>:<input type=text name='nama_lengkap' size=30  value='$namalengkap'></td>
            </tr>
            <tr>
              <td>E-mail</td>
              <td>:<input type=text name='email' size=30 value='$email'></td>
            </tr>
            <tr>
              <td>No.Telp/HP</td>
              <td>:<input type=text name='no_telp' size=30 value='$no_telp'></td>
            </tr>
            <tr>
              <td colspan=2>
                <input type=submit value=Update>
                <input type=button value=Batal onclick=self.history.back()>
                </td>
            </tr>
          </table>
        </form>";

} elseif ($_GET['module'] == 'aksieditkasir') {
    $id = $_POST['id'];
    $username = $_POST['username'];
    $namalengkap = $_POST['nama_lengkap'];
    $email = $_POST['email'];
    $notelp = $_POST['no_telp'];

    if (empty($_POST['password'])) {
        mysqli_query($conn, "UPDATE users SET nama_lengkap='$namalengkap',
                                  email          = '$email',
                                  no_telp        = '$notelp'
                           WHERE  id_session     = '$id'");
    } else {
        $pass = md5($_POST['password']);
        mysqli_query("UPDATE users SET password        = '$pass',
                                 nama_lengkap    = '$namalengkap',
                                 email           = '$email',
                                 no_telp         = '$notelp'
                           WHERE id_session      = '$id'");
    }
    header('location:kasir.html');
}
