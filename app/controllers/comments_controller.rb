class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    
    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment
    
    if @comment.save
      
      flash[:notice] = "Comment posted sucessfully!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving comment, please try again."
      redirect_to [@post.topic, post]
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
    params.require(:comment).permit(:body)
  end

end