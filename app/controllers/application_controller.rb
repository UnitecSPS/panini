class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  protected

  def authenticate
  	#authenticate_or_request_with_http_basic do |username, password|
      #username == "foo" && password == "bar"
    #end
    unless session[:user_id].present?
      redirect_to login_path
    end
  end
end
