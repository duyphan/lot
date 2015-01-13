class UpdateLottry < ActiveRecord::Migration
  def change
  	remove_column :lotteries, :second
  	remove_column :lotteries, :third
  	remove_column :lotteries, :fourth
  	remove_column :lotteries, :fifth
  	remove_column :lotteries, :sixth
  	remove_column :lotteries, :seventh
  	remove_column :lotteries, :eighth
  	add_column :lotteries, :eighth, :string, array: true, default: []
  	add_column :lotteries, :second, :string, array: true, default: []
  	add_column :lotteries, :third, :string, array: true, default: []
  	add_column :lotteries, :fourth, :string, array: true, default: []
  	add_column :lotteries, :fifth, :string, array: true, default: []
  	add_column :lotteries, :sixth, :string, array: true, default: []
  	add_column :lotteries, :seventh, :string, array: true, default: []
  end
end
