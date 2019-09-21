class Admin::UsersController < ApplicationController
  skip_before_action :login_required
  before_action :require_admin ,except: [:new, :create]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path(@user), notice:"ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to admin_users_path(@user),notice:"ユーザー「#{@user.name}」を更新しました。"
      else
        render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    rediret_to admin_users_url, notice:"ユーザー「#{@user.name}」を削除しました。"
  end

  
  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    if user_logged_in? && current_user.admin? 
    end
  end


  def user_logged_in?
  !current_user.nil?
  end
end
