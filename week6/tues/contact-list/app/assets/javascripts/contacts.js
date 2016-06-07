var data = []

function displayContacts(){
  var $el = $('#contacts')
  $el.html('');

  data.forEach(function(contact) {
    var html = "";
    html += '<li>';
    html += '<div class="contact-name"><h2>' + contact.name + '</h2></div>';
    html += '<div class="contact-email">' + contact.email + '</div>';
    html += '</li>'
    $el.append(html);
  });
};

function fetchData() {
  $.ajax({
    url: "/contacts.json",
    dataType: 'json'
  }).then(function(response) {
    data = response;
    displayContacts();
  });  
}

$(function() {
  fetchData();
});

