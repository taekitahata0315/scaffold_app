class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_repuired
  private

  def current_user
    @current_user || = User.find_by(id: session[:user_id]) if session[:user]
  end

  def login_repuired
    redirect_to login_path unless current_user
  end
end
