$(document).ready(function(){

  $("#new_office").hide();

  $("#new_office_button").toggle(function(){
  	$("#new_office").show();
  }, function () {
  $("#new_office").hide();
  });
 
});