class Topics::PostsController < ApplicationController
 
  def index
    @post = Post.all
    authorize @posts
  end
  
  def new
     @topic = Topic.find(params[:topic_id])
     @post = Post.new
     authorize @post
  end
  
  def show
     @topic = Topic.find(params[:topic_id]) 
     @post = Post.find(params[:id]) 
     @comments = @post.comments
     @comment = Comment.new
     authorize @topic
   end
 
   def destroy
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     title = @post.title
     authorize @post
     
     if @post.destroy
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to @topic
     else
       flash[:error] = "There was an error deleting this post."
       render :show
     end
   end  
     
   def create
     @topic = Topic.find(params[:topic_id])
     @post = current_user.posts.build(post_params)
     @post.topic = @topic
     authorize @post
          
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end
   
   def edit
     @post = Post.find(params[:id])
     @topic = Topic.find(params[:topic_id])
     @comments = Comment.where(post_id: params[:id]) 
     authorize @post
   end
 
   def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
     
     @comments = Comment.where(post_id: params[:id]) 
     
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post] 
     else
       flash[:error] = "There was an error saving the post"
       render :new
     end
   end
 
   private
 
   def post_params
     params.require(:post).permit(:title, :body, :image)
   end
 
 end