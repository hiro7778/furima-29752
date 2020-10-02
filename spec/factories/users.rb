FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaaa1111"}
    password_confirmation {password}
    first_name            {"あああ"}
    first_name_kana       {"カタカナ"}
    last_name             {"あああ"}
    last_name_kana        {"カタカナ"}
    birth_date            {"1992-01-01"}
  end
end