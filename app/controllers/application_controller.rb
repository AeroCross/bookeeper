class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user_id
  
  def current_user
    @current_user ||= User.find(current_user_id)
  end

  def current_user_id
    session[:current_user]
  end

  def alert(message, type = 'info')
    flash[:alert] = {
      :message => message,
      :type => type
    }
  end
end
