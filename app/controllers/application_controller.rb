class ApplicationController < ActionController::Base
  helper_method :authorized?

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      false
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized?
    redirect_to root_path unless logged_in?
  end
end
