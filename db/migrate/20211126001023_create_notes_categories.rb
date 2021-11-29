class CreateNotesCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :notes_categories do |t|
      t.references :notes, null: false, foreign_key: true
      t.references :categories, null: false, foreign_key: true

      t.timestamps
    end
  end
end
