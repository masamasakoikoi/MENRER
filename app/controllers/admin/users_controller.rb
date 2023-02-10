class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def unsubscribe
  end

  def status
  end
end
