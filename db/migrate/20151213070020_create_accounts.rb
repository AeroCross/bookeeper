class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.string :type, null: false, default: "checkings"
      t.integer :balance, null: false, defailt: 0
      t.string :currency, null: false, default: "USD"

      t.timestamps null: false
    end

    add_index :accounts, [:user_id, "type"], unique: true
  end
end
