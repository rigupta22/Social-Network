# comments controller
class CommentsController < ApplicationController
  before_action :set_comment, except: [:create]

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.create(comment_params.merge(user_id: current_user.id))
    render json: { data: (render_to_string partial: '/comments/edit',
                                           locals: { comment: @comment,
                                                     post: post }) }
  end

  def update
    return unless  @comment.update(comment_params)
    render json: { comment: @comment, user: current_user.username }
  end

  def destroy
    @comment.destroy
    render json: { comment: @comment }
  end

  private

  def set_comment
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
