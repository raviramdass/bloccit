class VotesController < ApplicationController
  before_filter :setup
    
  def up_vote
    update_vote(1)
    redirect_to :back
  end

  def down_vote
    update_vote(-1)
    redirect_to :back
  end

  def setup
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first   
  end

  def update_vote(new_value)
    if @vote 
       @vote.update_attributes(value: new_value, post: @post)
    else 
      @vote = current_user.votes.create(value: new_value, post: @post)
    end
   end

  def create
  end
  
end