function resizeFont(elemToR){
  parentW = elemToR.width();
  elemToR.find('.row').each(function(n){
    curRow = $(this);
    curWidth = curRow.width();
    var ratio = parentW / curWidth;
    newFontSize = ratio * initialSize;
    newLineHeight = newFontSize / 1.29;
    curRow.css({
	"font-size" : newFontSize,
	"line-height" : newLineHeight + "px"
    });

  });
}

$(document).ready(function(){
  initialSize = 110;
  $('.slogan').each(function(){
      resizeFont($(this));
  })
});

$(window).resize(function(){
  $('.slogan').each(function(){
      resizeFont($(this))
  })
})
