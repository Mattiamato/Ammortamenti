class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :desc
      t.float :unit_price
      t.string :sn
      t.string :image

      t.timestamps
    end
  end
end
