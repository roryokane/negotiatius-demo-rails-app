class CartItem < ActiveRecord::Base
  has_one :product
  validates :quantity, numericality: { only_integer: true, greater_than: 0}
end
