class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :phone
      t.text :title
      t.text :company
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
