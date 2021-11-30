class UpdateNotesCategoriesColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :notes_categories, :notes_id, :note_id
    rename_column :notes_categories, :categories_id, :category_id
  end
end