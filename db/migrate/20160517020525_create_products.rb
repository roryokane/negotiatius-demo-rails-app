class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :url
      t.string :name
      t.string :manufacturer
      t.string :description
      t.integer :quantity
      t.decimal :current_paying_price, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
