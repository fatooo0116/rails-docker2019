(function($){
  $(document).ready(function(){


    //if you change this breakpoint in the style.css file (or _layout.scss if you use SASS), don't forget to update this value as well
        var MQL = 1170;

        //primary navigation slide-in effect
        /*
        if($(window).width() > MQL) {
          var headerHeight = $('.cd-header').height();
          $(window).on('scroll',
          {
                previousTop: 0
            },
            function (){
              var currentTop = $(window).scrollTop();
              //check if user is scrolling up
              if (currentTop < this.previousTop ) {
                //if scrolling up...
                if (currentTop > 0 && $('.cd-header').hasClass('is-fixed')) {
                  $('.cd-header').addClass('is-visible');
                } else {
                  $('.cd-header').removeClass('is-visible is-fixed');
                }
              } else {
                //if scrolling down...
                $('.cd-header').removeClass('is-visible');
                if( currentTop > headerHeight && !$('.cd-header').hasClass('is-fixed')) $('.cd-header').addClass('is-fixed');
              }
              this.previousTop = currentTop;
          });
        }
        */




        //open/close primary navigation
        $('.cd-primary-nav-trigger').on('click', function(){
           // $('.cd-menu-icon').toggleClass('is-clicked');
           // $('.cd-header').toggleClass('menu-is-open');

          //in firefox transitions break when parent overflow is changed, so we need to wait for the end of the trasition to give the body an overflow hidden
          if( $('.cd-primary-nav').hasClass('is-visible') ) {

            $('.cd-menu-icon').removeClass('is-clicked');

            $('.cd-primary-nav').addClass('is-visibleback');

            setTimeout(function(){
              $('.cd-primary-nav').removeClass('is-visibleback');

            },800);

            setTimeout(function(){
              $('.cd-primary-nav').removeClass('is-visible');
            },800);

          }else {
            $('.cd-menu-icon').addClass('is-clicked');

            $('.cd-primary-nav').addClass('is-visible').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend',function(){
              // $('body').addClass('overflow-hidden');
            });
          }
        });




        if($("#home").length>0){
          var w = $("#fullpage").width();
          var h = $("#fullpage").height();
          console.log(w/h);

          if(w/h > 1.778){
            $("#fullpage").find("video").css({
              'width':'100%',
              'height':'auto',
              'bottom':0
            });

            $("#fullpage").find("iframe").css({
              'width':'100%',
              'height':w/1.77,
            });
          }else{
            var vh = $("#fullpage").height();
            var mleft = -(h*1.778 - w ) / 2;
            console.log(mleft);
            $("#fullpage").find("video").css({
              'width':'auto',
              'height':'100%',
              'left': mleft
            });

            var xmleft = -(h*2 - w ) / 2;
            $("#fullpage").find("iframe").css({
              'width':h*2,
              'height':'100%',
              'left': xmleft,              
            });

          }
        }


        $(".dropdown-trigger").dropdown();


        inView('.bk_contrast')
            .on('enter', function(){
              $(".ani_img").addClass("open_img");
            }).on('exit', function(){
              console.log('leave');
              // $(".ani_img").removeClass("open_img");
            });

        inView('.bk_contrast').emit('exit', document.querySelectorAll('.someSelector')[0]);

  });
})(jQuery);
