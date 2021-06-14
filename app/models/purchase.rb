class Purchase < ApplicationRecord
  has_many :users
  has_many :items
  has_one  :shipping_address
end
