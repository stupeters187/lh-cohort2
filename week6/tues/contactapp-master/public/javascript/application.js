$(function() {

  $('#new').on('submit', function(e){
    e.preventDefault();
    $('#new').serialize();
    $.ajax({
      type: 'POST',
      url: '/new',
      data: 'json',
      success: function(){
        var name = $("#name").val();
        $("<p>").text(name).css('color', 'blue').appendTo('#results');
        var email = $("#email").val();
        $("<p>").text(email).appendTo('#results');
        var phone = $("#phone").val();
        $("<p>").text(phone).appendTo('#results');
        $("<p>").text('Contact added').css('color', 'red').appendTo("#new");
      }
    });
  });

  $("#search").on('submit', function(e) {
    e.preventDefault();
    var id = $("findbyID").val();
    $.ajax({
      type: 'GET',
      url: '/find/' + id,
      data: 'json',
      success: function(){
        $("<p>").css('color', 'blue').text(full_name).appendTo("#results");
        $("<p>").text(contact.email).appendTo("#results");    
        $("<p>").text(contact.phone_number).appendTo("#results");
      }
    });

  });
  


  var display_contacts = function(index, contact) {
    var full_name = contact.first_name + " " + contact.last_name;
    $("<p>").css('color', 'blue').text(full_name).appendTo("#results");
    $("<p>").text(contact.email).appendTo("#results");    
    $("<p>").text(contact.phone_number).appendTo("#results");
        
  };

  function get_contacts(contacts) {
    $.each(contacts, display_contacts);
  };

  $("#btn").on('click', function() {
    var showAll = $.getJSON('/list', get_contacts);
    $(this).text("Hide Contacts").on('click', function(){
      $('showAll').hide();
    });
  });

});

 