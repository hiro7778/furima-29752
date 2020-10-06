FactoryBot.define do
  factory :item do
    association :user
    name {"kkkk"}
    price {3000}
    explain {"kkkkk"}
    category_id {2}
    condition_id {2}
    shipping_fee_id {2}
    prefecture_id {2}
    shipping_date_id {2}
  end
end
