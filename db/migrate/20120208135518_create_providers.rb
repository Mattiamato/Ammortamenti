class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :city
      t.string :street
      t.string :number
      t.string :nation
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
