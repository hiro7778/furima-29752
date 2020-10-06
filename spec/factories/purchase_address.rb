FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id {2}
    city { '東京都' }
    house_number { '111' }
    building_name { '渋谷222' }
    phone_number { '09011112222' }
  end
end