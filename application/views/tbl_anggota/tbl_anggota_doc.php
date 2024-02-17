<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            .word-table {
                border:1px solid black !important; 
                border-collapse: collapse !important;
                width: 100%;
            }
            .word-table tr th, .word-table tr td{
                border:1px solid black !important; 
                padding: 5px 10px;
            }
        </style>
    </head>
    <body>
        <h2>Tbl_anggota List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Nik</th>
		<th>No Kk</th>
		<th>Nama</th>
		<th>Tempat Lahir</th>
		<th>Tanggal Lahir</th>
		<th>Jenis Kelamin</th>
		<th>Alamat</th>
		<th>Kota</th>
		<th>Rt</th>
		<th>Rw</th>
		<th>Agama</th>
		<th>Status Kawin</th>
		<th>Status</th>
		<th>Foto</th>
		
            </tr><?php
            foreach ($tbl_anggota_data as $tbl_anggota)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $tbl_anggota->nik ?></td>
		      <td><?php echo $tbl_anggota->no_kk ?></td>
		      <td><?php echo $tbl_anggota->nama ?></td>
		      <td><?php echo $tbl_anggota->tempat_lahir ?></td>
		      <td><?php echo $tbl_anggota->tanggal_lahir ?></td>
		      <td><?php echo $tbl_anggota->jenis_kelamin ?></td>
		      <td><?php echo $tbl_anggota->alamat ?></td>
		      <td><?php echo $tbl_anggota->kota ?></td>
		      <td><?php echo $tbl_anggota->rt ?></td>
		      <td><?php echo $tbl_anggota->rw ?></td>
		      <td><?php echo $tbl_anggota->agama ?></td>
		      <td><?php echo $tbl_anggota->status_kawin ?></td>
		      <td><?php echo $tbl_anggota->status ?></td>
		      <td><?php echo $tbl_anggota->foto ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>