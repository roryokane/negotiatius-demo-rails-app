class CartItem < ActiveRecord::Base
  has_one :product
  has_one :user, through: :product

  validates :quantity, numericality: { only_integer: true, greater_than: 0}
end
