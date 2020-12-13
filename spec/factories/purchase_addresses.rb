FactoryBot.define do
  factory :purchase_address do
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { '札幌市' }
    block { '1-1-2' }
    building { 'ロイヤルマンション' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
