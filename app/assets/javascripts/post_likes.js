$(document).on('click','.post-like',function(e){
  e.preventDefault();
  var a = this.getAttribute('data-post-id');
  var b = ".likes-post-" + a;
  $.ajax({
      url: this.getAttribute('href'),
      method: "POST",
      success: function(result) {
        $(b).text(result.likes);
      }
    });
});
// $(document).ready(function() {
//   $('.post-like').click(function(e) {
//     e.preventDefault();
//   });
// });