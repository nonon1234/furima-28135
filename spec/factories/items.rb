FactoryBot.define do
  factory :item do
    Faker::Config.locale = 'ja'
    name { Faker::Food.dish }
    description { Faker::Food.description }
    category_id { 1 }
    status_id { 1 }
    sipping_fee_id { 1 }
    sipping_area_id { 1 }
    sipping_time_id { 1 }
    price { 500 }
    association :user
  end
end
