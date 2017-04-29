<?php
require_once('koneksi.php');
$data=array();
$q=mysqli_query($con,"select * from walikelas
 	left join kelas using(id_kelas)
	where NamaWaliKelas like '%".$_POST['filter']."%' order by NamaWaliKelas asc limit 0,51");
if(mysqli_num_rows($q)==0){
	$data=array('zeroresult'=>true);
}elseif(mysqli_num_rows($q)<=50){
	while($qdata=mysqli_fetch_array($q)){
		$data[]=array(
			'id'=>$qdata['id_walikelas'],
			'nama'=>$qdata['NamaWaliKelas'],
			'hp'=>$qdata['NoHPWali'],
			'namakelas'=>$qdata['NamaKelas'],
		);
	}
}else{
	$data=array('encumbered'=>true);
}
echo json_encode($data);
?>
