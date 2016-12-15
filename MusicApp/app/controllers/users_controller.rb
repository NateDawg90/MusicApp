class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(email: user_params[:email],
                    password: user_params[:password])
    if User.find_by(email: user_params[:email])
      flash.now[:messages] = "User already exists"
      render :new
    elsif user.save
      # fail
      login_user!(user)
    else
      flash.now[:messages] = user.errors.full_messages
      render :new
    end
  end

  def show
    @user = current_user
  end
end
