class AddCodeColumnToRegion < ActiveRecord::Migration
  def change
  	add_column :regions, :code, :string
  end
end
