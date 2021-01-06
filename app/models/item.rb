class Item < ApplicationRecord

  # アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  

end
