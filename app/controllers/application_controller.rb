class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



private

  def current_user
    if session[:user_id]
  	 current_user = User.find(session[:user_id])
    end
  end
  helper_method :current_user

  def logged_in?
  	!!current_user
  end
  helper_method :logged_in?

  def authenticate
  	redirect_to new_session_path unless logged_in?
  end
  
end
