class ChangeDueDateTypeInGoals < ActiveRecord::Migration[6.1]
  def change
    change_column :goals, :due_date, :string
  end
end