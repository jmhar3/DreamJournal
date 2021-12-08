class TransactionSerializer < ActiveModel::Serializer
    attributes :id, :amount, :direction, :category, :user_id, :description, :created_at
end