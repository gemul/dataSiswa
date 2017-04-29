<?php
require_once('koneksi.php');
$data=array();
if($_POST['Absensi']=="M"){
	$query="delete from absensi where TglAbsensi = '".$_POST['TglAbsensi']."' and NIS='".$_POST['NIS']."'";
}else{
	$d=mysqli_query($con,"select * from absensi where TglAbsensi = '".$_POST['TglAbsensi']."' and NIS='".$_POST['NIS']."'");
	if(mysqli_num_rows($d)==0){
		$query="insert into absensi (TglAbsensi,NIS,Absensi) values ('".$_POST['TglAbsensi']."','".$_POST['NIS']."','".$_POST['Absensi']."')";
	}else{
		$query="update absensi set Absensi='".$_POST['Absensi']."' where NIS='".$_POST['NIS']." ' and TglAbsensi='".$_POST['TglAbsensi']." '
		";
	}
}
$q=mysqli_query($con,$query);
if($q){
	$data=array('status'=>'1','message'=>mysqli_error($con));
}else{
	$data=array('status'=>'3','message'=>mysqli_error($con),'query'=>$query);
}
echo json_encode($data);
?>
