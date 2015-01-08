class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :zip
      t.integer :code
      t.references :region

      t.timestamps null: false
    end
  end
end
