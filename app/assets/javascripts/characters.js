$(document).on("turbolinks:load", function() {


  $('.show-details').on('click', function(event){
      event.preventDefault();
      console.log("poop");
      $(event.target).closest('tr').find('.attribute-details').toggle();
  });

});
