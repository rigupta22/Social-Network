$(document).on('click','.edit-comment',function(){
  var a = "#user-comment-" + this.getAttribute('data-comment-id')
  $(a).find('.show-field').hide();
  $(a).find('.edit-field').show();
});

$(document).on('click','.delete-comment',function(e){
  e.preventDefault();
  var a = "#user-comment-" + this.getAttribute('data-comment-id')
  $.ajax({
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: this.getAttribute('href'),
      type: "DELETE",
      success: function(result) {
        $(a).html(result);
        $(a).removeClass('well');
      }
    });
});

$(document).on('click','.cancel-edit',function(){
  var a = "#user-comment-" + this.getAttribute('data-comment-id')
  $(a).find('.show-field').show();
  $(a).find('.edit-field').hide();
});

$(document).on('submit','#create-comment', function(e){
  e.preventDefault();
  var post_id = this.getAttribute('data-post-id')
  var text_filed_id = "#" + ("comment-" + post_id )
  var a = "." + post_id
  if ($(text_filed_id).val() != "")
  {
    $.ajax({
      url: this.action,
      method: "POST",
      data: $(this).serialize(),
      success: function(result) {
        $(a).append(result.data)
        $(text_filed_id).val("")
        $('.create-form').prop("disabled", false);
      }
    });
  }
});

$(document).on('submit','#update-comment', function(e){
  e.preventDefault();
  var comment_id = this.getAttribute('data-comment-id')
  var text_filed_id = "#" + ("comment_text_" + comment_id )
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
        a.find('.comment-body').html(" <strong>"+ result.user + " :</strong> "+ result.comment.body);
        $('.submit-form').prop("disabled", false);
      }
    });
  }
});
