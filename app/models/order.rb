class Order < ApplicationRecord

  attr_accessor :token
  # アソシエーション
  belongs_to :purchase_management

  # バリデーション
  with_options presence: true do
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :purchase_management
    validates :token
  end

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}+\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{11}+\z/ }
end
