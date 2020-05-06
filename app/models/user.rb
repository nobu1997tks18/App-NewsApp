class User < ApplicationRecord
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follewer_relationships

  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum:50}
  Email_Regex = /\A[\w\-.]+@\w*.(?!.*?\.\.)(\.[\w\.]+)\z/
  validates :email, presence: true,length: {maximum:100},
            format:{with: Email_Regex},
            uniqueness:{case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 8}, allow_nil: true

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def follow(other_user)
    followings << other_user
  end

  def unfollow(other_user)
    self.following_relationships.find_by(following_id: other_user.id).destroy
  end
end
