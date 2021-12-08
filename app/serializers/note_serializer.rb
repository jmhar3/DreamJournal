class NoteSerializer < ActiveModel::Serializer
  attributes :id, :pinned, :content, :title, :user_id
  has_many :categories
end