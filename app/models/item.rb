class Item < ApplicationRecord

  # アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_burden
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
  
  # バリデーション
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_state_id
    validates :shipping_burden_id
  end

end
