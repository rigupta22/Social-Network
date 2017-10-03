# posts controller
class PostsController < ApplicationController
  before_action :set_post, except: [:create]

  def create
    @post = current_user.posts.create(post_params)
    render json: { data: (render_to_string partial: '/posts/edit',
                                           locals: { post: @post }) }
  end

  def update
    render json: { post: @post, user: current_user.username } if @post.update(post_params)
  end

  def destroy
    @post.destroy
    render json: { post: @post }
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
