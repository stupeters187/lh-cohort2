//= require jquery
//= require jquery_ujs

$(document).ready(function() {

 $("select#search_duration").change(function(){
   $(this).closest("form").submit();
 });

});