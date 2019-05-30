FactoryBot.define do
  factory :user do
    name {"Michael Example"}
    email {"michael@example.com"}
    password {"password"}
    password_confirmation {"password"}
    # 有効化
    admin {true}
    activated  {true}
    activated_at {Time.zone.now}
  end

  factory :archer, class: User do
    name {"Sterling Archer"}
    email {"duchess@example.gov"}
    password {"password"}
    password_confirmation {"password"}
    activated  {true}
    activated_at {Time.zone.now}
  end

  factory :lana, class: User do
    name {"Lana Kane"}
    email {"hands@example.gov"}
    password {"password"}
    password_confirmation {"password"}
    activated  {true}
    activated_at {Time.zone.now}
  end

  factory :malory, class: User do
    name {"Malory Archer"}
    email {"boss@example.gov"}
    password {"password"}
    password_confirmation {"password"}
    activated  {true}
    activated_at {Time.zone.now}
  end


  30.times do |n|
    factory :"user_#{n}", class: User do
      name {"User #{n}"}
      email {"user-#{n}@example.com"}
      password {"password"}
      password_confirmation {"password"}
      activated  {true}
      activated_at {Time.zone.now}
    end
  end
  
end
