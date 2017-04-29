<?php
require_once('koneksi.php');
if(!$_GET['a']){
  echo json_encode(array('status'=>0,'message'=>'no action'));
}elseif($_GET['a']=='login'){
  $return=array();
  $node=mysqli_query($con,"select * from cyNodes where nodeID='".mysqli_real_escape_string($con,$_POST['nodeID'])."'");
  if(mysqli_num_rows($node)>=1){
    $stamp=time();
    $return['token']=md5($_POST['nodeID'].$stamp);
    $node=mysqli_query($con,"update cyNodes set tokenString='".$return['token']."',status=2 where nodeID='".mysqli_real_escape_string($con,$_POST['nodeID'])."'");
    $user=mysqli_query($con,"select * from users where username='".mysqli_real_escape_string($con,$_POST['username'])."' and password='".md5($_POST['password'])."'");    if(mysqli_num_rows($user)>=1){
      $return['status']='ok';
      $userData=mysqli_fetch_array($user);
      $return['username']=$userData['username'];
      $return['nama']=$userData['nama'];
      $return['id']=$userData['id'];
    }else{
      $return['status']='invalid login';
    }
  }else{
    $return['status']='node unrecognized';
  }
  echo json_encode($return);
}elseif($_GET['a']=='ping'){
  $return=array();
  $node=mysqli_query($con,"select * from cyNodes where token='".mysqli_real_escape_string($con,$_POST['token'])."'");
  if(mysqli_num_rows($node)>=1){
    $nodeData=mysqli_fetch_array($node);
    $return['status']=$nodeData['status'];
  }else{
    $return['status']=0;
  }
  echo json_encode($return);
}
?>
