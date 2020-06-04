class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :uniqueness: { scope: :user_id}

  def liked_by?(user)
    likes.users.include?(user)
  end
end
