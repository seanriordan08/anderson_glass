
$(document).on('ready', function(){

  var filter = getFilter(document.location.search);
  var checkbox = $(this).find('input');
  if (filter == 'residential') {
    $(this).find('.switch-content.active').removeClass('active');
    $(this).find('.switch-content').addClass('disable');
    $(checkbox).attr('value', 2);
    $( ".multi_switch_hook" ).trigger('change', 'disable');
  } else if (filter == 'commercial') {
    $(this).find('.switch-content.initial').removeClass('initial');
    $(this).find('.switch-content').addClass('active');
    $(checkbox).attr('value', 1);
    $( ".multi_switch_hook" ).trigger('change', 'active');
  }

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

  $('#new_picture').submit(function(){
    $('.gallery_picture_spinner').css({display: 'inline-block'});
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
        $('.gallery_picture_spinner').css({display: 'none'});
      },
      error: function() {
      }
    })
  }
});

function getFilter(filter) {
  filter = filter.split('?filter=').join('');

  return filter;
}

$(document).on('change', $('.multi_switch_hook'), function(e, state){
  if (state == 'disable') {
    $.ajax({
      method: 'GET',
      url: '/galleries/show_residential',
      data: {the_data: 'the data'},
      dataType: 'script'
    });
  }
  if (state == 'active') {
    $.ajax({
      method: 'GET',
      url: '/galleries/show_commercial',
      data: {the_data: 'the data'},
      dataType: 'script'
    });
  }
  if (state == 'initial') {
    $.ajax({
      method: 'GET',
      url: '/galleries/index',
      data: {the_data: 'the data'},
      dataType: 'script'
    });
  }
});

// Track active navbar links
$(function(){
  var url = window.location;
  $('ul.nav a[href="'+ url.pathname +'"]').parent().addClass('active');
  $('ul.nav a').filter(function() {
    return this.href == url;
  }).parent().addClass('active');
});

