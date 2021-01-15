class Order < ApplicationRecord
  attr_accessor :token

  # アソシエーション
  belongs_to :purchase_management

  
end
