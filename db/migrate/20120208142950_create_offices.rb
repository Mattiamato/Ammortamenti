class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :desc
      t.string :number
      t.references :building

      t.timestamps
    end
    add_index :offices, :building_id
  end
end
