class Goal < ApplicationRecord
    belongs_to :user

    validates :goal, presence: true, length: { maximum: 30}
end