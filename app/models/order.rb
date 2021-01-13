class Order < ApplicationRecord
  attr_accessor :token

  # アソシエーション
  belongs_to :purchase_management

  # バリデーション
  with_options presence: true do
    validates :municipality
    validates :address
    validates :purchase_management
    validates :token
  end

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}+\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{11}+\z/ }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
end
