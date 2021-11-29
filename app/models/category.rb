class Category < ApplicationRecord
    has_many :notes_categories
    has_many :notes, through: :notes_categories
    belongs_to :user
end
