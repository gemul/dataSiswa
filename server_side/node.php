<?php
$filename=$_GET['node'].'.php';
if(file_exists($filename)){
  include($filename);
}else{
  echo "not a valid node";
}
?>
