<?php
require_once('koneksi.php');
$data=array();
$q=mysqli_query($con,"select * from siswa where NamaSiswa like '%".$_POST['filter']."%' or NIS like '%".$_POST['filter']."%' order by NIS asc limit 0,51");
if(mysqli_num_rows($q)==0){
	$data=array('zeroresult'=>true);
}elseif(mysqli_num_rows($q)<=50){
	while($qdata=mysqli_fetch_array($q)){
		$data[]=array(
			'id'=>$qdata['NIS'],
			'nis'=>$qdata['NIS'],
			'nama'=>$qdata['NamaSiswa'],
			'ortu'=>$qdata['NamaOrtu'],
			'hportu'=>$qdata['NoHpOrtu'],
		);
	}
}else{
	$data=array('encumbered'=>true);
}
echo json_encode($data);
?>
