class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    post_comment = current_user.comments.new(comment_params)
    post_comment.post_id = @post.id
    # binding.pry
    post_comment.save
    redirect_to post_path(@post)
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end
  
  def comment_params
    params.require(:comment).permit(:post_comment)
  end
end
