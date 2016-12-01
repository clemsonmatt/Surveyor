class AddPossibleAnswersToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :possible_answers, :text
    add_column :questions, :order, :int
  end
end
