class PostsController < ApplicationController
 
   def show
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     @comments = @post.comments
     @comment = Comment.new
   end
 
   def new
     @topic = Topic.find(params[:topic_id])
     @post = Post.new
     authorize @post
   end
 
   def create
     @topic = Topic.find(params[:topic_id])
     @post = current_user.posts.build(post_params)
     @post.topic = @topic
     authorize @post
   end
 
   def edit
     @topic = Topic.find(params[:topic_id])
     @comments = Comment.where(post_id: params[:id]) #comments?
     @post = Post.find(params[:id])
     authorize @post
   end
 
   def update
     @topic = Topic.find(params[:topic_id])
     @comments = Comment.where(post_id: params[:id]) #comments?
     @post = Post.find(params[:id])
     authorize @post
     if @post.update_attributes(post_params)
       redirect_to [@topic, @post], notice: "Post was updated."
     else
       flash[:error] = "There was an error saving the post"
       render :new
     end
   end
 
   #method to post params
   private
 
   def post_params
     params.require(:post).permit(:title, :body, :image)
   end
 
 end