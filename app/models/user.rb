class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  def admin?
     role == 'admin'
  end

  def moderator?
     role == 'moderator'
  end
  
  def favorited(post)
    favorites.where(post_id: post.id).first
  end
 
  def voted(post)
    votes.where(post_id: post.id).first
  end
  
end