# sessions controller
class SessionsController < ApplicationController
  skip_before_action :logged_in?

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
