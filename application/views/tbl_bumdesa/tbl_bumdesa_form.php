<div class="content-wrapper">
	<section class="content">
		<div class="box box-warning box-solid">
			<div class="box-header with-border">
				<h3 class="box-title"><?php echo strtoupper($button) ?> DATA TBL_BUMDESA</h3>
			</div>
			<form action="<?php echo $action; ?>" method="post">
			
				<table class='table table-bordered'>
	
					<tr>
						<td width='200'>Nama Anggota <?php echo form_error('id_anggota') ?></td>
						<td>
						<?php echo cmb_dinamis('id_anggota','tbl_anggota','nama','id_anggota',$id_anggota) ?>
						</td>
					</tr>
	
					<tr>
						<td width='200'>Nama Desa <?php echo form_error('nama_desa') ?></td><td><input type="text" class="form-control" name="nama_desa" id="nama_desa" placeholder="Nama Desa" value="<?php echo $nama_desa; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Tanggal Mulai <?php echo form_error('tanggal_mulai') ?></td>
						<td><input type="date" class="form-control" name="tanggal_mulai" id="tanggal_mulai" placeholder="Tanggal Mulai" value="<?php echo $tanggal_mulai; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Tanggal Selesai <?php echo form_error('tanggal_selesai') ?></td>
						<td><input type="date" class="form-control" name="tanggal_selesai" id="tanggal_selesai" placeholder="Tanggal Selesai" value="<?php echo $tanggal_selesai; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Jenis Usaha <?php echo form_error('jenis_usaha') ?></td><td><input type="text" class="form-control" name="jenis_usaha" id="jenis_usaha" placeholder="Jenis Usaha" value="<?php echo $jenis_usaha; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Jumlah Orang <?php echo form_error('jumlah_orang') ?></td><td><input type="number" class="form-control" name="jumlah_orang" id="jumlah_orang" placeholder="Jumlah Orang" value="<?php echo $jumlah_orang; ?>" /></td>
					</tr>
	
					<tr>
						<td></td>
						<td>
							<input type="hidden" name="id_bumdesa" value="<?php echo $id_bumdesa; ?>" /> 
							<button type="submit" class="btn btn-danger"><i class="fa fa-floppy-o"></i> <?php echo $button ?></button> 
							<a href="<?php echo site_url('tbl_bumdesa') ?>" class="btn btn-info"><i class="fa fa-sign-out"></i> Kembali</a>
						</td>
					</tr>
	
				</table>
			</form>
		</div>
	</section>
</div>