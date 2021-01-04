class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  validates :nickname, presence: true
  validates :surname, presence: true
  validates :given_name, presence: true
  validates :surname_kana, presence: true
  validates :given_name_kana, presence: true
  validates :birthday, presence: true
end
