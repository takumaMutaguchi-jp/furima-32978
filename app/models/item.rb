class Item < ApplicationRecord

  # アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_burden
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image
  
  # バリデーション
  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_state_id
    validates :shipping_burden_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  validates :item_price, presence: true, format: {with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
end
