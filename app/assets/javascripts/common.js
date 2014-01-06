$(function() {
  $.support.hrefNormalized && DummyImage.generate();

  var colors = ['#2f98dd','#a0511d', '#229b2e', '#dcde37']

  $('section a, section h1, section h2').each(function(){
    $link = $(this)
    new_color = colors[Math.floor(Math.random() * colors.length)]
    $link.css('color', new_color);
  });

});
