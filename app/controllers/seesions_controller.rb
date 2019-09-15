class SeesionsController < ApplicationController
skip_before_action :login_repuired

  def new
  end

  def create
    user = User. find_by(email: session_params[:email])

    if user&. authenticate(session_params[:password])
      session[:user_id] = user_id
      redirect_to root_path, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
