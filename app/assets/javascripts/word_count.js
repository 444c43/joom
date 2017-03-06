function wordCount(displayElement, textAreaElement) {
  var postBodyText = $(textAreaElement).val();
  var count = postBodyText.split(/ |\n/).filter(function(n){return n !== "";}).length;
  $(displayElement + "span").text(count);
}
