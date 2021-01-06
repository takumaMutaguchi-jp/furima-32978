class Item < ApplicationRecord

  # アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :user
  has_one_attached :image
  
  # バリデーション
  validates :category_id, numericality: { other_than: 1 }

end
