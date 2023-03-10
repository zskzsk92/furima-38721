class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Password is invalid. Include both letters and numbers." }

  with_options presence: true do
    validates :nickname
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :kana_last_name, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :kana_first_name, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :birthday
  end

end
