FactoryBot.define do
  factory :item do
    association :user
    image {Faker::Lorem.sentence}
    name {"kkkk"}
    price {3000}
    explain {"kkkkk"}
    category_id {2}
    conditions_id {2}
    shipping_fees_id {2}
    prefectures_id {2}
    shipping_date_id {2}
  end
end
