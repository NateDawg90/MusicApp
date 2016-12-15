class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    # fail
    user = User.find_by_credentials(user_params[:email],
                                    user_params[:password])
    login_user!(user)
  end

  def destroy
    unless current_user.nil?
      current_user.reset_session_token!
      session[:session_token] = ""
    end

    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
