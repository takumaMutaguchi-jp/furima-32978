class OrderPurchase

  include ActiveModel::ActiveModel
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_management_id, :user_id, :item_id

  # バリデーション
  with_options presence: true do
    validates :municipality
    validates :address
    validates :purchase_management
    validates :token
    validates :user
    validates :item
  end
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}+\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{11}+\z/ }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }

end