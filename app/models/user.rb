class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  with_options presence: true do
    validates :nickname
    validates :surname
    validates :given_name
    validates :surname_kana
    validates :given_name_kana
    validates :birthday
  end
end
