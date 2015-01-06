class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :portal_code

      t.timestamps null: false
    end
  end
end
