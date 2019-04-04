/*
(function($){
  $(document).ready(function(){


      $(".sidebar > ul > li > a.sidebar-sub-toggle").bind("click",function(e){
          console.log("xx");
          e.preventDefault();
          if($(this).parent().hasClass("open")){
            $(this).parent().removeClass("open");
          }else{
            $(this).parent().addClass("open");
          }
      });

  });
})(jQuery);
*/

document.addEventListener("turbolinks:load", function() {

    document.querySelectorAll("#sidebar > ul > li.sub").forEach(function(item) {
      item.addEventListener("click", function(event) {
        // event.preventDefault();
        console.log("oninit");

          if (this.classList.contains('open')){
            this.classList.remove('open');
          }else{
            this.classList.add('open');
          }
      });
    });
});
