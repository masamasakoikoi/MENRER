class Public::PostsController < ApplicationController
  before_action :authenticate_user!,except:[:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @comment = Comment.all
    @q = Post.ransack(params[:q])
    @posts =  @q.result.page(params[:page]).per(10)
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
    @q = Post.ransack(params[:q])
    @posts =  @q.result
    @post = Post.new(post_params)
    @post.user_id = current_user.id
     if @post.save
        redirect_to posts_path
     else
       render :index
     end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:store_name, :post_code, :address, :regular_holiday, :review, :image, genre_ids: [])
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
  end
end
