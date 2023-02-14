class Public::PostsController < ApplicationController
  def index
    @comment = Comment.all
    @q = Post.ransack(params[:q])
    @posts =  @q.result
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # binding.pry
    @post.save
    redirect_to posts_path
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:store_name, :post_code, :address, :regular_holiday, :review, genre_ids: [])
  end
  
  # def set_post
  #   @post = Post.find(params[:post_id])
  # end
end
