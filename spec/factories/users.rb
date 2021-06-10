FactoryBot.define do
  factory :user do
    nickname                  {"トモ"}
    email                     {Faker::Internet.free_email}
    password                  {"2222ab"}
    password_confirmation     {"2222ab"}
    first_name                {"山"}
    last_name                 {"川"}
    first_name_kana           {"ヤマ"}
    last_name_kana            {"カワ"}
    birthday                  {"2000-01-01"}
  end
end