<div class="content-wrapper">
	<section class="content">
		<div class="box box-warning box-solid">
			<div class="box-header with-border">
				<h3 class="box-title"><?php echo strtoupper($button) ?> DATA TBL_PRUKADES</h3>
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
						<td width='200'>Tanggal Mulai <?php echo form_error('tanggal_mulai') ?></td>
						<td><input type="date" class="form-control" name="tanggal_mulai" id="tanggal_mulai" placeholder="Tanggal Mulai" value="<?php echo $tanggal_mulai; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Tanggal Selesai <?php echo form_error('tanggal_selesai') ?></td>
						<td><input type="date" class="form-control" name="tanggal_selesai" id="tanggal_selesai" placeholder="Tanggal Selesai" value="<?php echo $tanggal_selesai; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Nama Desa <?php echo form_error('nama_desa') ?></td><td><input type="text" class="form-control" name="nama_desa" id="nama_desa" placeholder="Nama Desa" value="<?php echo $nama_desa; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Kegiatan <?php echo form_error('kegiatan') ?></td><td><input type="text" class="form-control" name="kegiatan" id="kegiatan" placeholder="Kegiatan" value="<?php echo $kegiatan; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Jumlah Orang <?php echo form_error('jumlah_orang') ?></td><td><input type="number" class="form-control" name="jumlah_orang" id="jumlah_orang" placeholder="Jumlah Orang" value="<?php echo $jumlah_orang; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Nama Produk <?php echo form_error('nama_produk') ?></td><td><input type="text" class="form-control" name="nama_produk" id="nama_produk" placeholder="Nama Produk" value="<?php echo $nama_produk; ?>" /></td>
					</tr>
	
					<tr>
						<td></td>
						<td>
							<input type="hidden" name="id_prukades" value="<?php echo $id_prukades; ?>" /> 
							<button type="submit" class="btn btn-danger"><i class="fa fa-floppy-o"></i> <?php echo $button ?></button> 
							<a href="<?php echo site_url('tbl_prukades') ?>" class="btn btn-info"><i class="fa fa-sign-out"></i> Kembali</a>
						</td>
					</tr>
	
				</table>
			</form>
		</div>
	</section>
</div>