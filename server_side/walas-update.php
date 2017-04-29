<?php
require_once('koneksi.php');
$data=array();
$d=mysqli_query($con,"select * from walikelas where id_walikelas = '".$_POST['id']."'");
if(mysqli_num_rows($d)==0){
	$data=array('status'=>'4');
}else{
	$query="update walikelas set
		NamaWaliKelas='".mysqli_real_escape_string($con,$_POST['frmNamaWaliKelas'])."',
		NoHPWali='".mysqli_real_escape_string($con,$_POST['frmNoHPWali'])."',
		id_kelas='".mysqli_real_escape_string($con,$_POST['frmid_kelas'])."'
		where id_walikelas='".$_POST['id']."'
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
