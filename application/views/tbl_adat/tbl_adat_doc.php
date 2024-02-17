<!doctype html>
<html>

<head>
    <title>codeigniter crud generator</title>
    <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>" />
    <style>
        .word-table {
            border: 1px solid black !important;
            border-collapse: collapse !important;
            width: 100%;
        }

        .word-table tr th,
        .word-table tr td {
            border: 1px solid black !important;
            padding: 5px 10px;
        }
    </style>
</head>

<body>
    <h2>Tbl_adat List</h2>
    <table class="word-table" style="margin-bottom: 10px">
        <tr>
            <th>No</th>
            <th>Id Anggota</th>
            <th>Tanggal Mulai</th>
            <th>Tanggal Selesai</th>
            <th>Ruangan</th>
            <th>Suku</th>

        </tr><?php
                foreach ($tbl_adat_data as $tbl_adat) {
                ?>
            <tr>
                <td><?php echo ++$start ?></td>
                <td><?php echo $tbl_adat->id_anggota ?></td>
                <td><?php echo $tbl_adat->tanggal_mulai ?></td>
                <td><?php echo $tbl_adat->tanggal_selesai ?></td>
                <td><?php echo $tbl_adat->ruangan ?></td>
                <td><?php echo $tbl_adat->suku ?></td>
            </tr>
        <?php
                }
        ?>
    </table>
</body>

</html>