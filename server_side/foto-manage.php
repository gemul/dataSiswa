<!doctype HTML>
<?php
if(!empty($_POST['id'])){
  if(file_exists("upload/SISWA-".str_pad($_POST['id'],11,'0',STR_PAD_LEFT).".jpg")){
    $action="node.php?node=foto-update&s=update&id=".$_POST['id'];
    $foto="upload/SISWA-".str_pad($_POST['id'],11,'0',STR_PAD_LEFT).".jpg";
  }else{
    $action="node.php?node=foto-update&s=new";
    $foto="upload/PICHOLDER.jpg";
  }
}else{
  $action="node.php?node=foto-update&s=new";
  $foto="upload/PICHOLDER.jpg";
}
?>
 <html>
   <head>
     <title>Ubah Foto</title>
   </head>
   <body>
     <div style='text-align:center'>
       <img src="<?= $foto ?>" style='width:150px;'><br>
       <form method='post' enctype="multipart/form-data" action='<?= $action ?>'>
         <input type=file name=foto><br />
         <button type=submit>Ubah</button>
       </form>
     </div>
     <div class='keterangan'>Kalau sudah, harap tutup jendela ini agar tidak numpuk.</div>
   </body>
   <style>
    .keterangan {
      font-size:11px;
    }
   </style>
 </html>
