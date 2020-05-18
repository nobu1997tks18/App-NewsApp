User.create(
  name: "金澤伸行",
  email: "nobu@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  profile: "プログラミング学習中です！ポートフォリオ一作目として作成しました！",
  admin: true
)

User.create(
  name: "田中太郎",
  email: "taro@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  profile: "プログラミング学習中です！バックエンドエンジニア目指して学習してます！"
  )

User.create(
  name: "田中次郎",
  email: "jiro@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  profile: "プログラミング学習中です！フロントエンドエンジン遺雨足て学習してます。JSが得意です！"
  )
  
  %w[経済 ビジネス 政治 マネー スポーツ 海外 その他].each {|genre| Genre.create(name: genre)}

20.times do 
  name = Faker::Name.last_name
  email = Faker::Internet.email
  password = "password"
  User.create(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    profile: "プログラミング学習中です！"
  )
end


20.times do 
  post_id = Faker::Number.within(range: 1..99)
  user_id = Faker::Number.within(range: 1..99)
  Comment.create(
    content: "いい記事ですね！",
    user_id: user_id,
    post_id: post_id
  )
end

20.times do 
  post_id = Faker::Number.within(range: 1..99)
  user_id = Faker::Number.within(range: 1..99)
  Like.create(
    user_id: user_id,
    post_id: post_id
  )
end

users = User.all
user = users.first
followings = users[2..50]
followers = users[12..70]
followings.each {|following| user.follow(following)}
followers.each {|follower| follower.follow(user)}

20.times do 
  user_id = Faker::Number.within(range: 1..99)
  genre_id = 1
  post_id = Post.create(
    content: "この記事は非常に参考になります",
    url: "https://newspicks.com/",
    user_id: user_id,
    genre_ids: genre_id
  )
end