class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery
    belongs_to :fee


    with_options presence: true do
      validates :product_name
      validates :description
      validates :image
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :condition_id
        validates :fee_id
        validates :area_id
        validates :delivery_id
      end
    end
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

end
