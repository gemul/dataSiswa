if(!localStorage.getItem("webAddr")){
  localStorage.setItem("webAddr","http://localhost/datasiswa");
}
if(!localStorage.getItem("nodeID")){
  localStorage.setItem("nodeID","KMZWA8AWAA");
}
if(!localStorage.getItem("token")){
  localStorage.setItem("token","");
}

var tahunAjaran=2017;
var nodeID=localStorage.getItem("nodeID");
var webAddr=localStorage.getItem("webAddr");
var token=localStorage.getItem("token");
var gVar={};
var errorCache="";
