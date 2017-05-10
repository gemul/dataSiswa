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
}else{
	$data=array('encumbered'=>true);
}
echo json_encode($data);
?>
