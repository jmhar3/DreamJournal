class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :label
      t.string :priority
      t.datetime :due_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
