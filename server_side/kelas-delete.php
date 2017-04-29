<?php
require_once('koneksi.php');
$data=array();
$q=mysqli_query($con,"select * from walikelas where id_kelas = '".$_POST['id']."'");
$q2=mysqli_query($con,"select * from rombel where id_kelas = '".$_POST['id']."'");
if(mysqli_num_rows($q)+mysqli_num_rows($q)!=0){
	$data=array('dependent'=>true);
}else{
  $del=mysqli_query($con,"delete from kelas	where id_kelas = '".$_POST['id']."'");
  if($del){
    $data['status']=1;
  }else{
    $data['status']=0;
  }
}
echo json_encode($data);
?>
