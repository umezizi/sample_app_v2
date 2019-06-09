FactoryBot.define do
  factory :orange do
    id {"1"}
    content {"I just ate an orange!"}
    created_at {10.minutes.ago}
    # user_id {"1"}
    user
  end

  factory :tau_manifesto, class: Micropost do
    id {"2"}
    content {"Check out the @tauday site by @mhartl: http://tauday.com"}
    created_at {3.years.ago}
    # user_id {"1"}
    user
  end

  factory :cat_video, class: Micropost do
    id {"3"}
    content {"Sad cats are sad: http://youtu.be/PKffm2uI4dk"}
    created_at {2.hours.ago}
    # user_id {"1"}
    user
  end

  factory :most_recent, class: Micropost do
    id {"4"}
    content {"Writing a short test"}
    created_at {Time.zone.now}
    # user_id {"1"}
    user
  end

  30.times do |n|
    factory :"micropost#{n}", class: Micropost do
      id {"#{n}"}
      content {Faker::Lorem.sentence(5)}
      created_at {42.days.ago}
      # user_id {"1"}
      user
    end
  end

  factory :ants, class: Micropost do
    id {"5"}
    content {"Oh, is that what you want? Because that's how you get ants!"}
    created_at {2.years.ago}
    user
  end

  factory :zone, class: Micropost do
    id {"6"}
    content {"Danger zone!"}
    created_at {3.days.ago}
    archer
  end

  factory :tone, class: Micropost do
    id {"7"}
    content {"I'm sorry. Your words made sense, but your sarcastic tone did not."}
    created_at {10.minutes.ago}
    lana
  end

  factory :van, class: Micropost do
    id {"8"}
    content {"Dude, this van's, like, rolling probable cause."}
    created_at {4.hours.ago}
    lana
  end
end
