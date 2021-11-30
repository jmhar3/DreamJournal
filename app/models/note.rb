class Note < ApplicationRecord
    has_many :notes_categories
    has_many :categories, through: :notes_categories
    belongs_to :user

    validates :content, presence: true
end