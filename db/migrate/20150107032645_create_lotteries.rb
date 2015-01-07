class CreateLotteries < ActiveRecord::Migration
  def change
    create_table :lotteries do |t|
      t.datetime :open_date
      t.string :special
      t.string :first
      t.string :second
      t.string :third
      t.string :fourth
      t.string :fifth
      t.string :sixth
      t.string :seventh
      t.string :eighth
      t.references :district

      t.timestamps null: false
    end
  end
end
