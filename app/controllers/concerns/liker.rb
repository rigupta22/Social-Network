# liker module for liking posts and comments
module Liker
  extend ActiveSupport::Concern

  def create
    if !@like
      @like = @object.likes.create(like_params.merge(liker: current_user.id))
      render json: { likes: @object.likes.count }
    else
      destroy @like, @object
    end
  end

  def destroy(like, post)
    like.destroy
    render json: { likes: post.likes.count }
  end

  private

  def like_params
    params.permit(:all)
  end
end
