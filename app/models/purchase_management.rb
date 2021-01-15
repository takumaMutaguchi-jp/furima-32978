class PurchaseManagement < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :order

end
