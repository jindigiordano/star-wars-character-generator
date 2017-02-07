$(document).on("turbolinks:load", function() {


  $('.show-details').on('click', function(event){
      event.preventDefault();
      $(event.target).closest('tr').find('.attribute-details').toggle();
  });

});
