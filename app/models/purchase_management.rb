class PurchaseManagement < ApplicationRecord

  # アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :order

  # バリデーション
  with_options presence: true do
    validates :user
    validates :item
  end

end
