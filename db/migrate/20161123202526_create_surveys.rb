class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
