<?php
require_once('koneksi.php');
$data=array();
  $del=mysqli_query($con,"delete from rombel where id_rombel = '".$_POST['id']."'");
  if($del){
    $data['status']=1;
  }else{
    $data['status']=0;
  }
//}
echo json_encode($data);
?>
