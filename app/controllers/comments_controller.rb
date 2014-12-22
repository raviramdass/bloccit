class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:user])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end
  
  def new
    @comment = Comment.find(params[:user])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @comment
  end
  
  def create
    @post = Post.find(params[:id])
    @comment = @post.comment.create(comment_params)
    redirect_to post_path(@comment)
  end
  
  def edit
    @comment = Comment.find(params[:user])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @comment
  end
  
private
  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end