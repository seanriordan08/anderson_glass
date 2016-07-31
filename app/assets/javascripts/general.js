
$(document).on('ready', function(){

  $('.main_slider').slick({
    slidesToShow: 10,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2500,
    variableWidth: true,
    dots: true,
    cssEase: 'linear',
    pauseOnHover: true
  });

  var jumboHeight = $('.jumbotron').outerHeight();
  function parallax(){
    var scrolled = $(window).scrollTop();
    $('.bg').css('height', (jumboHeight-scrolled) + 'px');
  }
  $(window).scroll(function(e){
    parallax();
  });

});

