class AddPersonToSurvey < ActiveRecord::Migration[5.0]
  def change
    add_reference :surveys, :person, index: true
  end
end
