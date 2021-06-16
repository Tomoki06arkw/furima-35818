class PurchaseShippingAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

    with_options presence: true do
      validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hypen(-)"}
      validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
      validates :city
      validates :address
      validates :phone_number, format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "Phone number is invalid"}
      validates :user_id
      validates :item_id
      validates :token
    end
    
    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, purchase_id: purchase.id)
    end
end

