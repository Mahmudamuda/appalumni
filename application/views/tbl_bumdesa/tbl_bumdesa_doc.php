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
        <h2>Tbl_bumdesa List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Id Anggota</th>
		<th>Nama Desa</th>
		<th>Tanggal Mulai</th>
		<th>Tanggal Selesai</th>
		<th>Jenis Usaha</th>
		<th>Jumlah Orang</th>
		
            </tr><?php
            foreach ($tbl_bumdesa_data as $tbl_bumdesa)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $tbl_bumdesa->id_anggota ?></td>
		      <td><?php echo $tbl_bumdesa->nama_desa ?></td>
		      <td><?php echo $tbl_bumdesa->tanggal_mulai ?></td>
		      <td><?php echo $tbl_bumdesa->tanggal_selesai ?></td>
		      <td><?php echo $tbl_bumdesa->jenis_usaha ?></td>
		      <td><?php echo $tbl_bumdesa->jumlah_orang ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>