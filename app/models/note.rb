class Note < ApplicationRecord
    has_many :notes_categories
    has_many :categories, through: :notes_categories
    belongs_to :user
    # accepts_nested_attributes_for :categories

    validates :content, presence: true

    def categories_attributes= categories
        self.categories = categories.map do |category|
            Category.find_by(name: category) || Category.create!(name: category, user_id: self.user_id)
        end
    end
end