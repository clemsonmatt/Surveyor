class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone, :null => true
      t.string :title, :null => true
      t.string :company, :null => true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
