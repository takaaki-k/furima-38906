FactoryBot.define do
  factory :item do
    item_name           { Faker::Commerce.product_name }
    explanation         { Faker::Lorem.sentence }
    category_id         { Faker::Number.within(range: 2..11) }
    condition_id        { Faker::Number.within(range: 2..7) }
    postage_id          { Faker::Number.within(range: 2..3) }
    prefecture_id       { Faker::Number.within(range: 2..48) }
    time_to_ship_id     { Faker::Number.within(range: 2..4) }
    price               { Faker::Number.within(range: 300..9999999) }
  
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
