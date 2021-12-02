class Goal < ApplicationRecord
    belongs_to :user

    validates :label, presence: true, length: { maximum: 30}
end