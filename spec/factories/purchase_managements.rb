FactoryBot.define do
  factory :purchase_management do
    association :user
    association :item
  end
end
