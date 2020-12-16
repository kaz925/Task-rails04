class CommentsController < ApplicationController
  
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to topics_path, danger: 'コメントできませんでした'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment,:topic_id) 
  end
  
end