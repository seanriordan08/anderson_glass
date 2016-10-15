
$(document).on('ready', function(){
  var gallery_image = $('.gallery_image');

  gallery_image.hover(function(){
    var overlay = $(this).find('.gallery_overlay').first();
    overlay.fadeIn(200);
    $(this).animate({opacity: .8}, 200);
  }, function(){
    var overlay = $(this).find('.gallery_overlay').first();
    overlay.fadeOut(200);
    $(this).animate({opacity: 1}, 200);
  });

  gallery_image.click(function(){
    if ($(this).data('id') == undefined)
      return;

    var the_id = $(this).data('id');
    $.ajax({
      method: 'POST',
      url: '/galleries/destroy',
      data: { id: the_id },
      dataType: 'script',
      success: function(){
        console.log('great success');
      },
      error: function() {
        console.log('errors!');
      }
    })
  });
});

