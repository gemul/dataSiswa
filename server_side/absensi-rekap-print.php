<?php
require_once('koneksi.php');
$data=array();
$q=mysqli_query($con,"select * from absensi where
		NIS = '".$_GET['NIS']."' and
		TglAbsensi >= '".($_GET['tahun']-1)."-07-01' and
		TglAbsensi < '".$_GET['tahun']."-07-01'
		order by TglAbsensi desc");
if(mysqli_num_rows($q)==0){
	$data=array('zeroresult'=>true);
}elseif(mysqli_num_rows($q)<=50){
	$siswa=mysqli_fetch_array(mysqli_query($con,"select * from siswa where NIS='".$_GET['NIS']."'"));
	echo "
		<table width=100%>
			<tr>
				<td colspan=4 class='tabletitle'><span >REKAPITULASI ABSENSI</span></td>
			</tr>
			<tr>
				<td colspan=4 class='tabletitle'><span>SMK YADIKA BANGIL</span></td>
			</tr>
				<td colspan=4 class='tabletitle'></td>
			</tr>
			<tr>
				<td>NIS</td><td>: ".$siswa['NIS']."</td>
				<td>Tahun Ajaran</td><td>: ".($_GET['tahun']-1)."/".($_GET['tahun'])."</td>
			</tr>
			<tr>
				<td>Nama Siswa</td><td>: ".$siswa['NamaSiswa']."</td>
				<td></td><td></td>
			</tr>
		</table>
	";
	echo "<table class='print-table'>";
	echo "
	  <thead>
			<tr>
				<th>Bulan</th>
				<th>Sakit</th>
				<th>Ijin</th>
				<th>Alpa</th>
			</tr>
		</thead>
		<tbody>
	";
	while($qdata=mysqli_fetch_array($q)){
		$bulan=substr($qdata['TglAbsensi'],0,7);
		if(!isset($data[$bulan])){
			$data[$bulan]=array(
				'id'=>$bulan,
				'bulan'=>date('M Y',strtotime($bulan."-01")),
				'sakit'=>0,
				'ijin'=>0,
				'alpa'=>0,
			);
		}
		if($qdata['Absensi']=='S'){
			$data[$bulan]['sakit']++;
		}elseif($qdata['Absensi']=='I'){
			$data[$bulan]['ijin']++;
		}elseif($qdata['Absensi']=='A'){
			$data[$bulan]['alpa']++;
		}
	}
	foreach($data as $item){
			echo "
					<tr>
			";
			echo "<td>".$item['bulan']."</td>";
			echo "<td>".$item['sakit']."</td>";
			echo "<td>".$item['ijin']."</td>";
			echo "<td>".$item['alpa']."</td>";
			echo "
				</tr>
			";
	}
	echo "
		</tbody>
	</table>
	";
	echo "
	<table WIDTH=100%>
		<tr>
			<td>Mengetahui,</td>
			<td></td>
			<td></td>
		<tr>
			<td>Kepala Sekolah</td>
			<td></td>
			<td>Wali kelas</td>
		<tr>
			<td colspan=3></td>
		</tr>
		</tr>
		<td><U>ROBBIANTO,S.KOM</U></td>
		<td></td>
		<td>.......................</td>
		</tr>
	</table>
	";
}else{
	$data=array('encumbered'=>true);
}


?>
<style>
.print-table {
	border-collapse:collapse;
	width:100%;
}
.print-table th {
	border:1px solid #000;
}
.print-table td {
	border:1px solid #000;
}
.tabletitle {
	font-size:16px;
	text-align:center;
}
</style>
