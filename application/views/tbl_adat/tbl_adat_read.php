
<div class="content-wrapper">
	
	<section class="content">
		<div class="box box-warning box-solid">
			<div class="box-header with-border">
				<h3 class="box-title">DETAIL DATA TBL_ADAT</h3>
			</div>
		
		<table class='table table-bordered'>        

	
			<tr>
				<td>Id Anggota</td>
				<td><?php echo $id_anggota; ?></td>
			</tr>
	
			<tr>
				<td>Tanggal Mulai</td>
				<td><?php echo $tanggal_mulai; ?></td>
			</tr>
	
			<tr>
				<td>Tanggal Selesai</td>
				<td><?php echo $tanggal_selesai; ?></td>
			</tr>
	
			<tr>
				<td>Ruangan</td>
				<td><?php echo $ruangan; ?></td>
			</tr>
	
			<tr>
				<td>Suku</td>
				<td><?php echo $suku; ?></td>
			</tr>
	
			<tr>
				<td></td>
				<td><a href="<?php echo site_url('tbl_adat') ?>" class="btn btn-default">Kembali</a></td>
			</tr>
	
		</table>
		</div>
	</section>
</div>