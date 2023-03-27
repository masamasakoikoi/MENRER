class Public::PostsController < ApplicationController
  before_action :authenticate_user!,except:[:top]
  
  def index
    # @comment = Comment.all
    @q = Post.includes(:favorite_users).includes(:comments).ransack(params[:q])
    @posts =  @q.result.page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.new
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render "edit"
    else
      redirect_to posts_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       redirect_to post_path(@post)
    else
       render :edit
    end
  end
  
  def create
    @q = Post.ransack(params[:q])
    @posts =  @q.result
    @post = Post.new(post_params)
    @post.user_id = current_user.id
     if @post.save
        redirect_to posts_path
     else
       render :new
     end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:store_name, :post_code, :address, :regular_holiday, :review, :image, :rate, genre_ids: [])
  end
  
end
