class Post < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :desc)} 
  validates :user_id, presence: true, allow_nil: true
  validates :content, presence: true, length:{maximum:140 }
  validates :url, presence: true, length: {maximum: 500}
  validates :genre, presence: true, length:{maximum: 10}
end
