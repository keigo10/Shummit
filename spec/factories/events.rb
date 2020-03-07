FactoryBot.define do
  factory :event do
    events_name { Faker::Lorem.characters(number:4) }
    entrance_fee { '2000' }
    holding { '2020/02/29' }
    event_status { 'true' }
    description { Faker::Lorem.characters(number:4) }
    prefecture_code { '4' }
    address_city { '渋谷区' }
    address_street { '道玄坂1-2' }
  end
end