class CreateUsersAccounts < ActiveRecord::Migration
  def up
	create_table :users_accounts, :id => false do |t|
      t.integer :user_id, :null => false
      t.integer :account_id, :null => false
    end

    
    add_index :users_accounts, [:user_id, :account_id], :unique => true
  end

  def down
	remove_index :users_accounts, :column => [:user_id, :account_id]
    drop_table :users_accounts
  end
end
