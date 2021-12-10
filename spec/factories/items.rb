FactoryBot.define do
  factory :item do
    name                 { Faker::Game.platform }
    explanation          { Faker::Quote.famous_last_words }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id          { Faker::Number.between(from: 2, to: 11) }
    status_id            { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id   { Faker::Number.between(from: 2, to: 3) }
    shipment_source_id   { Faker::Number.between(from: 2, to: 48) }
    days_id              { Faker::Number.between(from: 2, to: 4) }
  
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
