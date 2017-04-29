<?php
require_once('koneksi.php');
$data=array();
//$cek=mysqli_query($con,"select * from walikelas where idWa = '".$_POST['NIS']."'");
if(1==2){//mysqli_num_rows($cek)>=1){
	$data=array('status'=>'2');
}else{
	$query="insert into kelas (
		NamaKelas
		)
		values
		(
		'".mysqli_real_escape_string($con,$_POST['frmNamaKelas'])."'
		)
	";
	$q=mysqli_query($con,$query);
	if($q){
		$data=array('status'=>'1','message'=>mysqli_error($con));
	}else{
		$data=array('status'=>'3','message'=>mysqli_error($con),'query'=>$query);
	}
}
echo json_encode($data);
?>
