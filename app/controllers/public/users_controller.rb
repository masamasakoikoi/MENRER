class Public::UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def unsubscribe
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました'
    redirect_to admin_users_path
  end
  
  private
  
  def user_params
    # binding.pry
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
  end
end
