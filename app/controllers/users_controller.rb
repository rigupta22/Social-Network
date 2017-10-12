# users controller
class UsersController < ApplicationController
  skip_before_action :logged_in?, except: [:show]

  def search
    @user = User.where('username LIKE ?', "#{params[:name]}%").map(&:username)
    # id = User.where('username LIKE ?', "#{params[:name]}%").map(&:id)
    # @user = [Hash[id.zip(username)]]
    render json: { user: @user }
  end

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

  def profile
    # if request.xhr?
    #   @user = User.find_by(username: params[:name])
    #   return render plain: 'Not Found' unless @user
    #   return render json: {user: @user}
    # end
    @user = User.find_by(username: params[:username])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :image)
  end
end
