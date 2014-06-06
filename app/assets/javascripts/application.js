// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require_self

$( document ).ready(function() {
	$( document ).on( "click", ".link-country", function() {
  	name = $(this).data("name");
  	alert("Clicking on " + name);
	});

	$(document).on("ajax:success","#form_ajax_search", function(e,data,status,xhr){
		//alert("NOTHING!");
		//alert(data.name);
		$(".js_country_list").html(data);
	});

	$(document).on("ajax:success","#new_skill",function(e,data,status,xhr){
		$(".js_player_skills").prepend(data);
		$("#skill_description").val("");
	});

	$(document).on("ajax:error","#new_skill",function(e, xhr, status, error){
		alert("Something Wrong: " + xhr.responseText);
	});

	$( document ).on( "keyup", "#keyword", function() {
		$(".js_search_submit").click();
	});

	$(document).on("ajax:success",".js_add_one", function(e,data,status,xhr){
		$("#player_"+data.number+"_quantity").text(data.quantity);
	});
});
