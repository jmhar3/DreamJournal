class AddUserIdToGoals < ActiveRecord::Migration[6.1]
  def change
    add_reference :goals, :user, index: true
  end
end