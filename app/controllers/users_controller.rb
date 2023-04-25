class UsersController < ApplicationController
#------------------SIGNUP--------------------#
# NEW 
  def new
    @user = User.new
    render template: "users/new"
  end

# CREATE
  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
     )
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/login", notice: "User was successfully created" #EDIT THIS REDIRECT TO SIGNUP RN
    else
      render :new, status: :unprocessable_entity
    end
  end 
end
