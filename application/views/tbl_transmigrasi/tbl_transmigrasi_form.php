<div class="content-wrapper">
	<section class="content">
		<div class="box box-warning box-solid">
			<div class="box-header with-border">
				<h3 class="box-title"><?php echo strtoupper($button) ?> DATA TBL_TRANSMIGRASI</h3>
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
						<td width='200'>Asal Kota <?php echo form_error('asal_kota') ?></td><td><input type="text" class="form-control" name="asal_kota" id="asal_kota" placeholder="Asal Kota" value="<?php echo $asal_kota; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Kota Tujuan <?php echo form_error('kota_tujuan') ?></td><td><input type="text" class="form-control" name="kota_tujuan" id="kota_tujuan" placeholder="Kota Tujuan" value="<?php echo $kota_tujuan; ?>" /></td>
					</tr>
	
					<tr>
						<td></td>
						<td>
							<input type="hidden" name="id_transmigrasi" value="<?php echo $id_transmigrasi; ?>" /> 
							<button type="submit" class="btn btn-danger"><i class="fa fa-floppy-o"></i> <?php echo $button ?></button> 
							<a href="<?php echo site_url('tbl_transmigrasi') ?>" class="btn btn-info"><i class="fa fa-sign-out"></i> Kembali</a>
						</td>
					</tr>
	
				</table>
			</form>
		</div>
	</section>
</div>