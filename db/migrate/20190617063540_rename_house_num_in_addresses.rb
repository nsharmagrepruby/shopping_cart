class RenameHouseNumInAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :house_num, :house_number
  end
end
