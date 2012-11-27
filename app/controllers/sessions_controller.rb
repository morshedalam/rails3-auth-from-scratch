class SessionsController < ApplicationController
  layout 'sign'

  def new
  end

  def create
    # if the user is found and the user's password authenticates
    if user = User.authenticate(params[:email], params[:password])
      create_user_session(user)
    else
      flash.now.notice = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Logged out!"
  end

  private
  def create_user_session(user)
    session[:email] = user.email
    session[:user_id] = user.id
    back_to = session[:back_to] || opts[:reidrect] || root_url
    redirect_to back_to, :notice => "Logged in!"
  end
end
