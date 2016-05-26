class AddTotalAmountOrderedToProduct < ActiveRecord::Migration
  def change
    add_column :products, :total_amount_ordered, :integer, default: 0
  end
end
