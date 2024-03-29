class Public::RelationshipsController < ApplicationController
  #フォローする時
  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end
  
  #フォロー外す時
  def destroy
    # byebug
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
  end
  
  #フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    @user = current_user
  end

  #フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    @user = current_user
  end
end
