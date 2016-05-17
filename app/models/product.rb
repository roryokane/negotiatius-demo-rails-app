class Product < ActiveRecord::Base
  validates_with ActiveModel::Validations::ProductIdentifierPresenceValidator
  validates :description, length: { maximum: 200 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0}
  validates :current_paying_price, numericality: { greater_than: 0, less_than: 1_000_000.00 }
end
