User.create(
  name: "管理者ユーザー",
  email: "nobu@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  profile: "プログラミング学習中です！",
  admin: true
)

User.create(
  name: "田中太郎",
  email: "taro@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  profile: "プログラミング学習中です！"
  )
  
  %w[経済 ビジネス 政治 マネー スポーツ 海外 その他].each {|genre| Genre.create(name: genre)}