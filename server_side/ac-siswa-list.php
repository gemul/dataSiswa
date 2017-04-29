<?php
require_once('koneksi.php');
$data=array("suggestions"=>Array());
$q=mysqli_query($con,"select * from siswa where NamaSiswa like '%".$_GET['query']."%' or NIS like '%".$_GET['query']."%' order by NIS asc limit 0,51");
if(mysqli_num_rows($q)==0){
	$data=array('zeroresult'=>true);
}elseif(mysqli_num_rows($q)<=50){
	while($qdata=mysqli_fetch_array($q)){
		$data['suggestions'][]=array(
			'value'=>$qdata['NIS']." ".$qdata['NamaSiswa'],
			'data'=>$qdata['NIS'],
		);
	}
}else{
	$data=array('encumbered'=>true);
}
echo json_encode($data);
?>
