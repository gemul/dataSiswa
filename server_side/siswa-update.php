<?php
require_once('koneksi.php');
$data=array();
$d=mysqli_query($con,"select * from siswa where NIS = '".$_POST['id']."'");
if(mysqli_num_rows($d)==0){
	$data=array('status'=>'4');
}else{
	$query="update siswa set
		NIS='".mysqli_real_escape_string($con,$_POST['frmNIS'])."',
		NamaSiswa='".mysqli_real_escape_string($con,$_POST['frmNamaSiswa'])."',
		NamaPanggilan='".mysqli_real_escape_string($con,$_POST['frmNamaPanggilan'])."',
		TempatLahir='".mysqli_real_escape_string($con,$_POST['frmTempatLahir'])."',
		TglLahir='".mysqli_real_escape_string($con,$_POST['frmTglLahir'])."',
		AlamatSiswa='".mysqli_real_escape_string($con,$_POST['frmAlamatSiswa'])."',
		Agama='".mysqli_real_escape_string($con,$_POST['frmAgama'])."',
		CitaCita='".mysqli_real_escape_string($con,$_POST['frmCitaCita'])."',
		NamaOrtu='".mysqli_real_escape_string($con,$_POST['frmNamaOrtu'])."',
		AlamatOrtu='".mysqli_real_escape_string($con,$_POST['frmAlamatOrtu'])."',
		NoHpOrtu='".mysqli_real_escape_string($con,$_POST['frmNoHpOrtu'])."',
		KelaminSiswa='".mysqli_real_escape_string($con,$_POST['frmKelaminSiswa'])."',
		NamaSekolah_SD_MI='".mysqli_real_escape_string($con,$_POST['frmNamaSekolah_SD_MI'])."',
		TahunSekolah_SD_MI='".mysqli_real_escape_string($con,$_POST['frmTahunSekolah_SD_MI'])."',
		NilaiNUN_SD_MI='".mysqli_real_escape_string($con,$_POST['frmNilaiNUN_SD_MI'])."',
		NamaSekolah_SMP_MTS='".mysqli_real_escape_string($con,$_POST['frmNamaSekolah_SMP_MTS'])."',
		TahunSekolah_SMP_MTS='".mysqli_real_escape_string($con,$_POST['frmTahunSekolah_SMP_MTS'])."',
		NilaiNUN_SMP_MTS='".mysqli_real_escape_string($con,$_POST['frmNilaiNUN_SMP_MTS'])."'
		where NIS='".$_POST['id']."'
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
