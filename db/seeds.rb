User.create(
  name: "管理者ユーザー",
  email: "nobu@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  profile: "ユーザ管理者です！是非このアプリを活用してください！",
  admin: true

)
User.create(
  name: "田中太郎",
  email: "nobu@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  profile: "プログラミング学習中です！ バックエンドエンジニアを目指しています！",
)

User.create(
  name: "田中次郎",
  email: "taro@test.com",
  password: "aaaaaaaa",
  password_confirmation: "aaaaaaaa",
  profile: "フロントエンジニアを目指して学習中です！ Javascriptが得意です！"
  )

  
  
  %w[経済 ビジネス 政治 マネー スポーツ 海外 その他].each {|genre| Genre.create(name: genre)}