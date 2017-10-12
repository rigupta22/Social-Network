$(document).on('keyup','.search-field',function(){
  if ($('.search-field').val() != '')
  {
    // $('.error').text('');
    $.ajax({
      url: "http://localhost:3000/users",
      method: "GET",
      data: $(this).serialize(),
      success: function(result) {
        debugger
        $('.search-field').autocomplete({
          source: result.user,
          select: function(event, ui) {
            debugger
            window.location.href = 'http://localhost:3000/profile/' +  ui.item.value;
          }
        });
      }
    });
  }
});


// $(document).on('submit','#search-user',function(e){
//   e.preventDefault();
//   if ($('.search-field').val() != '')
//   {
//     $.ajax({
//       url: this.action,
//       method: "GET",
//       data: $(this).serialize(),
//       success: function(result) {
//         debugger
//         if (result == 'Not Found')
//         {
//           $('.error').text(result);
//         }
//         else
//         {
//           window.location.href = 'http://localhost:3000/profile/' + result.user.id;
//         }
//       }
//     });
//   }
// });