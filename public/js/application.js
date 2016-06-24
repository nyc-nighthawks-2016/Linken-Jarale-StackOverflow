$(document).ready(function() {

 $('#answer_form').on('submit', function(e) {
  // debugger;
  e.preventDefault();
  $.ajax({
    url:$( this ).attr('action'),
    method: $( this ).attr('method'),
    data: $( this ).serialize()
  })
  .done(function(response){
    $('#answer_wrapper').append(response);
    $('#answer_form').hide();
  });
 });

  $('#answer_wrapper').on('submit', 'form', function(e) {
  e.preventDefault();
  var vote = $(this).parent().parent().parent().parent().find('.vote-count')
  var request = $.ajax({
    url:$( this ).attr('action'),
    method: $( this ).attr('method'),
    data: $( this ).serialize()
  });
  request.done(function(response){
   vote.html(response);
  });
 });

  $('#post_wrapper').on('submit', 'form', function(e) {
  e.preventDefault();
  var vote = $(this).parent().parent().parent().parent().find('.vote-count')
  var request = $.ajax({
    url:$( this ).attr('action'),
    method: $( this ).attr('method'),
    data: $( this ).serialize()
  });
  request.done(function(response){
   vote.html(response);
  });
 });

});
