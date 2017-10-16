# post likes controller
class PostLikesController < ApplicationController
  before_action :set_object, only: [:create]
  include Liker

  private

  def set_object
    @object = Post.find(params[:post_id])
    @like = @object.likes.find_by(liker: current_user.id)
  end
end
