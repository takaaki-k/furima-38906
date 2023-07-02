FactoryBot.define do
  factory :purchase_shippingaddress do
    postcode              { (Faker::Number.number(digits: 3)).to_s + '-' + (Faker::Number.number(digits: 4)).to_s }
    prefecture_id         { Faker::Number.within(range: 2..48) }
    municipalities        { Faker::Address.city }
    address               { Faker::Address.street_address }
    building_name         { Faker::Address.building_number }
    phone_num             { Faker::Number.number(digits: 11) }
    token                 { 'tok_' + (Faker::Alphanumeric.alphanumeric(number: 30)) }
  end
end
