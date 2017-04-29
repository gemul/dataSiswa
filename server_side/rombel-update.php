<?php
require_once('koneksi.php');
$data=array();
$d=mysqli_query($con,"select * from rombel where NIS = '".$_POST['NIS']."' and tahun='".$_POST['tahun']."'");
if(mysqli_num_rows($d)==0){
	$query="insert into rombel (id_kelas,NIS,idkonseler,tahun) value (
		'".mysqli_real_escape_string($con,$_POST['id_kelas'])."',
		'".mysqli_real_escape_string($con,$_POST['NIS'])."',
		'0',
		'".mysqli_real_escape_string($con,$_POST['tahun'])."'
	)
	";
	$q=mysqli_query($con,$query);
	if($q){
		$data=array('status'=>'1','message'=>mysqli_error($con));
	}else{
		$data=array('status'=>'3','message'=>mysqli_error($con),'query'=>$query);
	}
}else{
	$query="update rombel set id_kelas = '".$_POST['id_kelas']."' where NIS = '".$_POST['NIS']."' and tahun = '".$_POST['tahun']."' ";
	$q=mysqli_query($con,$query);
	if($q){
		$data=array('status'=>'1','message'=>mysqli_error($con));
	}else{
		$data=array('status'=>'3','message'=>mysqli_error($con),'query'=>$query);
	}
}
echo json_encode($data);
?>
