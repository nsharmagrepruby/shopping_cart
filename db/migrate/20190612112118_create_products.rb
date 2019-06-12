class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :quantity
      t.references :shop_owner, foreign_key: true
      t.references :shop, foreign_key: true
      
      t.timestamps
    end
  end
end
