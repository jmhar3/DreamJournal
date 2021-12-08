class NoteSerializer < ActiveModel::Serializer
  attributes :id, :pinned, :content, :title, :user_id, :updated_at
  has_many :categories
end