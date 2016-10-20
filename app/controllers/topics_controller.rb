class TopicsController < ApplicationController
  def index

  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :description)
  end

end
