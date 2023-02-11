class Public::PostsController < ApplicationController
  def index
    # @genres = Genre.all
    #ジャンル検索
    # @posts = params[:genre_name].present? ? Genre.find(params[:genre_name]).posts : Post.all
    
    @comment = Comment.all
    # @posts = Post.all
    
    #ransack検索
    # @q = Post.ransack(params[:q])
    # @posts = @q.result
    
    @q = params[:q]
    @posts = Post.ransack(store_name_cont: @q).result
    @genres = Genre.ransack(genre_name_cont: @q).result
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
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
end
