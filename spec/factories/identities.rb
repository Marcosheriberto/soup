FactoryGirl.define do
  factory :identity do
    sequence(:uid) { |n| "#{n}" }
    sequence(:provider){ |n| "provider_#{n}" }
    user nil

    trait :with_twitter do
      provider 'twitter'
    end

    trait :with_instagram do
      provider 'twitter'
    end

    trait :with_facebook do
      provider 'twitter'
    end

    trait :with_user do
      user
    end
  end
end
