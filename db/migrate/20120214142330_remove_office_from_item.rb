class RemoveOfficeFromItem < ActiveRecord::Migration
  def up
    remove_column :items, :office_id
  end

  def down
    add_column :items, :office, :references
  end
end
