FactoryBot.define do
  factory :content do
    user { nil }
    title { "MyString" }
    url { "MyString" }
    media_type { "MyString" }
    status { 1 }
    rating { 1 }
    memo { "MyText" }
  end
end
