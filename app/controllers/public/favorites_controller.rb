class Public::FavoritesController < ApplicationController
    # before_action :set_post
    def create
        @post_content = Post.find(params[:post_id])
        @post_favorite = current_user.favorites.find_or_create_by(post_id: @post_content.id)
        # redirect_to posts_path
    end
    
    def destroy
        @post_content = Post.find(params[:post_id])
        @post_favorite = current_user.favorites.find_by(post_id: @post_content.id)
        @post_favorite.destroy if @post_favorite
        # redirect_to posts_path
    end
    
    # private
    
    # def set_post
    #     @post = Post.find(params[:post_id])
    # end
end
