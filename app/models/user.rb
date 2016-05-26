class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :cart_items, through: :products

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
