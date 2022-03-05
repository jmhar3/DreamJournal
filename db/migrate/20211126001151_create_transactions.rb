class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount, :precision => 20, :scale => 2
      t.string :direction
      t.string :category
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
