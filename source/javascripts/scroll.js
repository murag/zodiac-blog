$(document).ready(function(){
  $(document).scroll(function(){
    var scroll = $(window).scrollTop();
    if(scroll > 50){
      $('.globalNavi').removeClass('scrollOff').addClass('scrollOn');
    } else {

      $('.globalNavi').addClass('scrollOff').removeClass('scrollOn');
    }
  });
});
