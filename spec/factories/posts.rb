FactoryBot.define do
  factory :post do
    content {"このニュースについて話しましょう"} 
    url     {Faker::Internet.url}
    user
    after(:build) do |post|
      post.posts_genres_relationship_ids << FactoryBot.build(:posts_genres_relationship, post_id: post.id)
    end
  end
end