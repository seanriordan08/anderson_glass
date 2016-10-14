
$(document).on('ready', function(){
  $('.gallery_image').hover(function(){
    console.log('hit');
    var overlay = $(this).find('.gallery_overlay').first();
    overlay.fadeIn(200);
    $(this).animate({opacity:.8},200);
  }, function(){
    var overlay = $(this).find('.gallery_overlay').first();
    overlay.fadeOut(200);
    $(this).animate({opacity:1},200);
  })
});

