/*
General functions library.
Put functions here!
by. Gema Ulama Putra
*/
function actionLogin(){
  var username,password;
  if(localStorage.getItem('username')!==null && localStorage.getItem('username')!==null){
    username=localStorage.getItem('username');
    password=localStorage.getItem('password');
  }else{
    username=$('#loginFieldUsername').val();
    password=$('#loginFieldPassword').val();
    localStorage.setItem('username',$('#loginFieldUsername').val());
    localStorage.setItem('password',$('#loginFieldPassword').val());
  }
  $.ajax({
    url:webAddr+"/ping.php?a=login",
    type:'POST',
    data:{
      'username':username,
      'password':password,
      'nodeID':nodeID,
    },
    dataType:'json',
    beforeSend:function(){
      $('#preLogin').load("pages/loginSpinner.html",{},function(){
        $('#lsText').html("Connecting to server");
      });
      statusBar("Connecting "+webAddr);
    },
    success:function(r){
      $('#lsText').html("Connection established");
      if(r.status===undefined){
        statusBar("data mismatch");
      }else if(r.status==='ok'){
        statusBar("Logged in as "+r.username);
        localStorage.setItem('token',r.token);
        $('.preLogin').fadeOut(100);
        $('.postLogin').fadeIn(100);
      }else if(r.status==='invalid login'){
        $('#preLogin .loginSpinner .lsCenterWrap').html("Wrong username/password<br><button onclick='loginFormOpen()' class='btn btn-primary'>Edit Login</button> <button onclick='actionLogin()' class='btn btn-primary'>Retry</button>");
      }
    },
    error:function(r){
      $('#lsText').html("Connection error");
      $('#preLogin .loginSpinner .lsCenterWrap').html("Connection error. Pastikan alamat server sudah benar.<br><button onclick='loginFormOpen()' class='btn btn-primary'>Go Back</button> <button onclick='actionLogin()' class='btn btn-primary'>Retry</button>");
      statusBar("Connection error ");
    }
  });
}
function loginFormOpen(){
  $('#preLogin').load("pages/loginForm.html",{},function(){
    $('#loginFieldUsername').val(localStorage.getItem('username'));
      localStorage.removeItem('username');
      localStorage.removeItem('password');
  });
}
function logout(){
  $('.postLogin').fadeOut(100);
  loginFormOpen();
  $('.preLogin').fadeIn(100);
}
function loadPage(pagefile){
  statusBar("Loading Page");
  if(localStorage.getItem("username")){
    $('#mainContent').load(pagefile);
  }else{
    logout();
  }
}

function tabulator(datae,actionButtons){
  /*
  String tabulator(json String datae, string actionButtons)
  Convert json to table content.
  Returns html table content "<tr><td></td></tr>" etc..
  datae: 2 dimensional json string.
  actionButtons: html string for list item actions, "[id]" will be replaced by item's id
  by. Gema Ulama Putra
  */
  var ret="";
  var ldata=(typeof datae === 'object')?datae:$.parseJSON(datae);
  for(var i in ldata){
    ret+="<tr id='table-item-"+ldata[i].id+"'>";
    for(var j in ldata[i]){
      if(j!='id')
      ret+="<td>"+ldata[i][j]+"</td>";
    }
    if(actionButtons!==undefined){
      ret+="<td>"+actionButtons.replace(/\[id\]/g,ldata[i].id )+"</td>";
    }
    ret+="</tr>";
  }
  return ret;
}
function statusBar(text){
  if(text===undefined){
    $('#debugPanel .debugText').html("Ready.");
  }else{
    $('#debugPanel .debugText').html(text);
  }
}
function modal(show,content){
  if(content===undefined){var content="";}
  $('#fixedModal .modalContent').html(content);
  if(show==1){
    $('#fixedModal').show();
  }else if(show>1){
    $('#fixedModal').delay(show).fadeOut(100);
  }else{
    $('#fixedModal').fadeOut(100);
  }
}
function conStateDisconnected(){
  $('#fixedModal .modalContent').html("Koneksi server terputus.<br><a href=''>Coba Lagi</a>");
  statusBar("Disconnected | <a href=''>Reconnect</a>");
  modal(1);
}
