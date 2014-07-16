$(document).ready(function() {
    $('i.glyphicon-thumbs-up, i.glyphicon-thumbs-down').click(function(){
        var $this = $(this),
        c = $this.data('count');
        if (!c) c = 0;
        c++;
        $this.data('count',c);
        $('#'+this.id+'-bs3').html(c);
    });
    $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });

  var activeEl = 2;
  $(function() {
      var items = $('.btn-nav');
      $( items[activeEl] ).addClass('active');
      $( ".btn-nav" ).click(function() {
          $( items[activeEl] ).removeClass('active');
          $( this ).addClass('active');
          activeEl = $( ".btn-nav" ).index( this );
      });
  });
});

