$(document).on('ready turbolinks:load', function(){
  $('input.order-item-check').on("click", function(){
    $(this).parent().find('input.order-item-destroy').val(!$(this).is(':checked'));
  })
})
