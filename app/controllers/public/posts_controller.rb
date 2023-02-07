class Public::PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end
  
  def create
    post = Post.new(post_params)
    post.save
    redirect_to '/top'
  end
  
  private
  
  def post_params
    params.require(:post).permit(:store_name, :post_code, :address, :regular_holiday, :review)
  end
end
