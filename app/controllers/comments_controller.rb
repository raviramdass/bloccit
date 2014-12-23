class CommentsController < ApplicationController
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

#   authorize @comment
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment posted sucessfully!"
    else
      flash[:error] = "Comment failed. Please try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end