class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    with_options presence: true do
      validates :product_name
      validates :description
      validates :price
      validates :category_id
      validates :condition_id
      validates :fee_id
      validates :area_id
      validates :delivery_day_id
    end

end
