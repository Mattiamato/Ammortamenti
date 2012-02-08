class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.string :desc
      t.string :status
      t.string :document
      t.references :account

      t.timestamps
    end
    add_index :payments, :account_id
  end
end
