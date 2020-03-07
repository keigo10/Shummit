FactoryBot.define do
  factory :user do
    family_name { Faker::Lorem.characters(number:4) }
    first_name { Faker::Lorem.characters(number:4) }
    family_name_kana { 'タロウ' }
    first_name_kana { 'ヨシダ' }
    email { Faker::Internet.email }
    tel { '1234567890' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end