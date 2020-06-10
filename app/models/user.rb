class User < ApplicationRecord
  mount_uploader :picture, PictureUploader
  before_save {self.email = email.downcase}

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_secure_password

  default_scope -> {order(name: :desc)} 
  validates :name, presence: true, length: {maximum:25}
  Email_Regex = /\A[\w\-.]+@\w*.(?!.*?\.\.)(\.[\w\.]+)\z/
  validates :email, presence: true,length: {maximum:100},format:{with: Email_Regex},uniqueness:{case_sensitive: false}
  validates :password, presence: true, length: {minimum: 8}, allow_nil: true
  
  def follow(other_user)
    unless self == other_user
      followings << other_user
    end
  end
  
  def following?(other_user)
    followings.include?(other_user)
  end


  def unfollow(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def feed
    following_ids = "SELECT following_id FROM relationships WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end

  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end
end
