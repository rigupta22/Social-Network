$(document).on('click','.comment-like',function(e){
  e.preventDefault();
  var a = this.getAttribute('data-comment-id');
  var b = ".likes-comment-" + a;
  $.ajax({
      url: this.getAttribute('href'),
      method: "POST",
      success: function(result) {
        $(b).text(result.likes);
      }
    });
});