class RemoveDocumentFromItem < ActiveRecord::Migration
  def up
    remove_column :items, :document
  end

  def down
    add_column :items, :document, :string
  end
end
