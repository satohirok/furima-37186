FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    shipment_source_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { '江東区' }
    house_number{ '大島1-1' }
    building{ '森ビル111' }
    tel_number{ '08012345678' }
    token{"tok_abcdefghijk00000000000000000"}
  end
end
