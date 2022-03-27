FactoryBot.define do
  factory :vote do
    association :user, :poll, :poll_choice
  end
end
