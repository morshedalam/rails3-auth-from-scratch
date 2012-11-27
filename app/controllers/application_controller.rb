class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate!
    if !logged_in?
      session[:back_to] = request.url
      redirect_to login_url, :alert => "You must login to access that page."
    end
  end

  private

  def logged_in?
    return true if current_user.present?
  end

  def current_user
    @current_user ||= User.find_by_email(session[:email]) if session[:user_id]
  end

  ##Lets the model view use this method!
  helper_method :current_user, :logged_in?
end
