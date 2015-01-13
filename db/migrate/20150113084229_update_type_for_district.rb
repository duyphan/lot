class UpdateTypeForDistrict < ActiveRecord::Migration
  def change
  	remove_column :districts, :code
  	add_column :districts, :code, :string
  end
end
