class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id, null: false
      t.integer :account_id, null: false
      t.integer :amount, null: false
      t.integer :payee_id
      t.string :memo
      t.boolean :cleared, default: 0

      t.timestamps null: false
    end
  end
end
