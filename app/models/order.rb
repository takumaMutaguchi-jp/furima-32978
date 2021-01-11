class Order < ApplicationRecord

  # アソシエーション
  belongs_to :purchase_management
  
end
