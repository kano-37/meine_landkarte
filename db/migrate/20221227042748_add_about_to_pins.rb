class AddAboutToPins < ActiveRecord::Migration[6.1]
  def change
    add_column :pins, :about, :text
  end
end
