class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader

  def admin?
     role == 'admin'
  end

  def moderator?
     role == 'moderator'
  end
  
end