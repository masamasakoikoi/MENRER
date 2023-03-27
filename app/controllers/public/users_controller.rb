class Public::UsersController < ApplicationController
  before_action :authenticate_user!,except:[:top]
 
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(10)
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
  
  private
  
  def user_params
    # binding.pry
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email)
  end

end
