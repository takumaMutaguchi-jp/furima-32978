class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/} do
    validates :surname
    validates :given_name
  end
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/} do
    validates :surname_kana
    validates :given_name_kana
  end
  with_options format: {with: /\A[a-zA-Z0-9]+\z/} do
    validates :password
    validates :password_confirmation
  end
end
