class Order < ApplicationRecord

  # アソシエーション
  belongs_to :purchase_management

  # バリデーション
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :purchase_managemen
  end

end
