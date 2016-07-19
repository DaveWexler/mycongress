class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :login_required
  helper_method :current_user, :logged_in?

  def current_user
    User.where(id: session[:user_id]).first if session[:user_id]
  end

  def login(user)
    session[:user_id] = @user.id
  end

  def logged_in?
    !!current_user
  end

  def login_required
    redirect_to root_path if !logged_in?
  end



end
