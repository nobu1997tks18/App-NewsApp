class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :posts_genres_relationships
  has_many :genres, through: :posts_genres_relationships

  default_scope -> {order(created_at: :desc)} 
  validates :user_id, presence: true, allow_nil: true
  validates :content, presence: true, length:{maximum:140 }
  validates :url, presence: true, length: {maximum: 500}
  validates :posts_genres_relationship_ids, presence: true
end
