<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-warning box-solid">
    
                    <div class="box-header">
                        <h3 class="box-title">KELOLA DATA TBL_ANGGOTA</h3>
                    </div>
        
        <div class="box-body">
            <div class='row'>
            <div class='col-md-9'>
            <div style="padding-bottom: 10px;"'>
        <?php echo anchor(site_url('tbl_anggota/create'), '<i class="fa fa-wpforms" aria-hidden="true"></i> Tambah Data', 'class="btn btn-danger btn-sm"'); ?>
		<?php echo anchor(site_url('tbl_anggota/word'), '<i class="fa fa-file-word-o" aria-hidden="true"></i> Export Ms Word', 'class="btn btn-primary btn-sm"'); ?></div>
            </div>
            <div class='col-md-3'>
            <form action="<?php echo site_url('tbl_anggota/index'); ?>" class="form-inline" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" name="q" value="<?php echo $q; ?>">
                        <span class="input-group-btn">
                            <?php 
                                if ($q <> '')
                                {
                                    ?>
                                    <a href="<?php echo site_url('tbl_anggota'); ?>" class="btn btn-default">Reset</a>
                                    <?php
                                }
                            ?>
                          <button class="btn btn-primary" type="submit">Search</button>
                        </span>
                    </div>
                </form>
            </div>
            </div>
        
   
        <div class="row" style="margin-bottom: 10px">
            <div class="col-md-4 text-center">
                <div style="margin-top: 8px" id="message">
                    <?php echo $this->session->userdata('message') <> '' ? $this->session->userdata('message') : ''; ?>
                </div>
            </div>
            <div class="col-md-1 text-right">
            </div>
            <div class="col-md-3 text-right">
                
            </div>
        </div>
        <table class="table table-bordered" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>NIK</th>
		<th>No KK</th>
		<th>Nama</th>
		<th>Tempat Lahir</th>
		<th>Tanggal Lahir</th>
		<th>Jenis Kelamin</th>
		<th>Alamat</th>
		<th>Kota</th>
		<th>RT/RW</th>
		<th>Agama</th>
		<th>Status Kawin</th>
		<th>Status</th>
		<th>Foto</th>
		<th>Action</th>
            </tr><?php
            foreach ($tbl_anggota_data as $tbl_anggota)
            {
                ?>
                <tr>
			<td width="10px"><?php echo ++$start ?></td>
			<td><?php echo $tbl_anggota->nik ?></td>
			<td><?php echo $tbl_anggota->no_kk ?></td>
			<td><?php echo $tbl_anggota->nama ?></td>
			<td><?php echo $tbl_anggota->tempat_lahir ?></td>
			<td><?php echo $tbl_anggota->tanggal_lahir ?></td>
			<td>
                <?php 
                    if($tbl_anggota->jenis_kelamin == "L") {
                        echo "Laki-laki";
                    } elseif($tbl_anggota->jenis_kelamin == "P") {
                        echo "Perempuan";
                    }
                ?>
             </td>
			<td><?php echo $tbl_anggota->alamat ?></td>
			<td><?php echo $tbl_anggota->kota ?></td>
			<td><?php echo $tbl_anggota->rt ?>/<?php echo $tbl_anggota->rw ?></td>
			<td><?php echo $tbl_anggota->agama ?></td>
			<td><?php echo $tbl_anggota->status_kawin ?></td>
			<td><?php echo $tbl_anggota->status ?></td>
			<td><img src="<?php echo base_url() ?>assets/foto_profil/<?php echo $tbl_anggota->foto; ?>" class="user-image" alt="User Image" width="150px"></td>
			<td style="text-align:center" width="200px">
				<?php 
				//echo anchor(site_url('tbl_anggota/read/'.$tbl_anggota->id_anggota),'<i class="fa fa-eye" aria-hidden="true"></i>','class="btn btn-danger btn-sm"'); 
				//echo '  '; 
				echo anchor(site_url('tbl_anggota/update/'.$tbl_anggota->id_anggota),'<i class="fa fa-pencil-square-o" aria-hidden="true"></i>','class="btn btn-danger btn-sm"'); 
				echo '  '; 
				echo anchor(site_url('tbl_anggota/delete/'.$tbl_anggota->id_anggota),'<i class="fa fa-trash-o" aria-hidden="true"></i>','class="btn btn-danger btn-sm" Delete','onclick="javasciprt: return confirm(\'Are You Sure ?\')"'); 
				?>
			</td>
		</tr>
                <?php
            }
            ?>
        </table>
        <div class="row">
            <div class="col-md-6">
                
	    </div>
            <div class="col-md-6 text-right">
                <?php echo $pagination ?>
            </div>
        </div>
        </div>
                    </div>
            </div>
            </div>
    </section>
</div>