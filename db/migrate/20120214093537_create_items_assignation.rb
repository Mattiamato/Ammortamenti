class CreateItemsAssignation < ActiveRecord::Migration
  def up
	create_table :items_assignement, :id => false do |t|
      t.integer :item_id, :null => false
      t.integer :office_id, :null => false
	  t.float :number
    end
  end

  def down
    drop_table :items_assignement
  end
end
