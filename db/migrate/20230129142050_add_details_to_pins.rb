class AddDetailsToPins < ActiveRecord::Migration[6.1]
  def change
    add_column :pins, :lat, :float
    add_column :pins, :lng, :float
  end
end
