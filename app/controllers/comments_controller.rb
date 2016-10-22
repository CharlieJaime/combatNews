class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create(comment_params)
    @comment.user_id = current_user.user_id

    if @comment.save
      redirect_to topic_path(@topic)
    else
      render "new"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
