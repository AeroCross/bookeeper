class AuthController < ApplicationController
  def index
    if logged_in?
      return redirect_to default_path
    else
      render_form
    end
  end

  def login
    if authenticate(user)
      create_session
      return redirect_to default_path
    else
      alert("Incorrect username or password", "warning")
    end
    redirect_to login_path
  end

  def logout
    destroy_session
    alert("You've been logged out")
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
    session[:current_user] = user.id
  end

  def destroy_session
    session[:current_user] = nil
  end
  
  def authenticate(user)
    user.respond_to?(:authenticate) && user.authenticate(auth_params[:password])
  end

  def logged_in?
    session[:current_user] ? true : false
  end

  def render_form
    return render "auth/login"
  end
end
