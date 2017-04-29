<?php
require_once('koneksi.php');
$data=array();
  $cek=mysqli_query($con,"select * from rombel inner join kelas using(id_kelas) where NIS = '".$_POST['id']."'");
  if(mysqli_num_rows($cek)>=1){
    $data['status']=2;
    $hasilcek=mysqli_fetch_array($cek);
    $data['rombel']=$hasilcek['NamaKelas']." Tahun ".$hasilcek['tahun'];
  }else{
    $del=mysqli_query($con,"delete from siswa where NIS = '".$_POST['id']."'");
    if($del){
      $data['status']=1;
    }else{
      $data['status']=0;
    }
  }
//}
echo json_encode($data);
?>
