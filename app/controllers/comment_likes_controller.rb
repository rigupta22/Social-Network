# comment like controller
class CommentLikesController < ApplicationController
  before_action :set_object, only: [:create]
  include Liker

  private

  def set_object
    post = Post.find(params[:post_id])
    @object = post.comments.find(params[:comment_id])
    @like = @object.likes.find_by(liker: current_user.id)
  end
end
