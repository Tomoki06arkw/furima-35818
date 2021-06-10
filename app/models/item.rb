class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_day
    belongs_to :fee


    with_options presence: true do
      validates :product_name
      validates :description
      validates :price
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :condition_id
        validates :fee_id
        validates :area_id
        validates :delivery_day_id
      end
    end

end
