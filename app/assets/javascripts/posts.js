$(document).on('click','.edit-post',function(){
  var a = "#user-post-" + this.getAttribute('data-post-id')
  $(a).find('.show-field').hide();
  $(a).find('.edit-field').show();
});

$(document).on('click','.delete-post',function(e){
  e.preventDefault();
  var a = "#user-post-" + this.getAttribute('data-post-id')
  $.ajax({
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: this.getAttribute('href'),
      type: "DELETE",
      success: function(result) {
        debugger
        $(a).html(result);
      }
    });
});

$(document).on('click','.cancel-edit',function(){
  var a = "#user-post-" + this.getAttribute('data-post-id')
  $(a).find('.show-field').show();
  $(a).find('.edit-field').hide();
});

$(document).on('submit','#create-post', function(e){
  e.preventDefault();
  var user_id = this.getAttribute('data-user-id')
  var text_filed_id = "#" + ("post-" + user_id )
  if ($(text_filed_id).val() != "")
  {debugger
    $.ajax({
      url: this.action,
      method: "POST",
      data: $(this).serialize(),
      success: function(result) {
        $('.user-posts').prepend(result.data)
        $(text_filed_id).val("")
        $('.create-form').prop("disabled", false);
      }
    });
  }
});

$(document).on('submit','#update-post', function(e){
  e.preventDefault();
  var post_id = this.getAttribute('data-post-id')
  var text_filed_id = "#" + ("post_text_" + post_id )
  var a = $(this.parentElement);
  if ($(text_filed_id).val() != "")
  {
    $.ajax({
      url: this.action,
      method: "PATCH",
      data: $(this).serialize(),
      success: function(result) {
        $(a.find('.show-field')).show();
        $(a.find('.edit-field')).hide();
        a.find('.post-body').html(" <strong>"+ result.user + " :</strong> "+ result.post.body);
        $('.submit-form').prop("disabled", false);
      }
    });
  }
});
