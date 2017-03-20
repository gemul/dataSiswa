/*
General startup script.
only edit in "edit here" block.
jquery ajax is being overriden here.
by. Gema Ulama Putra
*/

const { remote } = require('electron');
$(document).ready(function(){
  //"edit here" start
  if(localStorage.getItem("username")){
    actionLogin();
  }else{
    $('#preLogin').load("pages/loginForm.html");
  }
  $.ajaxSetup ({
      // Disable caching of AJAX responses
      cache: false
  });
    //"edit here" end
});
var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();
//ajax function override
(function ($) {
var _ajax = $.ajax,
A = $.ajax = function(options) {
if (A.data)
  if(options.data) {
      if(typeof options.data !== 'string')
          options.data = $.param(options.data);
      if(typeof A.data !== 'string')
          A.data = $.param(A.data);
      options.data += '&' + A.data;
  } else
      options.data = A.data;
  return _ajax(options);
};
})(jQuery);
$.ajax.data = { token: localStorage.getItem('token') };
