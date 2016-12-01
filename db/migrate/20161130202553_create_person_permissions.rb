class CreatePersonPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :person_permissions do |t|
      t.references :person, foreign_key: true
      t.references :permission, foreign_key: true

      t.timestamps
    end
  end
end
