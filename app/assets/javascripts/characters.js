# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on("turbolinks:load", function() {


  $('.show-details').on('click', function(event){
      event.preventDefault();
      $(event.target).closest('tr').find('.attribute-details').toggle();
  });
  
)};
