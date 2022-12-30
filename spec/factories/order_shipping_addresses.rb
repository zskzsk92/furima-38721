FactoryBot.define do
  factory :order_shipping_address do
    postal_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4)  }
    region_id { 14 }
    town { Faker::Address.city }
    street_address { Faker::Address.street_address}
    name_of_building { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11)  }
    user_id {'1'}
    item_id {'1'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
