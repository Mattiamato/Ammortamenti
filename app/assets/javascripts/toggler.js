$(document).ready(function(){

  $("#new_office").hide();

  $("#new_office_button").toggle(function(){
  	$("#new_office").show();
  }, function () {
  $("#new_office").hide();
  });
  
  $("#new_building").hide();

  $("#new_building_button").toggle(function(){
  	$("#new_building").show();
  }, function () {
  $("#new_building").hide();
  });
  
  $(".propriety_building").hide();

  $(".propriety_building_line").toggle(function(){
  	$(".propriety_building").hide();
	var id=this.id;
	$(this).parent().parent().children().css("border-bottom","0px");
	$("#details-"+id.toString()).show();
  }, function () {
  $(".propriety_building").hide();
  $(this).parent().parent().children().css("border-bottom","1px solid #ddd");
  });
  
});