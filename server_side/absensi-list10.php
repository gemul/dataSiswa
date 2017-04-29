<?php
require_once('koneksi.php');
$data=array();
$q=mysqli_query($con,"select * from absensi where NIS = '".$_GET['NIS']."' order by TglAbsensi desc limit 0,10");
if(mysqli_num_rows($q)==0){
	$data=array('zeroresult'=>true);
}elseif(mysqli_num_rows($q)<=50){
	while($qdata=mysqli_fetch_array($q)){
		if($qdata['Absensi']=='S'){
			$alasan="Sakit";
		}elseif($qdata['Absensi']=='I'){
			$alasan="Izin";
		}else{
			$alasan="Alpa";
		}
		$data[]=array(
			'id'=>$qdata['IdAbsensi'],
			'TglAbsensi'=>date('d F Y',strtotime($qdata['TglAbsensi'])),
			'Absensi'=>$alasan,
		);
	}
}else{
	$data=array('encumbered'=>true);
}
echo json_encode($data);
?>
