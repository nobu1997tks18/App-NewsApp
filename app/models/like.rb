class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true, uniqueness: { scope: :user_id}
end
