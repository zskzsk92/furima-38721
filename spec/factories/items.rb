FactoryBot.define do
  factory :item do
    association :user

    item_name {Faker::Team.name}
    item_description {Faker::Lorem.characters}
    price {1000}
    category_id {2}
    item_status_id {2}
    ship_method_id {2}
    region_id {2}
    ship_date_id {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
