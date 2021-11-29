class NotesCategory < ApplicationRecord
  belongs_to :notes
  belongs_to :categories
end
