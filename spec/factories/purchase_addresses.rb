FactoryBot.define do
  factory :purchase_address do
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { '札幌市' }
    block { '1-1-2' }
    building { 'ロイヤルマンション' }
    phone_number { 11_123_456_789 }
  end
end
