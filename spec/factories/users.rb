FactoryBot.define do
  factory :user do
    name {"Michael Example"}
    email {"michael@example.com"}
    #password_digest {User.digest('password')}
    password {"password"}
    password_confirmation {"password"}
    # 有効化
    #activated true
  end
end
