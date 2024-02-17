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
        <h2>Tbl_transmigrasi List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Id Anggota</th>
		<th>Tanggal Mulai</th>
		<th>Tanggal Selesai</th>
		<th>Asal Kota</th>
		<th>Kota Tujuan</th>
		
            </tr><?php
            foreach ($tbl_transmigrasi_data as $tbl_transmigrasi)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $tbl_transmigrasi->id_anggota ?></td>
		      <td><?php echo $tbl_transmigrasi->tanggal_mulai ?></td>
		      <td><?php echo $tbl_transmigrasi->tanggal_selesai ?></td>
		      <td><?php echo $tbl_transmigrasi->asal_kota ?></td>
		      <td><?php echo $tbl_transmigrasi->kota_tujuan ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>