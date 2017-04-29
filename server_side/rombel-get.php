<?php
require_once('koneksi.php');
$data=array();
$query="
	select * from kelas
	left join walikelas using(id_kelas)
	 where id_kelas='".mysqli_real_escape_string($con,$_POST['id'])."'
";
$q=mysqli_query($con,$query);
if(!$q){
	$data=array('status'=>'3','message'=>mysqli_error($con),'query'=>$query);
}elseif(mysqli_num_rows($q)>=1){
	while($res=mysqli_fetch_array($q)){
		$data=array('status'=>'1','message'=>mysqli_error($con),'query'=>$query,'dataKelas'=>$res);
	}
	$rombel=mysqli_query($con,"select * from rombel inner join siswa using(NIS) where id_kelas='".mysqli_real_escape_string($con,$_POST['id'])."' order by NamaSiswa asc");
	$data['jumlah']=mysqli_num_rows($rombel);
	$data['dataSiswa']=array();
	while($res=mysqli_fetch_array($rombel)){
		$data['dataSiswa'][]=array('id'=>$res['id_rombel'],'NIS'=>$res['NIS'],'NamaSiswa'=>$res['NamaSiswa'],);
	}
}else{

	$data=array('status'=>'2','message'=>mysqli_error($con),'query'=>$query);

}
echo json_encode($data);
?>
