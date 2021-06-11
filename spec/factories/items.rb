FactoryBot.define do
  factory :item do
    product_name            {"洋服"}
    description             {"商品の説明"}
    price                   {1111111}
    category_id             {2}
    condition_id            {3}
    fee_id                  {4}
    area_id                 {5}
    delivery_id             {6}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
