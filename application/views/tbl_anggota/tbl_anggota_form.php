<div class="content-wrapper">
	<section class="content">
		<div class="box box-warning box-solid">
			<div class="box-header with-border">
				<h3 class="box-title"><?php echo strtoupper($button) ?> DATA TBL_ANGGOTA</h3>
			</div>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			
				<table class='table table-bordered'>
	
					<tr>
						<td width='200'>NIK <?php echo form_error('nik') ?></td><td><input type="number" class="form-control" name="nik" id="nik" placeholder="Nik" value="<?php echo $nik; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>No KK <?php echo form_error('no_kk') ?></td><td><input type="number" class="form-control" name="no_kk" id="no_kk" placeholder="No Kk" value="<?php echo $no_kk; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Nama <?php echo form_error('nama') ?></td><td><input type="text" class="form-control" name="nama" id="nama" placeholder="Nama" value="<?php echo $nama; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Tempat Lahir <?php echo form_error('tempat_lahir') ?></td><td><input type="text" class="form-control" name="tempat_lahir" id="tempat_lahir" placeholder="Tempat Lahir" value="<?php echo $tempat_lahir; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Tanggal Lahir <?php echo form_error('tanggal_lahir') ?></td>
						<td><input type="date" class="form-control" name="tanggal_lahir" id="tanggal_lahir" placeholder="Tanggal Lahir" value="<?php echo $tanggal_lahir; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Jenis Kelamin <?php echo form_error('jenis_kelamin') ?></td>
						<td>
						<select id="jenis_kelamin" name="jenis_kelamin" class="form-control">
							<option value="L" <?php echo ("L" == $jenis_kelamin) ? 'selected' : ''; ?>>Laki-laki</option>
							<option value="P" <?php echo ("P" == $jenis_kelamin) ? 'selected' : ''; ?>>Perempuan</option>
						</select>
						</td>
					</tr>
	    
					<tr>
						<td width='200'>Alamat <?php echo form_error('alamat') ?></td>
						<td> <textarea class="form-control" rows="3" name="alamat" id="alamat" placeholder="Alamat"><?php echo $alamat; ?></textarea></td>
					</tr>
	
					<tr>
						<td width='200'>Kota <?php echo form_error('kota') ?></td><td><input type="text" class="form-control" name="kota" id="kota" placeholder="Kota" value="<?php echo $kota; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>RT <?php echo form_error('rt') ?></td><td><input type="number" class="form-control" name="rt" id="rt" placeholder="Rt" value="<?php echo $rt; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>RW <?php echo form_error('rw') ?></td><td><input type="number" class="form-control" name="rw" id="rw" placeholder="Rw" value="<?php echo $rw; ?>" /></td>
					</tr>
	
					<tr>
						<td width='200'>Agama <?php echo form_error('agama') ?></td>
						<td>
						<select id="agama" name="agama" class="form-control">
							<option value="Islam" <?php echo ("Islam" == $agama) ? 'selected' : ''; ?>>Islam</option>
							<option value="Kristen" <?php echo ("Kristen" == $agama) ? 'selected' : ''; ?>>Kristen</option>
							<option value="Katolik" <?php echo ("Katolik" == $agama) ? 'selected' : ''; ?>>Katolik</option>
							<option value="Hindu" <?php echo ("Hindu" == $agama) ? 'selected' : ''; ?>>Hindu</option>
							<option value="Buddha" <?php echo ("Buddha" == $agama) ? 'selected' : ''; ?>>Buddha</option>
							<option value="Konghucu" <?php echo ("Konghucu" == $agama) ? 'selected' : ''; ?>>Konghucu</option>
							<option value="Lainnya" <?php echo ("Lainnya" == $agama) ? 'selected' : ''; ?>>Lainnya</option>
						</select>
						</td>
					</tr>
	
					<tr>
						<td width='200'>Status Kawin <?php echo form_error('status_kawin') ?></td>
						<td>
						<select id="status_kawin" name="status_kawin" class="form-control">
							<option value="Belum Menikah" <?php echo ("Belum Menikah" == $status_kawin) ? 'selected' : ''; ?>>Belum Menikah</option>
							<option value="Menikah" <?php echo ("Menikah" == $status_kawin) ? 'selected' : ''; ?>>Menikah</option>
							<option value="Cerai" <?php echo ("Cerai" == $status_kawin) ? 'selected' : ''; ?>>Cerai</option>
							<option value="Janda" <?php echo ("Janda" == $status_kawin) ? 'selected' : ''; ?>>Janda</option>
							<option value="Duda" <?php echo ("Duda" == $status_kawin) ? 'selected' : ''; ?>>Duda</option>
						</select>
						</td>
					</tr>
	
					<tr>
						<td width='200'>Status <?php echo form_error('status') ?></td>
						<td>
						<select id="status" name="status" class="form-control">
							<option value="Ada" <?php echo ("Ada" == $status) ? 'selected' : ''; ?>>Ada</option>
							<option value="Meninggal" <?php echo ("Meninggal" == $status) ? 'selected' : ''; ?>>Meninggal</option>
							<option value="Pindah" <?php echo ("Pindah" == $status) ? 'selected' : ''; ?>>Pindah</option>
						</select>	
						</td>
					</tr>
	    
					<tr>
						<td width='200'>Foto</td>
						<td> <input type="file" class="form-control" rows="3" name="foto" id="foto" placeholder="Foto" value="<?php echo $foto; ?>"></td>
					</tr>
	
					<tr>
						<td></td>
						<td>
							<input type="hidden" name="id_anggota" value="<?php echo $id_anggota; ?>" /> 
							<button type="submit" class="btn btn-danger"><i class="fa fa-floppy-o"></i> <?php echo $button ?></button> 
							<a href="<?php echo site_url('tbl_anggota') ?>" class="btn btn-info"><i class="fa fa-sign-out"></i> Kembali</a>
						</td>
					</tr>
	
				</table>
			</form>
		</div>
	</section>
</div>