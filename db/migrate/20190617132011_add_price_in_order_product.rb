class AddPriceInOrderProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :price, :integer
  end
end
