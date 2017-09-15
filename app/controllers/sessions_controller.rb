# sessions controller
class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to feed_path
    else
      flash.now[:alert] = 'invalid email/password combination'
      render :new
    end
  end

  def destroy; end
end
