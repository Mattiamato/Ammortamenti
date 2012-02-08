class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :family_name
      t.string :password_digest

      t.timestamps
    end
  end
end
