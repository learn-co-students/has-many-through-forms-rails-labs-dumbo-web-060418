class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)

    if comment_params[:user_attributes][:username] != ""
      user = User.find_or_create_by(comment_params[:user_attributes])
    else
      user = User.find(comment_params[:user_id])
    end
    
    comment.user = user
    comment.save
    redirect_to post_path(comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
