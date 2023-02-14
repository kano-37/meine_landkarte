class AddUrlToPins < ActiveRecord::Migration[6.1]
  def change
    add_column :pins, :url, :string
  end
end
