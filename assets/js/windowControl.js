function eWindow(){};
eWindow.windowState="normal";
eWindow.minimize=function(){
  remote.BrowserWindow.getFocusedWindow().minimize();
};
eWindow.close=function(){
  remote.BrowserWindow.getFocusedWindow().close();
};
eWindow.maximize=function(){
  remote.BrowserWindow.getFocusedWindow().maximize();
  $('#weMaximizeBtn').html("<span class='glyphicon glyphicon-resize-small'></span>");
  this.windowState="maximized";
};
eWindow.unmaximize=function(){
  remote.BrowserWindow.getFocusedWindow().unmaximize();
  $('#weMaximizeBtn').html("<span class='glyphicon glyphicon-resize-full'></span>");
  this.windowState="normal";
};
eWindow.maxToggle=function(){
  if(this.windowState=="normal"){
    this.maximize();
  }else{
    this.unmaximize();
  }
};
eWindow.openDev=function(){
  remote.getCurrentWindow().toggleDevTools();
};
