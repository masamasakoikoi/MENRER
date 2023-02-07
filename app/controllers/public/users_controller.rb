class Public::UsersController < ApplicationController
  def index
     binding.pry
    @user = User.find(params[:id])
  end

  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end
end
