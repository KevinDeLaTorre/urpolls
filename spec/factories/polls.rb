FactoryBot.define do
  factory :poll do
    association :user
    title { Faker::Lorem.question }
  end
end
