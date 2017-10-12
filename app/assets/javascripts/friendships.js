$(document).on('click','.friend-status',function(e){
  e.preventDefault();
  debugger
  $.ajax({
    url: "http://localhost:3000/friendships?friend_id=" + this.getAttribute("data-user-id"),
    method: "post",
    success: function(result) {
      debugger
      var a = '#friend-' + result.friend.friend_id.toString()
      var e = $(a).find('.friend-status')
      $(e).prop("disabled",true);
      if ($(e).val() == 'Add Friend')
      {
        $(e).val('Friend request sent');
        $(e).after($('<input type="submit" value="Cancel Request" class="cancel-request">'));
        debugger
        $(a).find('.cancel-request').attr('data-request-id', result.friend.id);
      }
      else
      { debugger
        $(a).find('p').remove();
        $(e).val('Friends');
        $(a).find('.delete-request').val('Unfriend').addClass('delete-friend').removeClass('delete-request');
      }
    }
 });
});

$(document).on('click','.cancel-request',function(e){
  e.preventDefault();
  debugger
  $.ajax({
    url: "http://localhost:3000/friendships/" + $('.cancel-request').attr("data-request-id"),
    method: "delete",
    success: function(result) {
      debugger
      var a = '#friend-' + $('.friend-status').attr('data-user-id')
      var e = $(a).find('.friend-status')
      $(e).prop("disabled",false);
      $(e).val('Add Friend');
      $(a).find('.cancel-request').remove();
    }
 });
});

$(document).on('click','.delete-request',function(e){
  e.preventDefault();
  debugger
  // else if($('.delete-request'))
  $.ajax({
    url: "http://localhost:3000/friendships/" + this.getAttribute("data-request-id"),
    method: "delete",
    success: function(result) {
      debugger
      var a = '#friend-' + result.user.toString()
      var e = $(a).find('.friend-status')
      $(e).val('Add Friend');
      $(a).find('p').remove();
      $(a).find('.delete-request').remove();
    }
 });
});

$(document).on('click','.delete-friend',function(e){
  e.preventDefault();
  debugger
  $.ajax({
    url: "http://localhost:3000/friendships/" + this.getAttribute("data-request-id"),
    method: "delete",
    success: function(result) {
      debugger
      var a = '#friend-' + result.user.toString()
      var e = $(a).find('.friend-status')
      $(e).prop("disabled",false);
      $(e).val('Add Friend');
      $(a).find('.delete-friend').remove();
    }
 });
});