FactoryBot.define do

  factory :card do
    association :user
    user_id            {"3"}
    customer_id        {"abc"}
    card_id            {"abc"}
  end
end