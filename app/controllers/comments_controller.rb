class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment
    if @comment.save
      redirect_to [@post.topic, @post], notice: "Comment posted sucessfully!"
    else
      flash[:error] = "Comment failed. Please try again."
      redirect_to [@post]
    end
  end

 def destroy
    @post = Post.find(params[:post_id]) 
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    authorize @comment
    
   if @comment.destroy
      flash[:notice] = "Comment was removed."
      #redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again"
      #redirect_to [@post.topic, @post]
    end
      respond_to do |format|
        format.html
        format.js   
  end
 end
  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end