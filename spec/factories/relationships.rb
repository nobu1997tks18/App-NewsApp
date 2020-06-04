FactoryBot.define do
  factory :relationship do
    follower_id, class: User
    following_id, class: User
  end
end