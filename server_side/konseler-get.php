<?php
require_once('koneksi.php');
$data=array();
$query="
	select * from konseler where idkonseler='".mysqli_real_escape_string($con,$_POST['id'])."'
";
$q=mysqli_query($con,$query);
if(!$q){
	$data=array('status'=>'3','message'=>mysqli_error($con),'query'=>$query);
}elseif(mysqli_num_rows($q)>=1){
	while($res=mysqli_fetch_array($q)){
		$data=array('status'=>'1','message'=>mysqli_error($con),'query'=>$query,'dataKonseler'=>$res);
	}
}else{

	$data=array('status'=>'2','message'=>mysqli_error($con),'query'=>$query);

}
echo json_encode($data);
?>
