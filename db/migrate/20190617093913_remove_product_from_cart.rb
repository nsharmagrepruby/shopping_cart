class RemoveProductFromCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :products_id
  end
end
