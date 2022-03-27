FactoryBot.define do
  factory :poll_choice do
    association :poll
    content { Faker::Hipester.sentence }
  end
end
