class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :number
      t.string :document
      t.references :payment
      t.references :category
      t.references :provider
      t.references :office

      t.timestamps
    end
    add_index :items, :payment_id
    add_index :items, :category_id
    add_index :items, :provider_id
    add_index :items, :office_id
  end
end
