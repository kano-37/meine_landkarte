class AddImageToPins < ActiveRecord::Migration[6.1]
  def change
    add_column :pins, :image, :string
  end
end
