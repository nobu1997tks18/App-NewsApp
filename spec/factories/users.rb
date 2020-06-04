FactoryBot.define do
  factory :user do
    name                       {"nobu"}
    email                      {"nobu@test.com"}
    password                   {"aaaaaaaa"}
    password_confirmation      {"aaaaaaaa"}
    admin                      {1}
    picture                    {File.open("spec/fixtures/top.jpg")}
    profile                    {"プログラミング学習中です"}
  end
end