class AuthController < ApplicationController
  def index
    # check if logged in
      # if so, send to main paage
      # if not, show login form
    render "auth/login"
  end

  def login
    if user.respond_to?(:authenticate) && user.authenticate(auth_params[:password])
      create_session
      return render plain: "OK"
    end

    # only for GET
    render_form
  end

  def logout
    destroy_session
    flash[:alert] = {
      :message => "You've been logged out",
      :type => 'info'
    }
    render_form
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

  def render_form
    return render 'auth/login'
  end
end
