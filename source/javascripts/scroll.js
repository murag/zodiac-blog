$(document).ready(function(){
  $(document).scroll(function(){
    var scroll = $(window).scrollTop();
    if(scroll > 50){
      $('.globalNavi').removeClass('scrollOff').addClass('scrollOn');
    } else {

      $('.globalNavi').addClass('scrollOff').removeClass('scrollOn');
    }
  });
  $('.navToggle').click(function(){//headerに .openNav を付加・削除
        $('header').toggleClass('openNav');
    });
});
