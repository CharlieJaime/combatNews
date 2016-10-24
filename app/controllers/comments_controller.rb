class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_topic, only: [:create, :edit, :update, :destroy]
  before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @topic.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to topic_path(@topic)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to topic_path(@topic)
    else
      render "edit"
    end
  end

  def destroy
    @comment.destroy
    redirect_to topic_path(@topic)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end

  def find_comment
    @comment = @topic.comments.find(params[:id])
  end
end
