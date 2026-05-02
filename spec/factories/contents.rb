FactoryBot.define do
  factory :content do
    association :user
    sequence(:title) { |n| "コンテンツ#{n}" }
    url { "" }
    media_type { "book" }
    status { :unread }
    rating { nil }
    memo { "" }

    trait :done do
      status { :done }
      rating { 4 }
    end

    trait :with_url do
      url { "https://example.com" }
    end
  end
end
