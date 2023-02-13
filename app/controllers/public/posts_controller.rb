class Public::PostsController < ApplicationController
  # before_action :set_post
  def index
    # @genres = Genre.all
    #ジャンル検索
    # @posts = params[:genre_name].present? ? Genre.find(params[:genre_name]).posts : Post.all
    
    @comment = Comment.all
    # @posts = Post.all
    #ransack検索
    # @q = Post.ransack(params[:q])
    # @posts = @q.result
    
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
  
  private
  
  def post_params
    params.require(:post).permit(:store_name, :post_code, :address, :regular_holiday, :review, genre_ids: [])
  end
  
  # def set_post
  #   @post = Post.find(params[:post_id])
  # end
end
