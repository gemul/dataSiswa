<?php
require_once('koneksi.php');
$data=array();
$d=mysqli_query($con,"select * from konseling where WaktuKonseling = '".$_POST['WaktuKonseling']."' and NIS='".$_POST['NIS']."'");
if(mysqli_num_rows($d)==0){
	$query="insert into konseling
	(NIS, WaktuKonseling, KedatanganKonseling, DataKonseling, DataPenting, DiagnosaMasalah, AlternatifPemecahan, PutusanMasalah, RencanaLayanan, EvaluasiHasil, Penanganan)
	values
	('".$_POST['NIS']."', '".$_POST['WaktuKonseling']."', '".$_POST['KedatanganKonseling']."', '".$_POST['DataKonseling']."', '".$_POST['DataPenting']."', '".$_POST['DiagnosaMasalah']."', '".$_POST['AlternatifPemecahan']."', '".$_POST['PutusanMasalah']."', '".$_POST['RencanaLayanan']."', '".$_POST['EvaluasiHasil']."', '".$_POST['Penanganan']."')
	";
}else{
	$query="update konseling set
	KedatanganKonseling='".$_POST['KedatanganKonseling']."', DataKonseling='".$_POST['DataKonseling']."', DataPenting='".$_POST['DataPenting']."', DiagnosaMasalah='".$_POST['DiagnosaMasalah']."', AlternatifPemecahan='".$_POST['AlternatifPemecahan']."', PutusanMasalah='".$_POST['PutusanMasalah']."', RencanaLayanan='".$_POST['RencanaLayanan']."', EvaluasiHasil='".$_POST['EvaluasiHasil']."', Penanganan='".$_POST['Penanganan']."'
	where NIS='".$_POST['NIS']." ' and WaktuKonseling='".$_POST['WaktuKonseling']." '
	";
}

$q=mysqli_query($con,$query);
if($q){
	$data=array('status'=>'1','message'=>mysqli_error($con));
}else{
	$data=array('status'=>'3','message'=>mysqli_error($con),'query'=>$query);
}
echo json_encode($data);
?>
