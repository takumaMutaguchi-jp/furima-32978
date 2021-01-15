class OrderPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_management_id, :token, :user_id, :item_id

  # バリデーション
  with_options presence: true do
    validates :municipality
    validates :address
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}+\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{11}+\z/ }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }

  def save
    purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id,
                 municipality: municipality, address: address,
                 building_name: building_name, phone_number: phone_number,
                 purchase_management_id: purchase_management.id )
  end
end