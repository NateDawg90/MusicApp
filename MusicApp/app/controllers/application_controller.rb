class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :login_user!



  def login_user!(user)
    # fail
    if user.nil?
      fail
      redirect_to new_session_url
    else
      session[:session_token] = user.reset_session_token!

      redirect_to bands_url
    end
  end

  def logged_in?
    current_user ? true : false
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    @current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
