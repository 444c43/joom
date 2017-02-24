function wordCount() {
  var text = document.getElementById("post_body").value;
  var count = text.split(/ |\n/).filter(function(n){return n != ""}).length;
  document.getElementById("word_count").innerText = "Total Words: " + count;
}
