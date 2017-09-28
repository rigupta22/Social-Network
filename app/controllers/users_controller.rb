# users controller
class UsersController < ApplicationController
  skip_before_action :logged_in?, except: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
    current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :image)
  end
end
