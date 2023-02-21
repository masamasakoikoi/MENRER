class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!,except:[:top]
  
  def index
    @users = User.all
    # @user = User.find(params[:id])
  end

  def unsubscribe
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました'
    redirect_to admin_users_path
  end

  def status
  end
end
