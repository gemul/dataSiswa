<?php
require_once('koneksi.php');
$data=array();
$q=mysqli_query($con,"select * from kelas
	where NamaKelas like '%".$_POST['filter']."%' order by NamaKelas asc limit 0,51");
if(mysqli_num_rows($q)==0){
	$data=array('zeroresult'=>true);
}elseif(mysqli_num_rows($q)<=50){
	while($qdata=mysqli_fetch_array($q)){
		$data[]=array(
			'id'=>$qdata['id_kelas'],
			'namakelas'=>$qdata['NamaKelas']
		);
	}
}else{
	$data=array('encumbered'=>true);
}
echo json_encode($data);
?>
