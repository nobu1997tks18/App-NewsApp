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
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end