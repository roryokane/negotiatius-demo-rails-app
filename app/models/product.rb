class Product < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  include ActiveModel::Validations
  validates_with ProductIdentifierPresenceValidator
  validates :description, length: { maximum: 200 }
  validates :current_paying_price, numericality: { greater_than: 0, less_than: 1_000_000.00 }
  validates :total_amount_ordered, numericality: { greater_than_or_equal_to: 0 }

  scope :shown_in_inventory, -> { where('total_amount_ordered > 0') }
  scope :owned_by_user, ->(user) { where(user: user) }
end
