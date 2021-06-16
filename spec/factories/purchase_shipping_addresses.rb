FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code               { '111-0000' }
    city                      { 'やま' }
    address                   { 'やま' }
    prefecture_id             { 2 }
    phone_number              {"09012341111"}
    token                     {"tok_abcdefghijk00000000000000000"}
  end
end
