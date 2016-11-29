class AddActiveToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :active, :boolean
  end
end
