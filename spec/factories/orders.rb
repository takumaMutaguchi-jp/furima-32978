FactoryBot.define do
  factory :order do
    postal_code   { 1_234_567.to_s.insert(3, '-') }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality  { Faker::Address.street_name }
    address       { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number  { Faker::PhoneNumber.subscriber_number(length: 11) }
    token         { 'tok_xxxxxxxxxxxxxxxxxxxxxxxxxxxx' }
    purchase_management_id { FactoryBot.create(:purchase_management).id }
  end
end
