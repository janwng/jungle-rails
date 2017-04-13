class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If user exists AND password entered is correct
    if user && user.authenticate(params[:password])
      # Then save user id inside browser cookie
      # (this keeps the user logged in when they navigate around site)
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, redirect them to login form
      redirect_to '/login'
    end
  end

  # Method to allow users to log out
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
