class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer 'user_id'
      t.string 'type'
      t.integer 'balance'
      t.

      t.timestamps null: false
    end
  end
end
