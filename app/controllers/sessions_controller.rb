class SessionsController < ApplicationController
 
# NEW 
  def new
    render template: "sessions/new"
  end

# CREATE
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

# DESTROY/DELETE
  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end