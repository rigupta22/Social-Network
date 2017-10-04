$(document).on('click','.post-like',function(e){
  e.preventDefault();
  var a = this.getAttribute('data-post-id');
  var b = ".likes-post-" + a;
  debugger;
  $.ajax({
      url: this.getAttribute('href'),
      method: "POST",
      success: function(result) {
        debugger;
        $(b).text(result.likes);
      }
    });
});
// $(document).ready(function() {
//   $('.post-like').click(function(e) {
//     e.preventDefault();
//   });
// });