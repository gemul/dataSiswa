<?php
require_once('koneksi.php');
$q=mysqli_query($con,"select * from kelas");
if(mysqli_num_rows($q)==0){
	echo "";
}elseif(mysqli_num_rows($q)<=50){
	while($qdata=mysqli_fetch_array($q)){
    echo "<option value='".$qdata['id_kelas']."'>".$qdata['NamaKelas']."</option>";
	}
}else{
  echo "";
}
?>
