FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id {2}
    city { '東京都' }
    house_number { '渋谷111' }
    phone_number { '09011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end