
$(document).on('ready', function(){
  var gallery_picture = $('.gallery_picture');
  var gallery_image = $('.gallery_image');
  var gallery_overlay = $('.gallery_overlay');

  gallery_picture.hover(function(){
    var overlay = $(this).find('.gallery_overlay').first();
    overlay.fadeIn(200);
    $(this).animate({opacity: .8}, 200);
  }, function(){
    var overlay = $(this).find('.gallery_overlay').first();
    overlay.fadeOut(200);
    $(this).animate({opacity: 1}, 200);
  });

  gallery_image.click(function(){
    remove_picture($(this));
  });

  gallery_overlay.click(function(){
    var this_el = $(this).siblings('.gallery_image');
    remove_picture(this_el);
  });

  function remove_picture(this_el){
    if (this_el.data('id') == undefined)
      return;

    var the_id = this_el.data('id');
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
  }
});

