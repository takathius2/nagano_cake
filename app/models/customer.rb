class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 has_many :cart_items, dependent: :destroy
 has_many :orders, dependent: :destroy
 has_many :addresses, dependent: :destroy
 
 #なら有効会員、１なら退会済みの無効会員
 #enum is_deleted: { false: false, true: true }
 
  validates :encrypted_password, presence: true
  validates :email, presence: true
end
