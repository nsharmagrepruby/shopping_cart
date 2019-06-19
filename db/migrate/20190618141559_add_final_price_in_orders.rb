class AddFinalPriceInOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :final_price, :integer
  end
end
