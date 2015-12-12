class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string 'user_id'
      t.string 'type'
      t.boolean 'default'

      t.timestamps null: false
    end
  end
end
