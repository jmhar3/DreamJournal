class GoalSerializer < ActiveModel::Serializer
  attributes :id, :label, :priority, :due_date, :user_id, :completed
end