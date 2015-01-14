class AddRegionIdToLottery < ActiveRecord::Migration
  def change
  	add_column :lotteries, :region_id, :integer
  end
end
