class CommentsController < ApplicationController
  def show
    @comments = Comments.find(params[:user])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end
  
  def new
    @comments = Comments.find(params[:user])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @comments
  end
  
  def create
    @comments = Comments.new(comments_param)
    @comments.save
    redirect_to @comments
  end
  
  def edit
    @comments = Comments.find(params[:user])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @comments
  end
  
private
  def comments_params
    (params.require(:user).permit(:comment, :text)
  end
end
