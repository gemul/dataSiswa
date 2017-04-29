<?php
require_once('koneksi.php');
$data=array();
$d=mysqli_query($con,"select * from konseler where idkonseler = '".$_POST['id']."'");
if(mysqli_num_rows($d)==0){
	$data=array('status'=>'4');
}else{
	$query="update konseler set
		NamaKonseler='".mysqli_real_escape_string($con,$_POST['frmNamaKonseler'])."',
		NoHpKonseler='".mysqli_real_escape_string($con,$_POST['frmNoHpKonseler'])."',
		AlamatKonseler='".mysqli_real_escape_string($con,$_POST['frmAlamatKonseler'])."'
		where idkonseler='".$_POST['id']."'
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
