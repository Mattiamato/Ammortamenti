class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :city
      t.string :street
      t.string :number
      t.string :nation
      t.string :desc

      t.timestamps
    end
  end
end
