class AuthController < ApplicationController

  def index
    # check if logged in
      # if so, send to main paage
      # if not, show login form
    render "auth/login"
  end

  def login
    # attempt to login
    # process login form
  end

  def logout
    # destroy session
  end
end
