class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :account_id
      t.integer :amount
      t.integer :payee_id
      t.string :memo
      t.boolean :cleared

      t.timestamps null: false
    end
  end
end
