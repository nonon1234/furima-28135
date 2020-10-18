FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'ja'
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 10)
    password { password }
    password_confirmation { password }
    last_name { Faker::Name.first_name }
    first_name { Faker::Name.last_name }
    last_name_kana { 'イロハ' }
    first_name_kana { 'アイウエオ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
