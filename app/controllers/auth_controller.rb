class AuthController < ApplicationController
  def index
    if logged_in?
      # redirect to the main page
      return render plain: "OK"
    else
      render_form
    end
  end

  def login
    if authenticate(user)
      create_session
      # redirect to the main page
      return render plain: "OK"
    else
      flash[:alert] = {
        :message => "Incorrect username or password",
        :type => "danger",
      }
    end
    redirect_to login_path
  end

  def logout
    destroy_session
    flash[:alert] = {
      :message => "You've been logged out",
      :type => "info",
    }
    redirect_to login_path
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

  def user
    @user ||= User.find_by_email(params[:email])
  end

  def create_session
    session[:logged_in_user] = user.id
  end

  def destroy_session
    session[:logged_in_user] = nil
  end
  
  def authenticate(user)
    user.respond_to?(:authenticate) && user.authenticate(auth_params[:password])
  end

  def logged_in?
    session[:logged_in_user] ? true : false
  end

  def render_form
    return render "auth/login"
  end
end
