class AddShopAddressToPins < ActiveRecord::Migration[6.1]
  def change
    add_column :pins, :shopaddress, :string
  end
end
