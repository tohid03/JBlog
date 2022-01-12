$(function() {
    $(".navbar-toggler").on("click", function(e) {
        $(".tm-header").toggleClass("show");
        e.stopPropagation();
      });
    
      $("html").click(function(e) {
        var header = document.getElementById("tm-header");
    
        if (!header.contains(e.target)) {
          $(".tm-header").removeClass("show");
        }
      });
    
      $("#tm-nav .nav-link").click(function(e) {
        $(".tm-header").removeClass("show");
      });
     
});

 var path = window.location.href;
  $(".tm-nav ul a").each(function(){
      //console.log(this)
     
      
      if(this.href === path){
           $(this).parent().addClass('active');
           console.log(this)
      }
  })    

