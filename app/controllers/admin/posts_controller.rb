class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!,except:[:top]
  def index
    @posts = Post.all
  end
end
