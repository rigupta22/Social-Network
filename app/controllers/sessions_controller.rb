# sessions controller
class SessionsController < ApplicationController
  skip_before_action :logged_in?

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = 'invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
