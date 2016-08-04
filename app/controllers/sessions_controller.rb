class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:session][:username].empty?
    user = User.find_by(email: params[:session][:email].downcase)
  elsif
    user = User.find_by(username: params[:session][:username].downcase)
  end
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
