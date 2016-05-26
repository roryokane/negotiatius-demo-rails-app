class CartItem < ActiveRecord::Base
  belongs_to :product
  accepts_nested_attributes_for :product

  validates :product, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0}
end
