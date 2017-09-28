# application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :logged_in?
  def post
    @post = current_user.posts.find(params[:id])
  end
end
