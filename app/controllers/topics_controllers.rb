class TopicsController < ApplicationController
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
     @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
  end
end