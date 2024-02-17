<div class="content-wrapper">
	<section class="content">
		<div class="box box-warning box-solid">
			<div class="box-header with-border">
				<h3 class="box-title"><?php echo strtoupper($button) ?> DATA TBL_ADAT</h3>
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
						<td width='200'>Ruangan <?php echo form_error('ruangan') ?></td><td><input type="text" class="form-control" name="ruangan" id="ruangan" placeholder="Ruangan" value="<?php echo $ruangan; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Suku <?php echo form_error('suku') ?></td>
						<td>
						<select id="suku" name="suku" class="form-control">
							<option value="Banjar" <?php echo ("Islam" == $suku) ? 'selected' : ''; ?>>Banjar</option>
							<option value="Jawa" <?php echo ("Jawa" == $suku) ? 'selected' : ''; ?>>Jawa</option>
							<option value="Batak" <?php echo ("Batak" == $suku) ? 'selected' : ''; ?>>Batak</option>
							<option value="Sunda" <?php echo ("Sunda" == $suku) ? 'selected' : ''; ?>>Sunda</option>
							<option value="Madura" <?php echo ("Madura" == $suku) ? 'selected' : ''; ?>>Madura</option>
							<option value="Bugis" <?php echo ("Bugis" == $suku) ? 'selected' : ''; ?>>Bugis</option>
							<option value="Lainnya" <?php echo ("Lainnya" == $suku) ? 'selected' : ''; ?>>Lainnya</option>
						</select>
						</td>
					</tr>
	
					<tr>
						<td></td>
						<td>
							<input type="hidden" name="id_adat" value="<?php echo $id_adat; ?>" /> 
							<button type="submit" class="btn btn-danger"><i class="fa fa-floppy-o"></i> <?php echo $button ?></button> 
							<a href="<?php echo site_url('tbl_adat') ?>" class="btn btn-info"><i class="fa fa-sign-out"></i> Kembali</a>
						</td>
					</tr>
	
				</table>
			</form>
		</div>
	</section>
</div>