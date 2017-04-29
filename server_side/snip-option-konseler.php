<?php
require_once('koneksi.php');
$q=mysqli_query($con,"select * from konseler");
if(mysqli_num_rows($q)==0){
	echo "";
}elseif(mysqli_num_rows($q)<=50){
	echo "<option value='sendiri'>Datang Sendiri</option>";
	while($qdata=mysqli_fetch_array($q)){
    echo "<option value='".$qdata['idkonseler']."'>Dipanggil oleh ".$qdata['NamaKonseler']."</option>";
	}
}else{
  echo "";
}
?>
