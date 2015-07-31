$(document).ready(function(){ 
  $(document.body).click(function(e){
    var tab = $(e.target).closest("#myTab a");
    if(tab.length) {
      e.preventDefault();
      tab.tab('show');
      $('#myTab li.active').removeClass('active');
      $(e.target).closest('#myTab li').addClass('active');
    }
  });
});
