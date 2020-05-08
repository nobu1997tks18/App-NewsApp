User.create(
  name: "金澤伸行",
  email: "nobu@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  admin: true
  )

User.create(
  name: "田中太郎",
  email: "taro@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa"
  )

99.times do 
  name = Faker::Name.last_name
  email = Faker::Internet.email
  password = "password"
  User.create(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end

users = User.all
user = users.first
followings = users[2..50]
followers = users[12..70]
followings.each {|following| user.follow(following)}
followers.each {|follower| follower.follow(user)}


users = User.order(:created_at).take(6)
50.times do 
  content = Faker::Lorem.sentence
  url = Faker::Internet.url
  created_at = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  users.each do |user|
    user.posts.create!(content: content, url: url, created_at: created_at)
  end
end
